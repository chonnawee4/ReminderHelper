//
//  AddNameViewController.swift
//  ReminderHelper
//
//  Created by Chonnawee Chatcherthaicharoen on 8/12/2560 BE.
//  Copyright © 2560 Chonnawee Chatcherthaicharoen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddNameViewController: UIViewController {
  @IBOutlet var nameTextFields: [UITextField]!
  
  let userId = Auth.auth().currentUser?.uid
  private var ref = Database.database().reference()
  
  @IBAction func submitNamePreesed(_ sender: UIButton) {
    var nameDict = [[String: String]]()
    for textField in nameTextFields where textField.text != "" || textField.text != nil {
      nameDict.append(["name\(textField.tag)" : textField.text!])
    }
    
    ref.child("users").child(userId!).child("parent").setValue(nameDict)
    
    navigationController?.popToRootViewController(animated: true)
  }
}
