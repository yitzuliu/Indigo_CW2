//
//  ContentView.swift
//  StudentCRUDApp_V
//
//  Created by Yitzu Liu on 10/11/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var functionCounts: [FunctionCount]
    
    let functionNames = ["Function A", "Function B", "Function C"]
    @State private var isInitialized = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Debug button to print database location
            Button("Show Database Location") {
                printDatabaseLocation()
            }
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(10)
            
            VStack {
                NavigationStack {
                    ForEach(functionNames, id: \.self) { name in
                        NavigationLink(destination: LessonOneView(name: name)) {
                            HStack {
                                Text(name)
                                Spacer()
                                Text("Count: \(getCount(for: name))") // 顯示點擊次數
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
                .onAppear {
                    if !isInitialized {
                        initializeFunctionsIfNeeded()
                        DispatchQueue.main.async {
                            isInitialized = true
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Lessons")
        }
    }
    
    private func initializeFunctionsIfNeeded() {
        for name in functionNames {
            if functionCounts.first(where: { $0.name == name }) == nil {
                let newFunction = FunctionCount(name: name)
                context.insert(newFunction)
            }
        }
        try? context.save()
    }
    
    private func getCount(for name: String) -> Int {
        return functionCounts.first(where: { $0.name == name })?.count ?? 0
    }
    func printDatabaseLocation() {
        guard let container = try? ModelContainer(for: FunctionCount.self, Student.self),
              let url = container.configurations.first?.url else {
            print("Could not find database location")
            return
        }
        print("Database location: \(url.absoluteString)")
    }
}
