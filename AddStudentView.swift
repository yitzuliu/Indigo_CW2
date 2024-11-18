//  AddStudentView.swift
//  StudentCRUDApp_V1
//
//  Created by Yitzu Liu on 10/11/2024.
import SwiftUI // Import SwiftUI framework for building UI
import SwiftData // Import SwiftData framework for data management

struct AddStudentView: View { // Define a view structure conforming to View protocol
    @Environment(\.dismiss) private var dismiss // Environment variable to dismiss the view
    @Environment(\.modelContext) private var context // Environment variable for database context
    
    @State private var name: String = "" // State variable for student's name
    @State private var age: Int = 0 // State variable for student's age
    
    var body: some View { // Main body of the view
        NavigationStack { // Navigation stack for managing view navigation
            Form { // Form for input fields
                TextField("Name", text: $name) // Text field for entering student's name
                TextField("Age", value: $age, format: .number) // Text field for entering student's age
                    .keyboardType(.numberPad) // Set keyboard type to number pad
            }
            .navigationTitle("New Student") // Set navigation bar title
            .toolbar { // Toolbar for navigation bar items
                ToolbarItem(placement: .navigationBarLeading) { // Toolbar item on the leading side
                    Button("Cancel") { // Cancel button
                        dismiss() // Dismiss the view
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) { // Toolbar item on the trailing side
                    Button("Save") { // Save button
                        addStudent() // Call function to add student
                        dismiss() // Dismiss the view
                    }
                }
            }
        }
        
    }
    
    
    private func addStudent() { // Private function to add a student
        let newStudent = Student(name: name, age: age) // Create a new Student instance
        context.insert(newStudent) // Insert new student into the context
        try? context.save() // Attempt to save changes in the context
    }
}
