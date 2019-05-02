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
            
        }
    }
    var rules = [Rules]() {
        didSet {
            
        }
    }
    var type = "" {
        didSet {
            
        }
    }
    var unique_id = "" {
        didSet {
            
        }
    }
    //var isMandatory = Bool()
    var isMandatory = Int() {
        didSet {
            
        }
    }
    var label = "" {
        didSet {
            
        }
    }
    var mode = Date() {
        didSet {
            
        }
    }
    var formattedNumeric = "" {
        didSet {
            
        }
    }
    
}
