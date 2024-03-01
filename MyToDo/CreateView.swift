//
//  CreateView.swift
//  MyToDo
//
//  Created by Godwin IE on 26/02/2024.
//

import SwiftUI

struct CreateTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item = ToDoItem()
    
    var body: some View {
        List {
            TextField("Name", text: $item.title)
            DatePicker("Choose a date",
                       selection: $item.timeStamp)
            Toggle("Important?", isOn: $item.isCritical)
            Button("Create") {
                withAnimation {
                    context.insert(item)
                }
                dismiss()
            }
        }
        .navigationTitle("Create ToDo")
    }
}

#Preview {
    CreateTodoView()
        .modelContainer(for: ToDoItem.self)
}
