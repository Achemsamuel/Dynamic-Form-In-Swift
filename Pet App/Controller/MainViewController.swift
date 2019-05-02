//
//  MainViewController.swift
//  Pet App
//
//  Created by Achem Samuel on 4/29/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainViewController: SuperViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preSetUp()
   
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
/*
    IB Outlets
*/
    @IBOutlet weak var petAdoptionFormCollectionView: UICollectionView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    /*
     Button Methods
     */
    @IBAction func nextButtonPressed(_ sender: AnyObject) {
        
    }
    
    @IBAction func previousButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    func preSetUp () {
        
        petAdoptionFormCollectionView.reloadData()
        nextButton.titleLabel?.adjustsFontSizeToFitWidth = true
        nextButton.titleLabel?.minimumScaleFactor = 0.2
        //** Navigation Bar Setup
        self.navigationItem.title = petModels.name
        let navigationBar = navigationController?.navigationBar
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}


/*
    Collection View Delegate & DataSource
 */
extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return petModels.pages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /*
    Cell Set up
    */
        switch  indexPath.section {
            
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PetFormCollectionViewCell
                cell.topLabel.text = pages.sections[0].label
                pages(currentPage: indexPath.section)
                previousButton.isHidden = false
                cell.backgroundColor = UIColor.clear
            
                for pages in petModels.pages {
                   
                    if pages.label == "Page 1" {
                        for elementType in sections.elements {
        
                            if elementType.type.contains("embeddedphoto") {
                                cell.addSubview(super.embedPhoto(fileUrl: sections.elements[0].file, y: 50))
                            }
                            else if elementType.type.contains("text") {
                                cell.addSubview(super.addTextField(label: sections.elements[1].label, y: 270))
                                cell.addSubview(super.addTextField(label: sections.elements[2].label, y: 325))
                            }
                            else if elementType.type.contains("formattednumeric") {
                                 cell.addSubview(super.addFormattedNumberField(label: sections.elements[3].label, y: 380))
                            }
                            else if elementType.type.contains("datetime") {
                                cell.addSubview(self.datePickerSetUp(vc: self, y: 435))
                            }
                    }
                }
            }
            
        return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PetFormCollectionViewCell
                cell.topLabel.text = pages.sections[2].label
                previousButton.isHidden = false
                cell.backgroundColor = UIColor.clear
            
                for pages in petModels.pages {
                    if pages.label.last! == petModels.pages[1].label.last! {
                        for elementType in sections.elements {
                            if elementType.type.contains("yesno") {
                                cell.addSubview(super.yardOptions(y: 50).1)
                                 let ind = yardOptions(y: 50).option
                                    if ind == 1 {
                                        cell.addSubview(addTextField(label: sections.elements[6].label, y: 100))
                                    }
                            }
                        }
                    }
                }
            return cell
            
        case 2:

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PetFormCollectionViewCell
                cell.topLabel.text = pages.sections[3].label
                //pages(currentPage: indexPath.section)
                previousButton.isHidden = false
                cell.backgroundColor = UIColor.clear
                if indexPath.section == petModels.pages.count - 1 {
                    
                    
                    for pages in petModels.pages {
                        if pages.label.last! == petModels.pages[2].label.last! {
                            
                            for elementType in sections.elements {
                                
                                if elementType.type.contains("text") {
                                    cell.addSubview(addTextField(label: sections.elements[7].label, y: 50))
                                    cell.addSubview(addTextField(label: sections.elements[8].label, y: 105))
                                }
                            }
                        }
                    }
                }
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
      
        }
    
}

/*
    Date Picker Stub SetUp
 */

extension MainViewController {
    
    override func datePickerSetUp(vc: UIViewController, y : CGFloat) -> UIDatePicker {
        
    let datePicker : UIDatePicker = UIDatePicker()
    //Position date picker
    datePicker.frame = CGRect(x: 30, y: y, width: view.frame.width - 50, height: 90)
    
    //Set up date picker properties
    datePicker.timeZone = NSTimeZone.local
    datePicker.backgroundColor = UIColor.clear

    //Add event to sort date
    datePicker.addTarget(self, action: #selector(MainViewController.datePickerValueChanged), for: .valueChanged)
    
    return datePicker
        
    }
    
    @objc func datePickerValueChanged (_ sender : UIDatePicker) {
        
        //create date formatter
        let dateFormatter = DateFormatter()
        
        //Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        //apply date format
        let selectedDate  : String = dateFormatter.string(from: sender.date)
        print("Selected Date: \(selectedDate)")
        
    }
    
}

/*
   Current Page Method
 */

extension MainViewController {
    
    func pages (currentPage : Int) {
        
        if currentPage == 0 {
            if (petModels.pages[0].label.last) == "1" {
                
            }
        } else if  currentPage == 1 {
                if (petModels.pages[1].label.last) == "2" {
                    
                }
            }
            else if currentPage == 2 {
            
            }
            else if (petModels.pages[2].label.last) == "3" {
            
            }
        }
    
    
}

    


