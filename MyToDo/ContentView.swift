//
//  ContentView.swift
//  MyToDo
//
//  Created by Godwin IE on 26/02/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    
    @State private var showCreate = false
    @State private var showSampleCreate = false

    @State private var toDoToEdit: ToDoItem?
    @Query(
        filter: #Predicate { (item: ToDoItem) -> Bool in
               return item.isCompleted == false
           },
        sort: \.timeStamp,
        order: .reverse
    ) private var items: [ToDoItem]
    
    @Query private var sampleItems: [SampleModel]
    
    var body: some View {
        NavigationStack{
            List {
                Section{
                    ForEach(items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                
                                if item.isCritical {
                                    Image(systemName: "exclamationmark.3")
                                        .symbolVariant(.fill)
                                        .foregroundColor(.red)
                                        .font(.largeTitle)
                                        .bold()
                                }
                                
                                Text(item.title)
                                    .font(.largeTitle)
                                    .bold()
                                
                                Text("\(item.timeStamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                    .font(.callout)
                            }
                            
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    item.isCompleted.toggle()
                                }
                            } label: {
                                
                                Image(systemName: "checkmark")
                                    .symbolVariant(.circle.fill)
                                    .foregroundStyle(item.isCompleted ? .green : .gray)
                                    .font(.largeTitle)
                            }
                            .buttonStyle(.plain)
                            
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                
                                withAnimation {
                                    context.delete(item)
                                }
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                                    .symbolVariant(.fill)
                            }
                            Button {
                                toDoToEdit = item
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.orange)
                        }
                        
                    }
                    // for each
                }
                
                
                Section("Samples"){
                    ForEach(sampleItems) { item in
                        VStack{
                            Text(item.title)
                            Text(item.category)

                        }
                    }
                }
                //section 2
                
                }
            //list
            .toolbar {
                ToolbarItem{
                    Button{
                        showCreate.toggle()
                    } label: {
                        Label("Add item", systemImage: "plus")
                    }
                }
                
                ToolbarItem{
                    Button{
                        showSampleCreate.toggle()
                    } label: {
                        Label("Add sample", systemImage: "plus")
                    }
                }
                //sample toolbar button
            }
            .sheet(isPresented: $showCreate, content: {
                NavigationStack{
                    CreateTodoView()
                }
                .presentationDetents([.medium])
            })
            
            .sheet(isPresented: $showSampleCreate, content: {
                NavigationStack{
                    SampleCreateView()
                }
                .presentationDetents([.medium])
            })
            //sample sheet
        
            .sheet(item: $toDoToEdit) {
                toDoToEdit = nil
            } content: { item in
                UpdateToDoView(item: item)
            }
            
            }
        //nav stack

        }
    }


#Preview {
    ContentView()
}


