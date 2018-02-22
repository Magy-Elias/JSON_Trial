//
//  ItemRespone.swift
//  JsonTrial
//
//  Created by Mickey Goga on 2/21/18.
//  Copyright © 2018 Magy Elias. All rights reserved.
//

import Foundation

struct ItemResponse {
    
    let items: [Item]
    
    init?(json: JSON) {
        guard let items = json["items"] as? JSON else {
            return nil
        }
//        print(items)
        guard let itemArray = items["item"] as? [JSON] else {
            return nil
        }
//        print(itemArray)
        let itemObjects = itemArray.map({ Item(json: $0)! })
        self.items = itemObjects
    }
}

