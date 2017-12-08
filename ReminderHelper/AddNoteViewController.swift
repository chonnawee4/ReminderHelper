//
//  AddNoteViewController.swift
//  ReminderHelper
//
//  Created by Chonnawee Chatcherthaicharoen on 8/12/2560 BE.
//  Copyright © 2560 Chonnawee Chatcherthaicharoen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AddNoteViewController: UIViewController {
  
  @IBOutlet weak var textView: UITextView!
  
//  var user: User!
  let userId = Auth.auth().currentUser?.uid
  private var ref = Database.database().reference()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    ref.child("users").child(userId!).observeSingleEvent(of: .value, with: { (snapshot) in
      let value = snapshot.value as? NSDictionary
      let note = value?["note"] as? String ?? ""
      self.textView.text = note
    }) { (error) in
      print(error.localizedDescription)
    }
  }
  
  @IBAction func updatePressed(_ sender: UIButton) {
    ref.child("users").child(userId!).child("note").setValue(["note": textView.text])
  }
  
}
