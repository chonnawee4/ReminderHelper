//
//  RegisterViewController.swift
//  ReminderHelper
//
//  Created by Chonnawee Chatcherthaicharoen on 8/12/2560 BE.
//  Copyright © 2560 Chonnawee Chatcherthaicharoen. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
  @IBOutlet weak var idCardTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var confirmPasswordTextField: UITextField!
    
  @IBAction func registerPressed(_ sender: UIButton) {
    
    guard let idCard = idCardTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else {
      return
    }
    
    if password != confirmPassword {
      return
    }
    
    let username = idCard + "@reminderhelp.com"
    
    Auth.auth().createUser(withEmail: username, password: password) { (user, error) in
      if error != nil {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        let done = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(done)
        self.present(alert, animated: true, completion: nil)
        return
      }
            
      self.performSegue(withIdentifier: "AddName", sender: nil)
    }
  }
}
