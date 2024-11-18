//
//  LessonOneView.swift
//  StudentCRUDApp_V
//
//  Created by Yitzu Liu on 18/11/2024.
//

import SwiftUI
import SwiftData

struct LessonOneView: View {
    @Environment(\.modelContext) private var context
    @Query var functionCounts: [FunctionCount]
    
    let name: String
    
    var body: some View {
        VStack {
            Button("Increment \(name) Count") {
                incrementCount(for: name)
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            
            Text("Welcome to Function \(name)!")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("\(name) View")
    }
    
    private func incrementCount(for name: String) {
        if let function = functionCounts.first(where: { $0.name == name }) {
            function.count += 1
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}
