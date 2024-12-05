//
//  SolutionDay1.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 07/12/22.
//

import Foundation

class Solution21Day1 {
    func runDay1(input: String) -> Int {
        let measurements = input.components(separatedBy: "\n")
        var count = 0
        
        var prevMeasurement = Int.max
        for measurement in measurements {
            if Int(measurement)! > prevMeasurement {
                count += 1
            }
            prevMeasurement = Int(measurement)!
        }
        
        print(count)
        return count
    }
    
    func runDay1Pt2(input: String) -> Int {
        let measurements = input.components(separatedBy: "\n").map { Int($0)! }
        var count = 0
        
        var prevWindow = Int.max
        for i in 0..<measurements.count {
            if i+2 >= measurements.count {
                break
            }
            
            let m1 = measurements[i]
            let m2 = measurements[i+1]
            let m3 = measurements[i+2]
            let window = m1+m2+m3
            print(window)
            
            if window > prevWindow {
                count += 1
            }
            prevWindow = window
            
        }
        
        print(count)
        return count
    }
}
