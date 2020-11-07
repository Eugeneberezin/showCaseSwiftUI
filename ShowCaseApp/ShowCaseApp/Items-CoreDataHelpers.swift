//
//  Items-CoreDataHelpers.swift
//  ShowCaseApp
//
//  Created by Eugene Berezin on 10/30/20.
//

import Foundation

extension Item {
    var itemTitle: String {
        title ?? "New item"
    }
    
    var itemDetail: String {
        detail ?? ""
    }
    
    var itemCreationDate: Date {
        creationDate ?? Date()
    }
    
    static var example: Item {
        let controller = DataController(inMemory: true)
        let viewContent = controller.container.viewContext
        
        let item = Item(context: viewContent)
        item.title = "Example item"
        item.priority = 3
        item.creationDate = Date()
        return item
    }
}
