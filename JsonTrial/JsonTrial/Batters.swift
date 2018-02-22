//
//  Batters.swift
//  JsonTrial
//
//  Created by Mickey Goga on 2/21/18.
//  Copyright © 2018 Magy Elias. All rights reserved.
//

import Foundation

struct Batters {
    
    let batters: [Batter]
    
    init?(json: JSON) {
//        print(json)
        guard let batterJSON = json["batter"] as? [JSON] else {
            return nil
        }
        let batters = batterJSON.map({ Batter(json: $0)! })
        self.batters = batters
    }
}
