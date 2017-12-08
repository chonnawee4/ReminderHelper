//
//  LoginViewController.swift
//  ReminderHelper
//
//  Created by Chonnawee Chatcherthaicharoen on 8/12/2560 BE.
//  Copyright © 2560 Chonnawee Chatcherthaicharoen. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
  
  @IBOutlet weak var idCardTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBAction func loginPressed(_ sender: UIButton) {
    
    guard let idCard = idCardTextField.text, let password = passwordTextField.text else {
      return
    }
    
    let username = idCard + "@reminderhelp.com"
    
    Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
      if error != nil {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        let done = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(done)
        self.present(alert, animated: true, completion: nil)
        return
      }
      
      self.performSegue(withIdentifier: "AddNote", sender: nil)
    }
  }

}

