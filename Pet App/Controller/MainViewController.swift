//
//  MainViewController.swift
//  Pet App
//
//  Created by Achem Samuel on 4/29/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit

class MainViewController: SuperViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.getData()
    petAdoptionFormCollectionView.addSubview(super.setUpTextField(label: petModel.name))
        petAdoptionFormCollectionView.addSubview(super.embedPhoto(fileUrl: "https://images.pexels.com/photos/8700/wall-animal-dog-pet.jpg?cs=srgb&dl=animal-collar-dog-8700.jpg&fm=jpg"))
        petAdoptionFormCollectionView.addSubview(super.yardOptions())
        petAdoptionFormCollectionView.addSubview(datePickerSetUp(vc: self))
        
        petAdoptionFormCollectionView.reloadData()
        //Navigation BarSetup
        self.navigationItem.title = petModel.name
        let navigationBar = navigationController?.navigationBar
//        navigationBar?.tintColor = UIColor.purple
//        navigationBar?.barTintColor = UIColor.white
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
   
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
         setUpStuffWithJson()
    }
    
/*
    IB Outlets
*/
    @IBOutlet weak var petAdoptionFormCollectionView: UICollectionView!

}


/*
    Collection View Delegate & DataSource
 */
extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("Pages Count: \(petModel.pages.count/2)")
        return petModel.pages.count/2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        switch  indexPath.section {
        case 0:
            cell.backgroundColor = UIColor.clear
            return cell
        case 1:
            cell.backgroundColor = UIColor.black
            return cell
        case 2:
            cell.backgroundColor = UIColor.red
            return cell
        case 3:
            cell.backgroundColor = UIColor.purple
            return cell
        default:
            cell.backgroundColor = UIColor.clear
            return cell
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
    datePicker.frame = CGRect(x: 20, y: 350, width: view.frame.width - 40, height: 90)
    
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
   
        for i in 1 ... petModel.pages.count/2 {
            print("My name oo")
            print("Page:\(pages.label)")
            switch i {
            case 1:
                for i in 1 ... pages.sections.count {
                    
                }
                print("This is page 1")
                
            case 2:
                print("This is the next page, maybe 2")
            case 3:
                print("This is probably page 3")
            default:
                print("")
            }
        }
        
    }
    
}
