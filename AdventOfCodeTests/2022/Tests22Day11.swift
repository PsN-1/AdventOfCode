//
//  Tests22Day11.swift
//  AdventOfCodeTests
//
//  Created by Pedro Neto on 20/12/22.
//

import XCTest
@testable import AdventOfCode

final class Tests22Day11: XCTestCase {
    
    func testExampleDay11() {
        let sut = Solution22Day11()
        let result = sut.runDay11(mockInput, 20, true)
        
        XCTAssertEqual(result, 10605)
    }
    
    func testDay11() {
        let sut = Solution22Day11()
        let result = sut.runDay11(input, 20, true)
        
        XCTAssertEqual(result, 98280)
    }
    
    func testExampleDay11Pt2() {
        let sut = Solution22Day11()
        let result = sut.runDay11(mockInput, 10_000, false)
        
//       TODO: XCTAssertEqual(result, 2713310158)
    }
    let mockInput = [
        Monkey(items: [79, 98], operation: { $0 * 19 }, testResult: { $0.truncatingRemainder(dividingBy: 23) == 0 }, tests: (true: 2, false: 3)),
        Monkey(items: [54, 65, 75, 74], operation: { $0 + 6 }, testResult: { $0.truncatingRemainder(dividingBy: 19) == 0 }, tests: (true: 2, false: 0)),
        Monkey(items: [79, 60, 97], operation: { $0 * $0 }, testResult: { $0.truncatingRemainder(dividingBy: 13) == 0 }, tests: (true: 1, false: 3)),
        Monkey(items: [74], operation: { $0 + 3 }, testResult: { $0.truncatingRemainder(dividingBy: 17) == 0 }, tests: (true: 0, false: 1))
    ]
    
    let input = [

        Monkey(items: [56,52,58,96,70,75,72], operation: { $0 * 17 }, testResult: { $0.truncatingRemainder(dividingBy: 11) == 0 }, tests: (true: 2, false: 3)),
        Monkey(items: [75, 58, 86,80,55,81], operation: { $0 + 7 }, testResult: { $0.truncatingRemainder(dividingBy: 3) == 0 }, tests: (true: 6, false: 5)),
        Monkey(items: [73, 68, 73,90], operation: { $0 * $0 }, testResult: { $0.truncatingRemainder(dividingBy: 5) == 0 }, tests: (true: 1, false: 7)),
        Monkey(items: [72, 89, 55,51, 59], operation: { $0 + 1 }, testResult: { $0.truncatingRemainder(dividingBy: 7) == 0 }, tests: (true: 2, false: 7)),
        Monkey(items: [76, 76, 91], operation: { $0 * 3 }, testResult: { $0.truncatingRemainder(dividingBy: 19) == 0 }, tests: (true: 0, false: 3)),
        Monkey(items: [88], operation: { $0 + 4 }, testResult: { $0.truncatingRemainder(dividingBy: 2) == 0 }, tests: (true: 6, false: 4)),
        Monkey(items: [64, 63, 56, 50, 77, 55, 55, 86], operation: { $0 + 8 }, testResult: { $0.truncatingRemainder(dividingBy: 13) == 0 }, tests: (true: 4, false: 0)),
        Monkey(items: [79, 58], operation: { $0 + 6 }, testResult: { $0.truncatingRemainder(dividingBy: 17) == 0 }, tests: (true: 1, false: 5)),
    ]
}
