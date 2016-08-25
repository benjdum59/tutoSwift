//
//  UserAddOrEditViewController.swift
//  TutoUser
//
//  Created by Benjamin Dumont on 14/03/2016.
//  Copyright © 2016 bdumont. All rights reserved.
//

import UIKit

class UserAddOrEditViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var firstnameTextField: UITextField!

    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBOutlet weak var addressTextView: UITextView!
    
    weak var delegate : UserDelegate?
    
    var user : User?
    var userActionType : UserActionType = UserActionType.Create
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextView.layer.borderColor = UIColor.grayColor().CGColor
        addressTextView.layer.borderWidth = 1.0
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        firstnameTextField.addTarget(self, action: Selector("textfieldDidChange:"), forControlEvents: UIControlEvents.EditingChanged)
        lastnameTextField.addTarget(self, action: Selector("textfieldDidChange:"), forControlEvents: UIControlEvents.EditingChanged)

        
        if user == nil {
            userActionType = UserActionType.Create
        } else {
            userActionType = UserActionType.Update
            firstnameTextField.text = user!.firstname
            lastnameTextField.text = user!.lastname
            addressTextView.text = user!.address
        }
        
        setButtonStatus()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func save(sender: AnyObject) {
        switch userActionType {
        case UserActionType.Update:
            delegate?.updateUser(User(id: user!.id, firstname: firstnameTextField.text!, lastname: lastnameTextField.text!, address: addressTextView.text))
        case UserActionType.Create:
            delegate?.createUser(User(id: LastId.lastId++, firstname: firstnameTextField.text!, lastname: lastnameTextField.text!, address: addressTextView.text))
            break
        default:
            break
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func setButtonStatus() {
        guard let firstname = firstnameTextField.text else {
            saveButton.enabled = false
            return
        }
        guard let lastname = lastnameTextField.text else  {
            saveButton.enabled = false
            return
        }
        guard firstname.isEmpty || lastname.isEmpty else{
            saveButton.enabled = true
            return
        }
        saveButton.enabled = false
    }
    
    func textfieldDidChange(textfield: UITextField){
        setButtonStatus()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
