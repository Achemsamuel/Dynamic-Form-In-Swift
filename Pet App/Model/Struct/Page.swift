////
////  Page.swift
////  Pet App
////
////  Created by Achem Samuel on 4/30/19.
////  Copyright © 2019 Achem Samuel. All rights reserved.
////
//
//import Foundation
//
//struct Page {
//    
//    let label : String
//    let section : [Section]
//    
//    init?(json : JSON) {
//        guard let label = json["label"] as? String,
//        let sections = json["sections"] as? [JSON]
//            else { return nil }
//        let sectionResults = sections.map({ Section(json: $0)!})
//        self.label = label
//        self.section = sectionResults
//    }
//}
