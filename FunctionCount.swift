//
//  Untitled.swift
//  StudentCRUDApp_V
//
//  Created by Yitzu Liu on 13/11/2024.
//
import SwiftData
@Model
class FunctionCount {
    var name: String
    var count: Int=0
    
    init(name: String, count: Int = 0) {
        self.name = name
        self.count = count
    }
}

