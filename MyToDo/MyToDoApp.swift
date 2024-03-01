//
//  MyToDoApp.swift
//  MyToDo
//
//  Created by Godwin IE on 26/02/2024.
//

import SwiftData
import SwiftUI

@main
struct MyToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ToDoItem.self, SampleModel.self])
        }
    }
}
