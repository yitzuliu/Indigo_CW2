import SwiftUI // Import SwiftUI framework for building user interfaces
import SwiftData // Import SwiftData framework for data management

struct EditStudentView: View { // Define a structure named EditStudentView that conforms to the View protocol
    @Environment(\.dismiss) private var dismiss // Get the environment variable to dismiss the view
    
    let student: Student // Constant to hold the student being edited
    let onUpdate: (String, Int) -> Void  // Callback for updates, takes a name and age as parameters
    
    @State private var name: String // State variable for the student's name
    @State private var age: Int // State variable for the student's age
    
    init(student: Student, onUpdate: @escaping (String, Int) -> Void) { // Initializer for EditStudentView
        self.student = student // Assign the passed student to the local constant
        self.onUpdate = onUpdate // Assign the update callback
        _name = State(initialValue: student.name) // Initialize the name state variable with the student's name
        _age = State(initialValue: student.age) // Initialize the age state variable with the student's age
    }
    
    var body: some View { // Define the main body of the view
        NavigationStack { // Use NavigationStack to manage view navigation
            Form { // Use Form to create a structured input form
                TextField("Name", text: $name) // Text field for entering the student's name
                TextField("Age", value: $age, format: .number) // Text field for entering the student's age
                    .keyboardType(.numberPad) // Set the keyboard type to number pad
            }
            .navigationTitle("Edit Student") // Set the navigation bar title to "Edit Student"
            .toolbar { // Add a toolbar
                ToolbarItem(placement: .navigationBarLeading) { // Toolbar item on the leading side
                    Button("Cancel") { // Cancel button
                        dismiss() // Dismiss the view
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) { // Toolbar item on the trailing side
                    Button("Save") { // Save button
                        onUpdate(name, age) // Call the update callback with the new name and age
                        dismiss() // Dismiss the view
                    }
                }
            }
        }
    }
}
