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
    init(name: String, happines: Double) {
        self.name = name
        self.happines = happines
    }
    
    func toString() -> String {
        "Project \(name) has hapiness of \(happines)"
    }
    
}
