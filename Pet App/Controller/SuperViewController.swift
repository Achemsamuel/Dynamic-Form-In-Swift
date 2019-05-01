//
//  SuperViewController.swift
//  Pet App
//
//  Created by Achem Samuel on 4/30/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import Kingfisher
import iOSDropDown
import DatePicker
import SwiftyJSON

class SuperViewController: UIViewController {

    
    /*
    Model Class Instances
*/
    
    let petModels = PetModel()
    let pages = Pages()
    let elements = Elements()
    let sections = Sections()
    let rules = Rules()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
/*
     Get Json File
 */
    
    func getPetAdoptionJson (onComplete : (_ petJsonResults : NSDictionary)->()) -> Void {

        guard let path = Bundle.main.url(forResource: "pet_adoption", withExtension: "json") else {
            fatalError()
        }
        let data = try! Data(contentsOf: path, options: [])

        //Serialize Json
        guard let petAdoptionJson = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
            fatalError()
        }
        onComplete(petAdoptionJson)
        //print("Pet Adoption Form Json :\(petAdoptionJson)")

    }


    /*
    Append Json Data To Model
 */

    func getData () {

        getPetAdoptionJson { (formJsonResults) in

        }

        getPetAdoptionJson { (petFormJsonResults) in
            //print("Pet JSON Form: \(petFormJsonResults)")

            //** Form Response
            self.petModels.id = petFormJsonResults.value(forKey: "id") as? String ?? ""
            self.petModels.name = petFormJsonResults.value(forKey: "name") as? String ?? ""
            

            //** Pages
            let pagesArray = petFormJsonResults.value(forKey: "pages") as? NSArray
            //print("Pages :\(pagesArray!)")

            pagesArray!.forEach({ (pagesDictionary) in

                let pagesJsonDictionary = pagesDictionary as! NSDictionary
                let pag = Pages()
                //print("P: \(pagesJsonDictionary)")

                pag.label = pagesJsonDictionary.value(forKey: "label") as? String ?? ""
                self.petModels.pages.append(pag)
                //print("DD: \(self.petModels.pages.count)")
               
                
                //** Sections
                let sectionsArray = pagesJsonDictionary.value(forKey: "sections") as? NSArray
                //print("Sections nn: \(sectionsArray)")

                sectionsArray!.forEach({ (sectionsDictionary) in

                    let sectionsJsonDictionary = sectionsDictionary as! NSDictionary
                    //print("Sections Dict: \(sectionsJsonDictionary)")
                    let sect = Sections()

                    sect.label = sectionsJsonDictionary.value(forKey: "label") as? String ?? ""
                    self.pages.sections.append(sect)
                    //print("Secti count: \(self.pages.sections.count)")

                    //** Elements
                    let elementArray = sectionsJsonDictionary.value(forKey: "elements") as? NSArray
                    //print("EE: \(elementArray)")

                    elementArray!.forEach({ (elementsDictionary) in

                        let elementsJsonDictionary = elementsDictionary as! NSDictionary
                        //print("Elelments Json Dict: \(elementsJsonDictionary)")
                        let elem = Elements()

                        elem.file = elementsJsonDictionary.value(forKey: "file") as? String ?? ""
                        elem.type = elementsJsonDictionary.value(forKey: "type") as? String ?? ""
                        elem.label = elementsJsonDictionary.value(forKey: "label") as? String ?? ""
                        elem.unique_id =  elementsJsonDictionary.value(forKey: "unique_id") as? String ?? ""
                        elem.mode = elementsJsonDictionary.value(forKey: "mode") as? Date ?? Date()
                        elem.formattedNumeric = elementsJsonDictionary.value(forKey: "formattedNumeric") as? String ?? ""

                        self.sections.elements.append(elem)
                        //print("Elelemts: \(self.elements.file, self.elements.label, self.elements.mode)")
                       // print("Elelment array count: \(self.sections.elements.count)")

                        //** Rule
                        let rulesArray = elementsJsonDictionary.value(forKey: "rules") as? NSArray
                        //print("Rules Array: \(rulesArray)")

                        rulesArray!.forEach({ (rulesDictionary) in

                            let rulesJsonDictionary = rulesDictionary as! NSDictionary
                            //print("Rules Json Dict: \(rulesJsonDictionary)")

                            let rul = Rules()

                            rul.action = rulesJsonDictionary.value(forKey: "action") as? String ?? ""
                            rul.condition = rulesJsonDictionary.value(forKey: "condition") as? String ?? ""
                            rul.otherwise = rulesJsonDictionary.value(forKey: "otherwise") as? String ?? ""
                            rul.targets = rulesJsonDictionary.value(forKey: "targets") as? [String] ?? []

                            self.elements.rules.append(rul)
                            //print("Rules count: \(self.elements.rules.count)")

                        })

                    })
                })
            })
        }
    }

}


