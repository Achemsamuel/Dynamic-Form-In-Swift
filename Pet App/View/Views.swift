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
    func addTextField (label : String, y : CGFloat) -> UITextField {
        
        let textField : UITextField = UITextField(frame: (CGRect(x: 30, y: y, width: view.frame.width - 50, height: 35)))
        textField.placeholder = label
        textField.minimumFontSize = 0.3
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .roundedRect
        
        return textField
    }
    
    func addFormattedNumberField (label : String, y : CGFloat) -> UITextField {
        
        let textField : UITextField = UITextField(frame: (CGRect(x: 30, y: y, width: view.frame.width - 50, height: 35)))
        textField.placeholder = label
        textField.minimumFontSize = 0.3
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .roundedRect
        
        return textField
    }

    
    //Embed Photo SetUp
    func embedPhoto (fileUrl : String, y : CGFloat) -> UIImageView {
        
        let imageUrl = fileUrl
        let imageView : UIImageView = UIImageView(frame: CGRect(x: 30, y: y, width: view.frame.width - 50, height: 200))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.shouldRasterize = true
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 3
        
        
        //Download and set imageView Image
        imageView.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "Pet Image"), options: [.transition(.fade(0.5)), .cacheOriginalImage, .memoryCacheExpiration(.days(1))])
        
        return imageView
    }
    
    
    //Drop Down SetUp
    func yardOptions (y : CGFloat) -> (option : Int, DropDown) {
        
        var selectedOption = Int()
        let dropDown = DropDown(frame: CGRect(x: 30, y: y, width: 200, height: 30)) //Set frame
        dropDown.text = "Do you have a yard?"
        //List of array to be displayed
        dropDown.optionArray = ["No", "Yes"]
        
        //ID's and optionals
        dropDown.optionIds = [0, 1]
        //closure returns selected index and string
        dropDown.didSelect { (selectedText, index, id) in
            dropDown.frame = CGRect(x: 20, y: y, width: 100, height: 30)
            print("Selected Text: \(selectedText) Index: \(index) id: \(id)")
            selectedOption = id
        }
        
        return (selectedOption, dropDown)
    }
    
    //Date Picker SetUp
    @objc func datePickerSetUp (vc: UIViewController, y : CGFloat) -> UIDatePicker {
        return UIDatePicker()
    }
    
}
