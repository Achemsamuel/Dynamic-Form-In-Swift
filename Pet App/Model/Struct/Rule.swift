////
////  Rule.swift
////  Pet App
////
////  Created by Achem Samuel on 4/30/19.
////  Copyright © 2019 Achem Samuel. All rights reserved.
////
//
//import Foundation
//
//struct Rule {
//    
//    let condition, value, action, otherwise: String
//    let target : [String]
//    
//    init?(json: JSON) {
//        guard let condition = json["condition"] as? String,
//        let value = json["value"] as? String,
//        let actions = json["action"] as? String,
//        let otherwise = json["otherwise"] as? String,
//            let targets = json["targets"] as? [String] else {
//                return nil
//        }
//        self.action = actions
//        self.condition = condition
//        self.otherwise = otherwise
//        self.value = value
//        self.target = targets
//        
//        
//    }
//}
//
