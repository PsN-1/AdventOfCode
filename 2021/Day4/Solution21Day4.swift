//
//  Solution21Day4.swift
//  AdventOfCodeTests
//
//  Created by Pedro Neto on 07/12/22.
//

import Foundation

class Solution21Day4 {
    var boardWinner = [[String]]()
    var boardWinnerIndex = 0
    var lastDraw = ""
   
    func runDay4Pt2(_ input: String, _ input2: String) -> Int {
        let cards = input.components(separatedBy: "\n")
        let numbersDraw = input2.components(separatedBy: ",")
        
        var boards = makeBoardsWith(cards)
        
        while boards.count >= 1 {
            winnerBoard(numbersDraw, &boards)
            boards.remove(at: boardWinnerIndex)
        }
        
        let sumOfRemaningNumbers = getSumOfRemainingNumber()
        
        return sumOfRemaningNumbers * Int(lastDraw)!
    }
    
    func runDay4(_ input: String, _ input2: String) -> Int {
        let cards = input.components(separatedBy: "\n")
        let numbersDraw = input2.components(separatedBy: ",")
        
        var boards = makeBoardsWith(cards)
       
        winnerBoard(numbersDraw, &boards)
        
        let sumOfRemaningNumbers = getSumOfRemainingNumber()
        
        return sumOfRemaningNumbers * Int(lastDraw)!
    }
    
    func getSumOfRemainingNumber() -> Int {
        var sum = 0
        for line in boardWinner {
            for char in line {
                if char != "x" {
                  sum += Int(char)!
                }
            }
        }
        return sum
    }
    
    func winnerBoard(_ numbersDraw: [String], _ boards: inout [[[String]]]) {
        for draw in numbersDraw {
            
            for i in 0..<boards.count {
                for j in  0..<boards[i].count {
                    for k in 0..<boards[i][j].count {
                        if boards[i][j][k] == draw {
                            boards[i][j][k] = "x"
                            if checkWinner(boards) {
                                lastDraw = draw
                                return
                            }
                        }
                    }
                }
            }
        }
    }
    
    func checkWinner(_ boards: [[[String]]]) -> Bool {
        for i in 0..<boards.count {
            for j in 0..<boards[i].count {
                
                var countHorizontal = 0
                var countVertical = 0
                
                for k in 0..<boards[i][j].count {
                    if boards[i][j][k] == "x" {
                        countHorizontal += 1
                    }
                    
                    if boards[i][k][j] == "x" {
                        countVertical += 1
                    }
                }
                
                if countHorizontal == 5 || countVertical == 5 {
                    boardWinner = boards[i]
                    boardWinnerIndex = i
                    return true
                }
            }
        }
        
        return false
    }
    
    func makeBoardsWith(_ cards: [String]) -> [[[String]]] {
        var boards = [[String]]()
        var board = [String]()
        var newBoards = [[[String]]]()
        
        for card in cards {
            if card != "" {
                board.append(card)
            } else {
                boards.append(board)
                board = []
            }
        }
        boards.append(board)
        
        newBoards = boards.map { $0.map { $0.components(separatedBy: " ").filter( { $0 != "" }) } }
        
        return newBoards
    }
}
