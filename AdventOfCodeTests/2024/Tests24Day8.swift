import XCTest

typealias Antenas = [Antena]
struct Antena {
    let id: Character
    var coordinates: [(Int, Int)] = []
    
    init(id: Character, coordinates: [(Int, Int)]) {
        self.id = id
        self.coordinates = coordinates
    }
    
    init(id: Character, coordinates: (Int, Int)) {
        self.id = id
        self.coordinates.append(coordinates)
    }
}

class Tests24Day8: XCTestCase {
    func testDay2Example() { solutionDay8(input: inputExample, expected: 14) }
    func testDay2() { solutionDay8(input: input, expected: 341) }
    func testDay2Pt2Example() { solutionDay8Pt2(input: inputExample, expected: 34) }
    func testDay2Pt2() { solutionDay8Pt2(input: input, expected: 1134) }
    
 
    func solutionDay8Pt2(input: String, expected: Int) {
        var input = input.components(separatedBy: "\n").map { Array($0) }
        let antenas = mapAntenas(input)
        var count = 0
        
        var prevNode = (0,0)
        var nextNode = (0,0)
        var outOne = false
        var outTwo = false
        var countOne = 0
        var countTwo = 0
        
        for antena in antenas {
            for i in 0..<antena.coordinates.count {
                for j in 0..<antena.coordinates.count-1 {
                    guard i != j else { continue }
//                    print(" ")
                    let distance = (antena.coordinates[j].0 - antena.coordinates[i].0, antena.coordinates[j].1 - antena.coordinates[i].1)
//                    print(distance)
                    prevNode = (antena.coordinates[i].0 - distance.0, antena.coordinates[i].1 - distance.1)
//                    print(prevNode)
                    nextNode = (distance.0 + antena.coordinates[j].0, distance.1 + antena.coordinates[j].1)
//                    print(nextNode)
                    
                    outOne = false
                    outTwo = false
                    countOne = 0
                    countTwo = 0
                    
//                    print("distance: \(distance), prev: \(prevNode) - \(outOne), next: \(nextNode) - \(outTwo)")
                    while true {
                        if prevNode.0 >= 0 && prevNode.1 >= 0 && prevNode.0 < input.count && prevNode.1 < input[0].count  {
                            input[prevNode.0][prevNode.1] = "#"
                            countOne += 1
                        } else {
                            outOne = true
                        }
                        
                        if nextNode.0 >= 0 && nextNode.1 >= 0 && nextNode.0 < input.count && nextNode.1 < input[0].count  {
                            input[nextNode.0][nextNode.1] = "#"
                            countTwo += 1
                        } else {
                            outTwo  = true
                        }
                        
                        prevNode = (prevNode.0 - distance.0, prevNode.1 - distance.1)
                        nextNode = (distance.0 + nextNode.0, distance.1 + nextNode.1)
//                        print("distance: \(distance), prev: \(prevNode) - \(outOne), next: \(nextNode) - \(outTwo)")
                        if countOne >= 1 || countTwo >= 2 {
                            input[antena.coordinates[j].0][antena.coordinates[j].1] = "#"
                        }
                        
                        if countTwo >= 1 || countOne >= 2 {
                            input[antena.coordinates[i].0][antena.coordinates[i].1] = "#"
                        }
                        if outOne && outTwo { break }
                    }
                }
            }
        }
        
        
        for i in 0..<input.count {
            for j in 0..<input[i].count {
                guard input[i][j] != "." else { continue }
            }
        }
        
        for i in 0..<input.count {
            for j in 0..<input[i].count {
                if input[i][j] != "." { count += 1 }
            }
        }
        
        for antena in antenas {
            if antena.coordinates.count == 1 {
               count -= 1
            }
        }
        
        func pretty() {
            print("")
            
            for line in input {
                var word = ""
                for char in line {
                    word.append(char)
                }
                print(word)
            }
            print("")
        }
//        pretty()
        
        XCTAssertEqual(count, expected)
    }
    
