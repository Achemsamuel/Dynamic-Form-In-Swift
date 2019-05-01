////
////  Element.swift
////  Pet App
////
////  Created by Achem Samuel on 4/30/19.
////  Copyright © 2019 Achem Samuel. All rights reserved.
////
//
//import Foundation
//
//struct Element {
//    
//    let type: String
//    let uniqueID: String
//    let file: String?
//    let rule: [Rule]
//    let label: String?
//    let isMandatory: Bool?
//    let keyboard, formattedNumeric, mode: String?
//    
//    init?(json : JSON) {
//        guard let type = json["type"] as? String,
//        let uniqueID = json["unique_id"] as? String,
//        let file = json["file"] as? String,
//        let label = json["label"] as? String,
//        let isMandatory = json["isMandatory"] as? Bool,
//        let keyboard = json["keyboard"] as? String,
//        let formattedNumeric = json["formattedNumeric"] as? String,
//        let mode = json["mode"] as? String,
//        let rules = json["rules"] as? [JSON]
//        else {
//                return nil
//        }
//        let rulesResults = rules.map({Rule(json: $0)!})
//        
//        self.file = file
//        self.formattedNumeric = formattedNumeric
//        self.isMandatory = isMandatory
//        self.keyboard = keyboard
//        self.label = label
//        self.mode = mode
//        self.type = type
//        self.uniqueID = uniqueID
//        self.rule = rulesResults 
//        
//    }
//}
