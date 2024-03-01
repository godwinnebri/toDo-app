//
//  SampleModel.swift
//  MyToDo
//
//  Created by Godwin IE on 29/02/2024.
//

import Foundation
import SwiftData

@Model
final class SampleModel {
    var title: String
    var category: String
    
    init(title: String = "",
         category: String = "") {
        self.title = title
        self.category = category
    }
}
