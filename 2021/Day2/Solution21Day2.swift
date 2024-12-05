//
//  Solution21Day2.swift
//  AdventOfCodeTests
//
//  Created by Pedro Neto on 07/12/22.
//

import Foundation

class Solution21Day2 {
    func runDay2(input: String) -> Int{
        let course = input.components(separatedBy: "\n")
        let commands = course.map { $0.components(separatedBy: " ") }
        
        var horizontalPosition = 0
        var depth = 0
        
        for command in commands {
            if command[0] == "forward" {
                horizontalPosition += Int(command[1])!
            }
            
            if command[0] == "down" {
                depth += Int(command[1])!
            }
            
            if command[0] == "up" {
                depth -= Int(command[1])!
            }
        }
        
        print(horizontalPosition * depth)
        return horizontalPosition * depth
    }
    
    func runDay2Pt2(input: String) -> Int{
        let course = input.components(separatedBy: "\n")
        let commands = course.map { $0.components(separatedBy: " ") }
        
        var horizontalPosition = 0
        var depth = 0
        var aim = 0
        
        for command in commands {
            if command[0] == "forward" {
                horizontalPosition += Int(command[1])!
                depth += (aim * Int(command[1])!)
            }
            
            if command[0] == "down" {
                aim += Int(command[1])!
            }
            
            if command[0] == "up" {
                aim -= Int(command[1])!
            }
        }
        
        print(horizontalPosition * depth)
        return horizontalPosition * depth
    }
}