    func solutionDay8(input: String, expected: Int) {
        var input = input.components(separatedBy: "\n").map { Array($0) }
        let antenas = mapAntenas(input)
        var count = 0
        
        for antena in antenas {
            for i in 0..<antena.coordinates.count {
                for j in 0..<antena.coordinates.count-1 {
                    guard i > j else { continue }
//                    print(" ")
                    let distance = (antena.coordinates[j].0 - antena.coordinates[i].0, antena.coordinates[j].1 - antena.coordinates[i].1)
//                    print(distance)
                    let prevNode = (antena.coordinates[i].0 - distance.0, antena.coordinates[i].1 - distance.1)
//                    print(prevNode)
                    let nextNode = (distance.0 + antena.coordinates[j].0, distance.1 + antena.coordinates[j].1)
//                    print(nextNode)
                    
                    if prevNode.0 >= 0 && prevNode.1 >= 0 && prevNode.0 < input.count && prevNode.1 < input[0].count  {
                        input[prevNode.0][prevNode.1] = "#"
                    }
                    
                    if nextNode.0 >= 0 && nextNode.1 >= 0 && nextNode.0 < input.count && nextNode.1 < input[0].count  {
                        input[nextNode.0][nextNode.1] = "#"
                    }
                }
            }
        }
        for i in 0..<input.count {
            for j in 0..<input[i].count {
                if input[i][j] == "#" { count += 1}
            }
        }
        
//        print(input)
//        pretty()
//        print(count)
        XCTAssertEqual(count, expected)
        
        func pretty() {
            print("")
            
            for line in input {
                var word = ""
                for char in line {
                    word.append(char)
                }
                print(word)
            }
            print("")
        }
    }
    
    
    func mapAntenas(_ input: [[Character]]) -> Antenas {
        var antenas = Antenas()
        for a in 0..<input.count {
            for b in 0..<input[a].count {
                guard input[a][b] != "." else { continue }
                if let index = antenas.firstIndex(where: { $0.id == input[a][b] }) {
                    antenas[index].coordinates.append((a,b))
                } else {
                    antenas.append(Antena(id: input[a][b], coordinates: (a,b)))
                }
            }
        }
        return antenas
    }
    
    
    let inputExample = """
............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............
"""
    
    let input = """
.......................V.........e...O............
..........q.pj8...............................u...
...................8..............................
.............8.....6.................J....l....u..
........................6................J..Z..B..
......e.........E...........................O.J...
......Jq..........................5...............
...............E...........e.Q..5.f...............
..............................Q..A.....f..B.....O.
....V...................j.....Af..................
............8......n..............l...f....Z7.....
...............n..........4........A........BD....
...........j...................Q..z.......R....l..
N.........6....q.....3....n.........D...........Z.
.............a.6..3.F........D..I.................
.............03.................Q.......h...2.....
......................A.u.......................m.
.V........F......L.............5..........z.R....Z
.......N....q.................n.......L.E.........
..................M.........y.....................
......N............................m.L..y........R
.o....................L...........I...7..R........
......o..........9..............2.......D.........
..od.............y...........................I....
d........3.....M...........E.............I........
......X.W....................p.2.....7...z....s...
V......o........M.....9.................G......7..
.................M.....................h..0....m..
.......d.......F......p.........s.h........z......
..r..........Y.i................9............s....
.....W..a.Y..........y.............p..............
.....g.......r........w...........................
....r.....b...............g........x.s.....h......
....a.....d.......................................
.....................S.......w.............1......
..Y...............................H...............
...b...........Y........................e..t...0.v
..........i..........w.........9....T........v....
.................U...........2....................
.........S........t......T........................
....................U..................Gt.........
....U...S..........................P.....1.B......
.r...X............w.......P.....x.j...............
...W......x..b........g........F.....a............
S.i.................................1.......H.....
.......U......b......x.....X..........G.1.........
...i....X....................P..4........H........
.................................H................
......W...................T4...g................v.
..........................v........GP..4.....t....
"""
}
