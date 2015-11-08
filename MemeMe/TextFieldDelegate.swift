//
//  TextFieldDelegate.swift
//  MemeMe
//
//  Created by Narasimha Bhat on 05/11/15.
//  Copyright © 2015 Narasimha Bhat. All rights reserved.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
