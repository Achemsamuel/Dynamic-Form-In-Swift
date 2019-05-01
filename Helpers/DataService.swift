//
//  DataService.swift
//  Pet App
//
//  Created by Achem Samuel on 4/30/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import Foundation

typealias JSON = [String : Any]

class DataService {
    
    private init() {}
    static let shared = DataService()
    
    func getJsonData (onComplete: (Data)->Void) {
        
        guard let path = Bundle.main.path(forResource: "pet_adoption", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            onComplete(data)
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}
