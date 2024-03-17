//
//  ItemModel.swift
//  Todo Assignment
//
//  Created by kshitij on 16/03/24.
//

import Foundation

// This is a immutable Struct

struct ItemModel: Identifiable, Codable{
    let id: String
    let title: String
    let description: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, description: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, description: description, isCompleted: !isCompleted)
    }
}
