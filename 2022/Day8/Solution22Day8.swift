//
//  Solution22Day8.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 08/12/22.
//

import Foundation

class Solution22Day8 {
    var distance = 0
    
    func runDay8(input: String) -> Int {
        let map = input.components(separatedBy: "\n").map { Array($0) }.map { $0.map { Int(String($0))! } }
        var visibleTrees = [Int]()
        
        for i in 0..<map.count {
            for j in 0..<map[i].count {
                let edgeCase = (i == 0 || j == 0 || (i + 1 == map.count) || (j+1 == map[i].count) )
                
                if edgeCase {
                    visibleTrees.append(map[i][j])
                    continue
                }
                
                if isVisible(i,j, map) {
                    visibleTrees.append(map[i][j])
                }
            }
        }
        
        return visibleTrees.count
    }
    
    func runDay8Pt2(input: String) -> Int {
        let map = input.components(separatedBy: "\n").map { Array($0) }.map { $0.map { Int(String($0))!}}
        var scenicScore = 0
        
        for i in 0..<map.count {
            for j in 0..<map[i].count {
                let edgeCase = ( i == 0 || j == 0 || (i + 1 == map.count) || (j + 1 == map[i].count) )
                
                if edgeCase {
                    continue
                }
                
                _ = isVisible(i,j, map)
                if distance > scenicScore { scenicScore = distance }
            }
        }
        
        return scenicScore
    }
    
    func isVisible(_ v: Int, _ h: Int, _ map: [[Int]]) -> Bool {
        
        let tree = map[v][h]
        
        var up = true
        var down = true
        var left = true
        var right = true
        
        distance = 1
        
        
        for i in (0..<h).reversed() {
            if map[v][i] >= tree {
                left = false
                distance *= (h-i)
                break
            }
        }
        
        if left {
            distance *= h
        }
        
        for i in h+1..<map[v].count {
            if map[v][i] >= tree {
                right = false
                distance *= (i-h)
                break
            }
        }
        
        if right {
            distance *= (map[v].count - (h + 1))
        }
        
        for i in (0..<v).reversed() {
            if map[i][h] >= tree {
                down = false
                distance *= (v-i)
                break
            }
        }
        
        if down {
            distance *= v
        }
        
        for i in v+1..<map.count {
            if map[i][h] >= tree {
                up = false
                distance *= (i-v)
                break
            }
        }
        
        if up {
            distance *= (map.count - (v + 1))
        }
        
        return up || down || right || left
    }
}


let mockInput = """
3 0 3 7 3
2 5 5 1 2
6 5 3 3 2
3 3 5 4 9
3 5 3 9 0
"""
