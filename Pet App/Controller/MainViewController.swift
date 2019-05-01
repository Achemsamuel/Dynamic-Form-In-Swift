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
        
         setUpStuffWithJson()
    }
    
    
/*
    IB Outlets
*/
    @IBOutlet weak var petAdoptionFormCollectionView: UICollectionView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    func preSetUp () {
        
        petAdoptionFormCollectionView.reloadData()
        
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
        
        switch  indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PetFormCollectionViewCell
            pages(currentPage: indexPath.section)
            nextButton.titleLabel?.text = "Next"
            //previousButton.isHidden = true
            cell.backgroundColor = UIColor.clear
            return cell
        case 1:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PetFormCollectionViewCell
            pages(currentPage: indexPath.section)
            previousButton.isHidden = false
            cell.addSubview(super.yardOptions())
            cell.backgroundColor = UIColor.clear
            //nextButton.titleLabel?.text = "Next"
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PetFormCollectionViewCell
            pages(currentPage: indexPath.section)
            previousButton.isHidden = false
            cell.addSubview(datePickerSetUp(vc: self))
            cell.backgroundColor = UIColor.clear
            nextButton.titleLabel?.text = "Submit"
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}

/*
    Extra Stub SetUp
 */

extension MainViewController {
    
override func datePickerSetUp(vc: UIViewController) -> UIDatePicker {
        
    let datePicker : UIDatePicker = UIDatePicker()
    //Position date picker
    datePicker.frame = CGRect(x: 20, y: 400, width: view.frame.width - 40, height: 90)
    
    //Set up date picker properties
    datePicker.timeZone = NSTimeZone.local
    datePicker.backgroundColor = UIColor.white
    
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


extension MainViewController {
    
    func setUpStuffWithJson () {
        
        //print(petModels.pages[1].label)
       
        let firstPage = petModels.pages[0]
        let secondPage = petModels.pages[1]
        let thirdPage = petModels.pages[2]
        //print("Page count: \(petModels.pages.count)")
        
        if firstPage == firstPage {
            //print("First Page Section Label: \(pages.sections[0 ..< pages.sections.count])")
            //print("Section count :\(pages.sections.count)")
            //print("First Page Section label: \(pages.sections[0].label)")
            //print("First Page second section label: \(pages.sections[1].label)")
            //print("Elements File : \(sections.elements[0].type)")
            let petcell = PetFormCollectionViewCell()
            let type = "embeddedphoto"
            if String(sections.elements[0].type) == type {
                //print("Works finally: \(type)")
                for i in petModels.pages[0 ..< petModels.pages.count] {
                
                   
                }
                petcell.addSubview(super.embedPhoto(fileUrl: sections.elements[0].file))
            }
           
            
        }
        if secondPage == secondPage {
            //print("Second Page Section Label: \(pages.sections[2].label)")
        }
        if thirdPage == thirdPage {
            //print("Third Page Section Label: \(pages.sections[3].label)")
        }
      
        
        }
    
    func pages (currentPage : Int) {
        
        if currentPage == 0 {
            print("f : \(petModels.pages[0].label.last!)")
            
            if (petModels.pages[0].label.last) == "1" {
                print("Nice!")
            }
            
            if currentPage == 1 {
                if (petModels.pages[1].label.last) == "2" {
                    print("Nice 2")
                }
            }
            
            if currentPage == 2 {
                if (petModels.pages[2].label.last) == "3" {
                    print("Nice 3")
                }
            }
        }
    }
    
    
}

    


