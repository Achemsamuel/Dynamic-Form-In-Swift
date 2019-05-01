////
////  Section.swift
////  Pet App
////
////  Created by Achem Samuel on 4/30/19.
////  Copyright © 2019 Achem Samuel. All rights reserved.
////
//
//import Foundation
//
//struct Section {
//    
//    let label : String
//    let element : [Element]
//    
//    init?(json : JSON) {
//        guard let label = json["label"] as? String,
//            let elements = json["elements"] as? [JSON] else {
//                return nil
//        }
//        let elementsResults = elements.map({ Element(json: $0)!})
//        self.label = label
//        self.element = elementsResults
//        
//    }
//}
