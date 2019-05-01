////
////  PetModel.swift
////  Pet App
////
////  Created by Achem Samuel on 4/29/19.
////  Copyright © 2019 Achem Samuel. All rights reserved.
////
//
import Foundation

class PetModel : NSObject {
    
    var id = "" {
        didSet {
           // print("PetModel id :\(id)")
        }
    }
    var name = "" {
        didSet {
            //print("Pet Model Name: \(name)")
        }
    }
    var pages = [Pages]() {
        didSet {
//            print("Pet Model Pages: \(pages)")
        }
    }
}


