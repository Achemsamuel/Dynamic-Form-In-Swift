////
////  FormResponse.swift
////  Pet App
////
////  Created by Achem Samuel on 4/30/19.
////  Copyright © 2019 Achem Samuel. All rights reserved.
////
//
//import Foundation
//
//struct FormResponse {
//    
//    let id : String
//    let name : String
//    let page : [Page]
//    
//    init?(json : JSON) {
//        guard let  id = json["id"] as? String,
//        let name = json["name"] as? String,
//        let pages = json["pages"] as? [JSON]
//            else {
//                return nil
//        }
//        
//        let pagesResult = pages.map({ Page(json: $0) })
//        
//        self.id = id
//        self.name = name
//        self.page = pagesResult as! [Page]
//        
//        print("JSON Pages; \(self.page)")
//    }
//}
