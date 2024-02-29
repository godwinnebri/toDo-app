//
//  UpdateToDoView.swift
//  MyToDo
//
//  Created by Godwin IE on 28/02/2024.
//

import SwiftUI

struct UpdateToDoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Bindable var item: ToDoItem
    
    var body: some View {
        NavigationStack{
            List {
                TextField("Name", text: $item.title)
                DatePicker("Choose a date",
                           selection: $item.timeStamp)
                Toggle("Important?", isOn: $item.isCritical)
                Button("Update") {
                    dismiss()
                }
            }
            .navigationTitle("Update ToDo")
        }
    }
}

#Preview {
    UpdateToDoView(item: ToDoItem(title: "", timeStamp: .now, isCritical: true, isCompleted: true))
}
