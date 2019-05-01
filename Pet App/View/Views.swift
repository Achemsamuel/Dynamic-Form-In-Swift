//
//  Views.swift
//  Pet App
//
//  Created by Achem Samuel on 5/1/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import iOSDropDown
import DatePicker

/* Stubs */

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
