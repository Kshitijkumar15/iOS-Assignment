//
//  ListRowView.swift
//  Todo Assignment
//
//  Created by kshitij on 16/03/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                        .foregroundColor(item.isCompleted ? .green : .red)
                    Text(item.title)
                }
                Text(item.description)
                    .font(.subheadline)
                    .padding(.horizontal, 40)
            }
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let item1 = ItemModel(title: "First task", description: "First description", isCompleted: true)
        let item2 = ItemModel(title: "Second task", description: "Second description", isCompleted: false)
        
        return Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
