import Foundation

let mockInput = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""


var array = mockInput.components(separatedBy: "\n")

var camps = array
    .flatMap( { $0.components(separatedBy: ",")})
    .map({ $0.components(separatedBy: "-") })    
    .map({ ClosedRange(uncheckedBounds: (lower: Int($0[0])!, upper: Int($0[1])!))})

var count = 0

var allcamps = camps

for camp in camps {
    for innerCamp in allcamps {
        if innerCamp == camp { continue }
        if camp.contains(innerCamp) {
            print("camp \(camp), innerCamp \(innerCamp)")
            count += 1
        }
    }
   allcamps.removeFirst() 
}

print(count)


