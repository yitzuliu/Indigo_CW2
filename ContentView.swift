////
////  ContentView.swift
////  StudentCRUDApp_V
////
////  Created by Yitzu Liu on 10/11/2024.
////
//import SwiftUI // Import SwiftUI framework for building user interfaces
//import SwiftData // Import SwiftData framework for data management
//
//
//struct ContentView: View { // Define a structure named ContentView that conforms to the View protocol
//    @Environment(\.modelContext) private var context // Get the environment variable for the database context
//    
//    @Query private var studentList: [Student] // Query to retrieve the list of students
//    @State private var showAddStudentSheet = false // State variable to control the display of the add student view
//    
//    
//    @Query var functionCounts: [FunctionCount]
//    
//    let functionNames = ["Function A", "Function B", "Function C"]
//    
//    var body: some View { // Define the main body of the view
//        
//        VStack(spacing: 20) {
//            // Debug button to print database location
//            Button("Show Database Location") {
//                printDatabaseLocation()
//            }
//            .padding()
//            .background(Color.green.opacity(0.2))
//            .cornerRadius(10)
//            
//            // Function buttons with counts
//            ForEach(functionNames, id: \.self) { name in
//                Button(action: {
//                    incrementCount(for: name)
//                }) {
//                    HStack {
//                        Text(name)
//                        Spacer()
//                        Text("Count: \(getCount(for: name))")
//                        Image(systemName: "plus.circle.fill")
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                }
//            }
//        }
//        .padding()
//        .onAppear {
//            initializeFunctionsIfNeeded()
//        }
//        
//        // Add a button in the body of ContentView to trigger:
//        Button("Print DB Location") { // Button to print the database location
//            printDatabaseLocation() // Call the function to print the database location
//        }
//        
//        NavigationStack { // Use NavigationStack to manage view navigation
//            List { // Use List to display the list of students
//                ForEach(studentList) { student in // Iterate over the student list
//                    HStack { // Use HStack to arrange elements horizontally
//                        NavigationLink(destination: EditStudentView(student: student, onUpdate: { newName, newAge in // Navigation link to edit student view
//                            updateStudent(student, withName: newName, age: newAge) // Update student information
//                        })) {
//                            Text("\(student.name), Age: \(student.age)") // Display student's name and age
//                                .foregroundColor(.primary) // Set text color to primary
//                        }
//                        Spacer() // Add space between elements in HStack
//                        // Delete button aligned on the right side
//                        Button(action: { // Delete button
//                            deleteStudent(student) // Call the function to delete the student
//                        }) {
//                            Image(systemName: "trash") // Use trash icon
//                                .foregroundColor(.red) // Set icon color to red
//                        }
//                        .buttonStyle(BorderlessButtonStyle()) // Ensure the button doesn’t interfere with NavigationLink
//                    }
//                    .padding(.vertical, 5) // Adjust vertical padding
//                }
//            }
//            .navigationTitle("Students") // Set the navigation bar title to "Students"
//            .toolbar { // Add a toolbar
//                ToolbarItem(placement: .navigationBarTrailing) { // Toolbar item on the trailing side
//                    Button("Add") { // Add button
//                        showAddStudentSheet = true // Show the add student view
//                    }
//                }
//            }
//            .sheet(isPresented: $showAddStudentSheet) { // Show the view when showAddStudentSheet is true
//                AddStudentView() // Display the add student view
//            }
//        }
//    }
//    
//    // Update function to save changes
//    private func updateStudent(_ student: Student, withName name: String, age: Int) { // Define a private function to update student information
//        student.name = name // Update the student's name
//        student.age = age // Update the student's age
//        try? context.save() // Attempt to save changes in the context
//    }
//    
//    // Delete function
//    private func deleteStudent(_ student: Student) { // Define a private function to delete a student
//        context.delete(student) // Delete the student from the context
//        try? context.save() // Attempt to save changes in the context
//    }
//    
//    
//    
//    private func initializeFunctionsIfNeeded() {
//        // Check if we need to initialize any functions
//        for name in functionNames {
//            let exists = functionCounts.contains { $0.name == name }
//            if !exists {
//                let newFunction = FunctionCount(name: name)
//                context.insert(newFunction)
//            }
//        }
//        try? context.save()
//    }
//    //    private func incrementCount(for name: String) {
//    //        if let index = functionCounts.firstIndex(where: { $0.name == name }) {
//    //            functionCounts[index].count += 1
//    //            try? context.save()
//    //        }
//    //    }
//    
//    private func incrementCount(for name: String) {
//        // Find the object directly in the context
//        if let function = functionCounts.first(where: { $0.name == name }) {
//            function.count += 1 // Increment the count
//            try? context.save() // Save changes to the context
//        }
//    }
//    
//    private func getCount(for name: String) -> Int {
//        return functionCounts.first(where: { $0.name == name })?.count ?? 0
//    }
//    
//    
//}
////#Preview {
////    ContentView() // Preview the ContentView
////        .modelContainer(for: Item.self, inMemory: true) // Use an in-memory model container
////}
//
//extension ContentView { // Extend ContentView
//    func printDatabaseLocation() { // Define a function to print the database location
//        guard let container = try? ModelContainer(for: Student.self), // Attempt to get the model container for Student
//              let url = container.configurations.first?.url.path(percentEncoded: false) else { // Get the URL of the database
//            print("Could not find database location") // Print error message if not found
//            return // Return from the function
//        }
//        print("Database location: \(url)") // Print the database location
//    }
//}
