//
//  File.swift
//  Pet App
//
//  Created by Achem Samuel on 5/1/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import Foundation

class Pages : NSObject {
    
    var label = "" {
        didSet {
            print("Pages Label: \(label)")
        }
    }
    var sections = [Sections]() {
        didSet {
            
        }
    }
    
}
