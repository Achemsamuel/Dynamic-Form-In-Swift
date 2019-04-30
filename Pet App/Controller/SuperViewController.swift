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

class SuperViewController: UIViewController {

    
    /*
    Model Class Instance
*/
    let petModel = PetModel()
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
        
    }

    
    /*
    Append Json Data To Model
 */
    
    func getData () {
        
        getPetAdoptionJson { (petFormJsonResults) in
            //print("Pet JSON Form: \(petFormJsonResults)")
            
            //Form Results
            self.petModel.id = petFormJsonResults.value(forKey: "id") as? String ?? ""
            self.petModel.name = petFormJsonResults.value(forKey: "name") as? String ?? ""
            
            //Pages
            let pagesArray = petFormJsonResults.value(forKey: "pages") as! NSArray
            //print("Pages :\(pagesArray.count)")
            pagesArray.forEach({ (formPages) in
                
                let pagesJsonDictionary = formPages as! NSDictionary
                let pg = Pages()
                
                pg.label = pagesJsonDictionary.value(forKey: "label") as? String ?? ""
                //print("Pages Label: \(pages.label)")
                //
                self.pages.label = pg.label
                self.petModel.pages.append(pg)
                
                //print("Pge: \(pages.label)")
                //print("Okay : \(petModel.pages.count)")
                
                //Sections
                let sectionsArray = pagesJsonDictionary.value(forKey: "sections") as! NSArray
                //print("Sections: \(sectionsArray.count)")
                sectionsArray.forEach({ (formSections) in
                    
                    let sectionJsonDictionary = formSections as! NSDictionary
                    let sec = Sections()
                    
                    sec.label = sectionJsonDictionary.value(forKey: "label") as? String ?? ""
                    //
                    self.sections.label = sec.label
                    self.pages.sections.append(sec)
                    //print("Sections oo:\(self.sections.label)")
                    
                    //Elements
                    let elementsArray = sectionJsonDictionary.value(forKey: "elements") as! NSArray
                    elementsArray.forEach({ (formElements) in
                        
                        let elementsJsonDictionary = formElements as! NSDictionary
                        let elem = Elements()
                        
                        elem.file = elementsJsonDictionary.value(forKey: "file") as? String ?? ""
                        //print("Elelments FIle: \(elements.file)")
                        elem.type = elementsJsonDictionary.value(forKey: "type") as? String ?? ""
                        elem.unique_id = elementsJsonDictionary.value(forKey: "unique_id") as? String ?? ""
                        elem.isMandatory = elementsJsonDictionary.value(forKey: "isMandatory") as? Bool ?? false
                        elem.label = elementsJsonDictionary.value(forKey: "label") as? String ?? ""
                        //
                        self.elements.file = elem.file
                        self.elements.isMandatory = elem.isMandatory
                        self.elements.type = elem.type
                        self.elements.label = elem.label
                        self.elements.unique_id = elem.unique_id
                        
                        self.sections.elements.append(elem)
                       // print("Stuff done:\(self.elements.file, self.elements.isMandatory, self.elements.type, self.elements.label)")
                        
                        //Rule
                        let ruleArray = elementsJsonDictionary.value(forKey: "rules") as! NSArray
                        ruleArray.forEach({ (formRule) in
                            
                            let rulesJsonDictionary = formRule as! NSDictionary
                            let rul = Rules()
                            
                            rul.action = rulesJsonDictionary.value(forKey: "action") as? String ?? ""
                            rul.condition = rulesJsonDictionary.value(forKey: "condition") as? String ?? ""
                            rul.otherwise = rulesJsonDictionary.value(forKey: "otherwise") as? String ?? ""
                            rul.value = rulesJsonDictionary.value(forKey: "value") as? String ?? ""
                            rul.targets = rulesJsonDictionary.value(forKey: "targets") as? [String] ?? []
                            
                            rules.action = rul.action
                            rules.condition = rul.condition
                            rules.otherwise = rul.otherwise
                            rules.value = rul.value
                            rules.targets = rul.targets
                            
                            self.elements.rules.append(rules)
                            
                            //print("Stuff: \(rules.action, rules.condition, rules.otherwise, rules.value, rules.targets)")
                        })
                        
                    })
                })
            })
        }
    }

}


/*
    Stub Cells
 */

extension SuperViewController {
    
    //TextField SetUp
    func setUpTextField (label : String) -> UITextField {
        
        let textField : UITextField = UITextField(frame: (CGRect(x: 30, y: 30, width: view.frame.width - 50, height: 35)))
        textField.placeholder = label
        textField.borderStyle = .roundedRect
        
        return textField
    }
    
    //Embed Photo SetUp
    func embedPhoto (fileUrl : String) -> UIImageView {
        
        let imageUrl = fileUrl
        let imageView : UIImageView = UIImageView(frame: CGRect(x: 20, y: 30, width: view.frame.width - 40, height: 200))
        imageView.contentMode = .scaleAspectFill
        
        //Download and set imageView Image
        imageView.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "Pet Image"), options: [.transition(.fade(0.5)), .cacheOriginalImage, .memoryCacheExpiration(.days(1))])
        
        return imageView
    }
    
    //Drop Down SetUp
    func yardOptions () -> DropDown {
        
        let dropDown = DropDown(frame: CGRect(x: 20, y: 300, width: 200, height: 30)) //Set frame
        dropDown.text = "Do you have a yard?"
        //List of array to be displayed
        dropDown.optionArray = ["No", "Yes"]
        
        //ID's and optionals
        dropDown.optionIds = [0, 1]
        //closure returns selected index and string
        dropDown.didSelect { (selectedText, index, id) in
            dropDown.frame = CGRect(x: 20, y: 300, width: 100, height: 30)
            print("Selected Text: \(selectedText) Index: \(index) id: \(id)")
        }
        
        return dropDown
    }
    
    //Date Picker SetUp
    @objc func datePickerSetUp (vc: UIViewController) -> UIDatePicker {
        
        return UIDatePicker()
    }
    
    
    
}
