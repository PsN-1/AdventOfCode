//
//  Util.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 07/12/22.
//

import Foundation

extension String {
    var isNumber: Bool {
        return self.allSatisfy { character in
            character.isNumber
        }
    }
}
