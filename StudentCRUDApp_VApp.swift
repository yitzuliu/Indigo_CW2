//
//  StudentCRUDApp_VApp.swift
//  StudentCRUDApp_V
//
//  Created by Yitzu Liu on 10/11/2024.
//

import SwiftUI
import SwiftData

@main
struct StudentCRUDApp_VApp: App {
    
    private let container: ModelContainer
    private let context: ModelContext
    
    init() {
        container = try! ModelContainer(for: FunctionCount.self, Student.self)
        context = container.mainContext
        initializeFunctionsIfNeeded() // 在應用啟動時初始化資料
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [FunctionCount.self, Student.self]) // 配置資料模型
    }
    
    
    private func initializeFunctionsIfNeeded() {
        let functionNames = ["Function A", "Function B", "Function C"]
        
        for name in functionNames {
            let fetchRequest = FetchDescriptor<FunctionCount>(predicate: #Predicate { $0.name == name })
            let existing = try? context.fetch(fetchRequest)
            if existing?.isEmpty ?? true {
                let newFunction = FunctionCount(name: name)
                context.insert(newFunction)
            }
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save during initialization: \(error)")
        }
    }
}
