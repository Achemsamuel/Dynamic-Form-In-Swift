//
//  PetModel.swift
//  Pet App
//
//  Created by Achem Samuel on 4/29/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import Foundation

class PetModel : NSObject {
    
    var id = ""
    var name = ""
    var pages = Array<Pages>()
}

class Pages : NSObject {
    
    var label = ""
    var sections = Array<Sections>()
    
}

class Sections : NSObject {
    
    var label = ""
    var elements = Array<Elements>()
}

class Elements : NSObject {
    
    var file = ""
    var rules = Array<Rules>()
    var type = ""
    var unique_id = ""
    var isMandatory = Bool()
    var label = ""
    
}

class Rules : NSObject {
    
    var action = ""
    var condition = ""
    var otherwise = ""
    var value = ""
    var targets = [String]()
}


