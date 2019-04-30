////
////  PetAdoptionModel.swift
////  Pet App
////
////  Created by Achem Samuel on 4/29/19.
////  Copyright © 2019 Achem Samuel. All rights reserved.
////
//
//// To parse the JSON, add this file to your project and do:
////
////   let petModel = try? newJSONDecoder().decode(PetModel.self, from: jsonData)
//
//import Foundation
//
//class PetModel: Codable {
//    let id, name: String
//    let pages: [Page]
//
//    init(id: String, name: String, pages: [Page]) {
//        self.id = id
//        self.name = name
//        self.pages = pages
//    }
//}
//
//class Page: Codable {
//    let label: String
//    let sections: [Section]
//
//    init(label: String, sections: [Section]) {
//        self.label = label
//        self.sections = sections
//    }
//}
//
//class Section: Codable {
//    let label: String
//    let elements: [Element]
//
//    init(label: String, elements: [Element]) {
//        self.label = label
//        self.elements = elements
//    }
//}
//
//class Element: Codable {
//    let type: String
//    let file: String?
//    let uniqueID: String
//    let rules: [Rule]
//    let label: String?
//    let isMandatory: Bool?
//    let keyboard, formattedNumeric, mode: String?
//
//    enum CodingKeys: String, CodingKey {
//        case type, file
//        case uniqueID = "unique_id"
//        case rules, label, isMandatory, keyboard, formattedNumeric, mode
//    }
//
//    init(type: String, file: String?, uniqueID: String, rules: [Rule], label: String?, isMandatory: Bool?, keyboard: String?, formattedNumeric: String?, mode: String?) {
//        self.type = type
//        self.file = file
//        self.uniqueID = uniqueID
//        self.rules = rules
//        self.label = label
//        self.isMandatory = isMandatory
//        self.keyboard = keyboard
//        self.formattedNumeric = formattedNumeric
//        self.mode = mode
//    }
//}
//
//class Rule: Codable {
//    let condition, value, action, otherwise: String
//    let targets: [String]
//
//    init(condition: String, value: String, action: String, otherwise: String, targets: [String]) {
//        self.condition = condition
//        self.value = value
//        self.action = action
//        self.otherwise = otherwise
//        self.targets = targets
//    }
//}
//
