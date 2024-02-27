//
//  ToDoItem.swift
//  MyToDo
//
//  Created by Godwin IE on 26/02/2024.
//

import Foundation
import SwiftData

@Model
final class ToDoItem {
    var title: String
    var timeStamp: Date
    var isCritical: Bool
    var isCompleted: Bool
    
    init(title: String = "",
         timeStamp: Date = .now,
         isCritical: Bool = false,
         isCompleted: Bool = false) {
        self.title = title
        self.timeStamp = timeStamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }
}
