//
//  Solution22Day11.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 20/12/22.
//

import Foundation

class Solution22Day11 {
    func runDay11(_ monkeys: [Monkey], _ maxRounds: Int, _ isDivisibleBy3: Bool) -> Int {
        var monkeys = monkeys
       var rounds = 0
        
        while rounds < maxRounds {
            for i in 0..<monkeys.count {
                let monkey = monkeys[i]
                
                for item in monkey.items {
                    monkeys[i].inspections += 1
                    
                    let divisor: Double = isDivisibleBy3 ? 3 : 1
                    let newWorryLevel = floor(monkey.operation(item) / divisor)
                    
                    print("newWorryLevel", newWorryLevel)
                    
                    if monkey.testResult(newWorryLevel) {
                        monkeys[monkey.tests.true].items.append(newWorryLevel)
                    } else {
                        monkeys[monkey.tests.false].items.append(newWorryLevel)
                    }
                }
                
                monkeys[i].items = []
            }
            rounds += 1
        }
        
        let inspections = monkeys.map { $0.inspections }.sorted()
        let result = inspections.last! * inspections[inspections.count-2]
        
        
        for monkey in monkeys {
            print(monkey.items)
        }
        print(inspections)
        print(result)
        return result
    }
}

struct Monkey {
    var items: [Double]
    var inspections = 0
    let operation: (Double) -> Double
    let testResult: (Double) -> Bool
    let tests: (true: Int, false: Int)

}



fileprivate let mockInput523 = [
    Monkey(items: [79, 98], operation: { $0 * 19 }, testResult: { $0 / 23 == 0 }, tests: (true: 2, false: 3)),
    Monkey(items: [54, 65, 75, 74], operation: { $0 + 6 }, testResult: { $0 / 19 == 0 }, tests: (true: 2, false: 0)),
    Monkey(items: [79, 60, 97], operation: { $0 * $0 }, testResult: { $0 / 13 == 0 }, tests: (true: 1, false: 3)),
    Monkey(items: [74], operation: { $0 + 3 }, testResult: { $0 / 17 == 0 }, tests: (true: 0, false: 1))
]

