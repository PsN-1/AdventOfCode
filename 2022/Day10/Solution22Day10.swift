//
//  Solution22Day10.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 18/12/22.
//

import Foundation

struct Instruction: Identifiable {
    let id = UUID()
    var value: Int
    private var cyclesRemaining = 2
    
    var finished: Bool {
        cyclesRemaining <= 0
    }
    
    init(_ value: String) {
        self.value = Int(value)!
    }
    
    mutating func completeOneCycle() {
        cyclesRemaining -= 1
    }
}

typealias Instructions = [Instruction]

extension Instructions {
    mutating func completeOneCycle() {
        if let index = self.firstIndex(where: { !$0.finished }) {
            self[index].completeOneCycle()
        }
    }
    
    mutating func computeTo(_ register: Int) -> Int {
        var register = register
        
        for instruction in self {
            if instruction.finished {
                register += instruction.value
                
                self.removeAll(where: { $0.id == instruction.id })
            }
        }
        
        return register
    }
}

class Solution22Day10 {
    func createScreen() -> [[String]] {
        var arr = [[String]]()
        
        for _ in 0..<6 {
            arr.append(Array(repeating: ".", count: 40))
        }
        
        return arr
    }
    
    func runDay10(input: String) -> Int {
        var instructions = input.components(separatedBy: "\n")
        var instructionsQueue = Instructions()
        
        var screen = createScreen()
        
        var cycleCount = 0
        var registerValue = 1
        var strength = 0
        
        while true {
            let spritePosition = ClosedRange(uncheckedBounds: (lower: registerValue - 1, upper: registerValue + 1))
            if spritePosition.contains(cycleCount%40) {
                let i = cycleCount / 40
                let j = cycleCount % 40
                screen[i][j] = "#"
            }
            
            cycleCount += 1
            
            if interestedCycle(cycleCount) {
                strength += (cycleCount * registerValue)
            }
            
            if instructionsQueue.isEmpty {
                let instruction = instructions.removeFirst()
                
                if instruction != "noop" {
                    let newInstruction = instruction.components(separatedBy: " ")
                    instructionsQueue.append(Instruction(newInstruction[1]))
                }
            }
            
            instructionsQueue.completeOneCycle()
            registerValue = instructionsQueue.computeTo(registerValue)
            
            if instructionsQueue.isEmpty && instructions.isEmpty { break }
        }
        
        printMessageFrom(screen)
        return strength
    }
    
    func printMessageFrom(_ screen: [[String]]) {
        for arr in screen {
            print(arr.compactMap { $0 as String }.joined())
        }
    }
    
    func interestedCycle(_ count: Int) -> Bool {
        return count == 20
        || count == 60
        || count == 100
        || count == 140
        || count == 180
        || count == 220
    }
}

