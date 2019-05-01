//
//  Rules.swift
//  Pet App
//
//  Created by Achem Samuel on 5/1/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import Foundation

class Rules : NSObject {
    
    var action = "" {
        didSet {
            //print("Rules Actions : \(action)")
        }
    }
    var condition = "" {
        didSet {
            //print("Rules Condition : \(condition)")
        }
    }
    var otherwise = "" {
        didSet {
            //print("Rules Otherwise : \(otherwise)")
        }
    }
    var value = "" {
        didSet {
            //print("Rules Value : \(value)")
        }
    }
    var targets = [String]() {
        didSet {
            //print("Rules Targets : \(targets)")
        }
    }
}
