import XCTest



class Tests24Day11: XCTestCase {
    func testDay11Example() { solutionDay11(input: inputExample, interations: 25, expected: 55312) }
    func testDay11Example2() { solutionDay11(input: inputExample, interations: 6, expected: 22) }
    func testDay11Example3() { solutionDay11(input: inputExample2, interations: 1, expected: 7) }
    func testDay11() { solutionDay11(input: input, interations: 25, expected: 203609) }
//    func testDay11Pt2() { solutionDay11(input: input, interations: 75, expected: 209493) }
    
    func solutionDay11(input: String, interations: Int, expected: Int) {
        var input = input.components(separatedBy: " ")
        var res = [String]()
        for iteration in 0..<interations {
            var i = 0
            res = []
            while i < input.count {
                if input[i] == "0" {
                    input[i] = "1"
                } else if input[i].count.isMultiple(of: 2){
                    let size = input[i].count / 2
                    var newStone1 = String(input[i].prefix(size))
                    var newStone2 = String(input[i].suffix(size))
                    
//                    if newStone1.allSatisfy({ $0 == "0" }) { newStone1 = "0" }
                    while newStone1.first == "0" && newStone1.count > 1 { newStone1.removeFirst() }
                    
//                    if newStone2.allSatisfy({ $0 == "0" }) { newStone2 = "0" }
                    while newStone2.first == "0" && newStone2.count > 1 { newStone2.removeFirst() }

                    input[i] = newStone1
                    res.append(newStone2)
                } else {
                    input[i] = String(Int(input[i])! * 2024)
                }
                i += 1
            }
            input.append(contentsOf: res)
            print(iteration)
        }
        
        XCTAssertEqual(input.count, expected)
    }
    
    let inputExample2 = "0 1 10 99 999"
    let inputExample = "125 17"
    
    let input = "5 89749 6061 43 867 1965860 0 206250"
}

