//
//  Item.swift
//  JsonTrial
//
//  Created by Mickey Goga on 2/21/18.
//  Copyright © 2018 Magy Elias. All rights reserved.
//

import Foundation

struct Item {
    
    let batters: Batters
    
    init?(json: JSON) {
//        print(json)
        guard let battersJSON = json["batters"] as? JSON  else {
            return nil
        }
        self.batters = Batters(json: battersJSON)!
    }
}

