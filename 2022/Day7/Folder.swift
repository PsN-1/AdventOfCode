//
//  Folder.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 07/12/22.
//

import Foundation

class Folder: Equatable {
    let name: String
    var files: [File]
    var folders: [Folder]
    var parentFolder: Folder?
    
    var size: Int {
        var total = 0
        for folder in folders {
            total += folder.size
        }
        let filesSize = files.reduce(0) { $0 + $1.size}
        total += filesSize
        return total
    }

    init(_ name: String, _ parentFolder: Folder? = nil, _ files: [File] = [], _ folders: [Folder] = []) {
        self.name = name
        self.parentFolder = parentFolder
        self.files = files
        self.folders = folders
    }

    static func == (lhs: Folder, rhs: Folder) -> Bool {
        return lhs.name == rhs.name
        && lhs.files == rhs.files
        && lhs.folders == rhs.folders
        && lhs.parentFolder == rhs.parentFolder
        && lhs.size == rhs.size
    }
}

