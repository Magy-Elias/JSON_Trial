//
//  Batter.swift
//  JsonTrial
//
//  Created by Mickey Goga on 2/21/18.
//  Copyright © 2018 Magy Elias. All rights reserved.
//

import Foundation

struct Batter { //Array
    
//    let batterTypes : [BatterType]
//
//    init?(json: JSON) {
//        guard let batter = json["batter"] as? [JSON] else {
//            return nil
//        }
//        let batterTypes = batter.map({ BatterType(json: $0)! })
//        self.batterTypes = batterTypes
//    }
    
    let id: String
    let type: String
    
    init?(json: JSON) {
        guard let id = json["id"] as? String, let type = json["type"] as? String else {
            return nil
        }
        self.id = id
        self.type = type
    }
}
