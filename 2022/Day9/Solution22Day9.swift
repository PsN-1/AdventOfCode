//
//  SolutionDay9.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 09/12/22.
//

import Foundation

extension Solution22Day9 {
    enum Direction: String {
        case up = "U"
        case down = "D"
        case left = "L"
        case right = "R"
    }
}

class Solution22Day9 {
    func runDay9(input: String) -> Int {
        let movs = input.components(separatedBy: "\n").map { $0.components(separatedBy: " ")}
        let (startPoint, arraySize) = getArraySizeAndStartPointFor(movs)
        let (height, width) = arraySize
        
        print("start point: \(startPoint) ")
        print(height, width)
        
        var arr = [[String]]()
        
        for _ in 0..<height {
            arr.append(Array(repeating: ".", count: width))
        }
        
        move(startPoint, movs, &arr)
        
        var tailCount = 0
        arr.forEach { row in
            print(row)
            for char in row {
                if char == "X" { tailCount += 1 }
            }
        }
        
        return tailCount
    }
    
    func runDay9Pt2(input: String) -> Int {
        let movs = input.components(separatedBy: "\n").map { $0.components(separatedBy: " ")}
        let (startPoint, arraySize) = getArraySizeAndStartPointFor(movs)
        let (height, width) = arraySize
        
        print("start point: \(startPoint) ")
        print(height, width)
        
        var arr = [[String]]()
        
        for _ in 0..<height {
            arr.append(Array(repeating: ".", count: width))
        }
        
        movePt2(startPoint, movs, &arr)
        
        var tailCount = 0
        arr.forEach { row in
            print(row)
            for char in row {
                if char == "X" { tailCount += 1 }
            }
        }
        
        return tailCount
    }
    
    func movePt2(_ startPoint: (Int, Int), _ movs: [[String]], _ arr: inout [[String]]) {
        var head = startPoint
        
        var longTail: [(Int,Int)] = .init(repeating: startPoint, count: 9) {
            didSet {
                if oldValue[8] != longTail[8] {
                    arr[longTail[8].0][longTail[8].1] = "X"
                }
            }
        }
        
        var prevDirections: Direction = .up
        var prevMov = (0,0)
        
        arr[startPoint.0][startPoint.1] = "X"
        
        for mov in movs {
            for _ in 0..<Int(mov[1])! {
                let direction = Direction(rawValue: mov[0])!
                
                for x in 0..<longTail.count {
                    if x + 1 == longTail.count { break }
                    if x >= Int(mov[1])! { break }
                    if x == 0 {
                        prevMov = head
                        head = move(direction, head.0, head.1, &longTail[0])
                        arr[head.0][head.1] = "H"
                        continue
                    }
                    
                    prevDirections = getPrevDirection(curMov: head, prevMov: prevMov)
                    
                    moveTail(prevDirections, longTail[x].0, longTail[x].1, &longTail[x+1])
                    arr[longTail[x+1].0][longTail[x+1].1] = "\(x)"
                    
                    prevDirections = getPrevDirection(curMov: longTail[x], prevMov: longTail[x+1])
                    
                    print(mov, direction, x)
                    printMatrix(arr)
                }
            }
        }
    }
    
    func getPrevDirection(curMov: (Int, Int), prevMov: (Int, Int)) -> Direction {
        if curMov.0 < prevMov.0 { return .up }
        if curMov.0 > prevMov.0 { return .down }
        if curMov.1 < prevMov.1 { return .left }
        if curMov.1 > prevMov.1 { return .right }
        
        return .up // If should be a fatalError(), but what if it doesn't move?
    }
    
    func printMatrix(_ arr: [[String]]) {
        for row in arr {
            print(row)
        }
        print("")
    }
    
    func move(_ direction: Direction, _ i: Int, _ j: Int, _ tail: inout(Int, Int) ) -> (Int, Int){
        switch direction {
        case .up: return moveUp(i, j, &tail)
        case .down: return moveDown(i, j, &tail)
        case .left: return moveLeft(i, j, &tail)
        case .right: return moveRight(i, j, &tail)
        }
    }
   
