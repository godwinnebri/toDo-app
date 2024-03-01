//
//  SampleCreateView.swift
//  MyToDo
//
//  Created by Godwin IE on 29/02/2024.
//

import SwiftUI

struct SampleCreateView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var sampleItem = SampleModel()
    
    var body: some View {
        List {
            TextField("Name", text: $sampleItem.title)
            TextField("Name", text: $sampleItem.category)

            Button("Create") {
                withAnimation {
                    context.insert(sampleItem)
                }
                dismiss()
            }
        }
        .navigationTitle("Create ToDo")    }
}

#Preview {
    SampleCreateView()
}
