//
//  HomeViewModel.swift
//  Nano2
//
//  Created by Zacky Ilahi Azmi on 29/07/22.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [TaskEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "Nano2")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loading Core Data. \(error)")
            }
        }
        fetchTask()
    }
    
    func fetchTask() {
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching. \(error)")
        }
    }
    
    func addTask(text: String) {
        let newTask = TaskEntity(context: container.viewContext)
        newTask.name = text
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchTask()
        } catch let error {
            print("Error Saving Data. \(error)")
        }
    }
    
    func deleteTask(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
}

