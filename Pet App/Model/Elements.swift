//
//  Elements.swift
//  Pet App
//
//  Created by Achem Samuel on 5/1/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import Foundation

class Elements : NSObject {
    
    var file = "" {
        didSet {
            //print("Elements File : \(file)")
        }
    }
    var rules = [Rules]() {
        didSet {
            //print("Rules : \(rules)")
        }
    }
    var type = "" {
        didSet {
            //print("Elements Type :\(type)")
        }
    }
    var unique_id = "" {
        didSet {
            //print("Elelemts unique_id: \(unique_id)")
        }
    }
    //var isMandatory = Bool()
    var isMandatory = Int() {
        didSet {
            //print("Elelemnts isMandatory: \(isMandatory)")
        }
    }
    var label = "" {
        didSet {
            //print("Elements Label : \(label)")
        }
    }
    var mode = Date() {
        didSet {
            //print("Elements mode: \(mode)")
        }
    }
    var formattedNumeric = "" {
        didSet {
            //print("Elements formattedNumeric: \(formattedNumeric)")
        }
    }
    //var keyboard = NSNumber()
    
}