    // MARK: - Move Tail
    
    func moveTail(_ direction: Direction, _ i: Int, _ j: Int, _ tail: inout(Int, Int) ) {
        switch direction {
        case .up:  moveTailUp(i, j, &tail)
        case .down:  moveTailDown(i, j, &tail)
        case .left:  moveTailLeft(i, j, &tail)
        case .right:  moveTailRight(i, j, &tail)
        }
    }
    
    func moveTailUp(_ i: Int, _ j: Int, _ tail: inout(Int, Int)) {
        if knotDistanceIsGreaterThanOne(i, tail.0) {
            tail = (i+1, j)
        }
    }
    
    func moveTailDown(_ i: Int, _ j: Int, _ tail: inout(Int, Int)) {
        if knotDistanceIsGreaterThanOne(i, tail.0) {
            tail = (i-1, j)
        }
    }
    
    func moveTailLeft(_ i: Int, _ j: Int, _ tail: inout(Int, Int)) {
        if knotDistanceIsGreaterThanOne(j, tail.1) {
            tail = (i, j+1)
        }
    }
    
    func moveTailRight(_ i: Int, _ j: Int, _ tail: inout(Int, Int)) {
        if knotDistanceIsGreaterThanOne(j, tail.1) {
            tail = (i, j-1)
        }
    }
    
    // MARK: - Move Head
    
    func moveUp(_ i: Int, _ j: Int, _ tail: inout(Int, Int)) -> (Int, Int) {
        if knotDistanceIsGreaterThanOne(i-1, tail.0) {
            tail = (i, j)
        }
        return (i-1,j)
    }
    
    func moveDown(_ i: Int, _ j: Int, _ tail: inout(Int, Int)) -> (Int, Int) {
        if knotDistanceIsGreaterThanOne(i+1, tail.0) {
            tail = (i, j)
        }
        return (i+1,j)
    }
    
    func moveLeft(_ i: Int, _ j: Int, _ tail: inout(Int, Int)) -> (Int, Int) {
        if knotDistanceIsGreaterThanOne(j-1, tail.1) {
            tail = (i, j)
        }
        return (i,j-1)
    }
    
    func moveRight(_ i: Int, _ j: Int, _ tail: inout(Int, Int)) -> (Int, Int){
        if knotDistanceIsGreaterThanOne(j+1, tail.1) {
            tail = (i, j)
        }
        return (i,j+1)
    }
    
    func knotDistanceIsGreaterThanOne(_ a: Int, _ b: Int) -> Bool {
        max(a, b) - min(a, b) > 1
    }
    
    
    // MARK: - Part 1
    
    func move(_ startPoint: (Int, Int), _ movs: [[String]], _ arr: inout [[String]]) {
        var head = startPoint
        var tail: (Int, Int) = startPoint {
            didSet { arr[tail.0][tail.1] = "X" }
        }
        
        for mov in movs {
            for _ in 0..<Int(mov[1])! {
                
                let direction = Direction(rawValue: mov[0])!
                head = move(direction, head.0, head.1, &tail)
            }
        }
    }
    
    func getArraySizeAndStartPointFor(_ movs: [[String]]) -> ((Int, Int), (Int, Int)) {
        var height = 0
        var maxHeight = 0
        var minHeight = 0
        
        var width = 0
        var maxWidth = 0
        var minWidth = 0
        
        for mov in movs {
            if mov[0] == "U" { height -= Int(mov[1])! }
            if mov[0] == "D" { height += Int(mov[1])! }
            if mov[0] == "L" { width -= Int(mov[1])! }
            if mov[0] == "R" { width += Int(mov[1])! }
            
            maxHeight = max(maxHeight, height)
            minHeight = min(minHeight, height)
            
            maxWidth = max(maxWidth, width)
            minWidth = min(minWidth, width)
        }
        
        let arraySize = (maxHeight + abs(minHeight) + 1, maxWidth + abs(minWidth) + 1)
        
        let startHeight = abs(minHeight)
        let startWidth = abs(minWidth)
        
        let startPoint = (startHeight, startWidth)
        
        return (startPoint, arraySize)
    }
}

