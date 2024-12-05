//
//  Solution21Day3.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 07/12/22.
//

import Foundation

class Solution21Day3 {
    func runDay3(input: String) -> Int {
        let bits = input.components(separatedBy: "\n").map { Array($0) }
        
        var gammaRate = ""
        var epsilonRate = ""
        
        for i in 0..<bits[0].count {
            var oneCount = 0
            var zeroCount = 0
            
            for j in 0..<bits.count {
                if bits[j][i] == "0" {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            }
            
            if oneCount > zeroCount {
                gammaRate.append("1")
                epsilonRate.append("0")
            } else {
                gammaRate.append("0")
                epsilonRate.append("1")
            }
        }
       
        let gammaRateInInt = Int(gammaRate, radix: 2)!
        let epsilonRateInInt = Int(epsilonRate, radix: 2)!

        return gammaRateInInt * epsilonRateInInt
    }
    
    func runDay3Pt2(input: String) -> Int {
        let bits = input.components(separatedBy: "\n").map { Array($0) }
        
       
        let oxygenRating = getOxygenRating(bits: bits)
        let co2Rating = getCO2Rating(bits: bits)
       
        let oxygenRatingInInt = Int(oxygenRating, radix: 2)!
        let co2RatingInInt = Int(co2Rating, radix: 2)!
        
        
        return oxygenRatingInInt * co2RatingInInt
    }
    
    func getOxygenRating(bits: [[Character]]) -> String {
        var bits = bits
        for i in 0..<bits[0].count {
            var oneCount = 0
            var zeroCount = 0
            
            for j in 0..<bits.count {
                
                if bits[j][i] == "0" {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            }
            if bits.count == 1 {  
                break
            }
            if oneCount >= zeroCount {
                bits.removeAll(where: { $0[i] == "0" })
            } else {
                bits.removeAll(where: { $0[i] == "1" })
            }
        }
        
        return String(bits[0])
    }
    
    func getCO2Rating(bits: [[Character]]) -> String {
        var bits = bits
        for i in 0..<bits[0].count {
            var oneCount = 0
            var zeroCount = 0
            
            for j in 0..<bits.count {
                
                if bits[j][i] == "0" {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            }
            if bits.count == 1 {
                break
            }
            
            if oneCount < zeroCount {
                bits.removeAll(where: { $0[i] == "0" })
            } else {
                bits.removeAll(where: { $0[i] == "1" })
            }
        }
        
        return String(bits[0])
    }
}
