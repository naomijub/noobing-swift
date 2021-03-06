//
//  Project.swift
//  Happiness
//
//  Created by Julia Naomi Boeira on 09/04/21.
//

import Foundation

class Project {
    var name: String
    var happines: Double
    var deps: Array<Item>

    init(name: String, happines: Double, deps: Array<Item> = []) {
        self.name = name
        self.happines = happines
        self.deps = deps
    }
    
    func toString() -> String {
        let value = String(format: "%.2f", happines)
        return "Project \(name) has hapiness of \(value) and \(deps.count) dependencies"
    }
    
    func details() -> String {
        let value = String(format: "%.2f", happines)
        var details = "hapiness of \(value) \n"
        let depsStr = deps
            .map { (dep) -> String in
                "\(dep.name), version: \(dep.version)"
            }
            .joined(separator: "\n")
        
        details.append(depsStr)
        return details
    }
}
