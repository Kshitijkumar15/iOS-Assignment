//
//  ListViewModel.swift
//  Todo Assignment
//
//  Created by kshitij on 16/03/24.


import Foundation

//CRUD Functions

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = [] {
        // this function will get called whenever we make changes to items array
        didSet{
             saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
// Hardcoded data
//        let newItems = [
//            ItemModel(title: "This is the first task",description: "first description", isCompleted: true),
//            ItemModel(title: "This is the second task",description: "second description", isCompleted: false),
//            ItemModel(title: "This is the third task", description: "third description",isCompleted: false),
//            ]
//        items.append(contentsOf: newItems)
       
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = saveItems
    }
    
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from:IndexSet,to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String, description: String){
        let newItem = ItemModel(title: title,description: description, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item:ItemModel){
        if let index=items.firstIndex(where: { $0.id == item.id})
       {
            items[index] = item.updateCompletion()
       }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
}
