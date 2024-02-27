//
//  ContentView.swift
//  MyToDo
//
//  Created by Godwin IE on 26/02/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @State private var showCreate = false
    @Query private var items: [ToDoItem]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach (items) {item in
                    
                }
            }
                .toolbar {
                    ToolbarItem{
                        Button{
                            showCreate.toggle()
                        } label: {
                            Label("Add item", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showCreate, content: {
                    NavigationStack{
                        CreateView()
                    }
                    .presentationDetents([.medium])
                })
        }
    }
}

#Preview {
    ContentView()
}
