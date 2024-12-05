//
//  SolutionDay7.swift
//  AdventOfCode
//
//  Created by Pedro Neto on 07/12/22.
//

import Foundation

class Solution22Day7 {
    let rootFolder = Folder("/")
    
    var currentFolder: Folder
    var foldersDesc = [Folder]()
    var foldersize = 0
    
    init() {
        currentFolder = rootFolder
    }
    
    @discardableResult func runDay7(input: String) -> Int {
        let commands = input.components(separatedBy: "\n")
        
        for command in commands {
            let currentCommand = command.components(separatedBy: " ")
            perform(currentCommand)
        }
        
        getFolderSizes(rootFolder)

        let totalSpace = 70000000
        let updateSize = 30000000
        let availableSpace = totalSpace - rootFolder.size
        let toFreeSpace = updateSize - availableSpace
        
        var sizes = foldersDesc.map { $0.size }
        sizes.sort()
        
        let enoughSize = sizes.first(where: {$0 > toFreeSpace })!
        print(enoughSize)
        return enoughSize
    }
    
    func perform(_ currentCommand: [String]) {
        if currentCommand.first == "$" {
            if currentCommand[1] == "cd" {
                if currentCommand[2] == ".." {
                    currentFolder = currentFolder.parentFolder!
                    return
                }
                
                guard currentCommand[2] != "/" else { return }
                
                currentFolder = currentFolder.folders.first { $0.name == currentCommand[2] }!
            }
        }
        
        if currentCommand[0] == "dir" {
            currentFolder.folders.append(Folder(currentCommand[1], currentFolder))
        }
        
        if currentCommand[0].isNumber {
            currentFolder.files.append(File(name: currentCommand[1], size: Int(currentCommand[0])!))
        }
    }
    
    func getFolderSizes(_ folder: Folder) {
        var currentFolder = folder
        while !currentFolder.folders.isEmpty {
            for folder in currentFolder.folders {
                currentFolder = folder
                if !foldersDesc.contains(currentFolder) {
                    foldersDesc.append(currentFolder)
                }
                getFolderSizes(currentFolder)
            }
        }
        
        if !foldersDesc.contains(rootFolder) {
            foldersDesc.append(rootFolder)
        }
        
        foldersize = foldersDesc.reduce(0) { total, folder in
            if folder.size <= 100000 {
                return total + folder.size
            }
            return total
        }
    }
    
    
    func printFolder(_ folder: Folder) {
        let folders = folder.folders.map { $0.name }
        print("name: \(folder.name), folders: \(folders), files: \(folder.files), folder size: \(folder.size)")
    }
}



