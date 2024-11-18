// Student.swift
// StudentCRUDApp_V1
//
// Created by Yitzu Liu on 10/11/2024.
//

import Foundation // Import Foundation framework for basic data types and collections
import SwiftData // Import SwiftData framework for data management

@Model // Annotation to indicate that this class is a model for data management
class Student: Identifiable { // Define a class named Student that conforms to Identifiable protocol
    var name: String // Variable to hold the student's name
    var age: Int // Variable to hold the student's age
    
    init(name: String, age: Int) { // Initializer for the Student class
        self.name = name // Assign the passed name to the name variable
        self.age = age // Assign the passed age to the age variable
    }
}
