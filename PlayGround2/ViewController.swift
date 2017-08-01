//
//  ViewController.swift
//  PlayGround2
//
//  Created by Kevin on 7/6/17.
//  Copyright © 2017 Kevin. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let firebaseAuth = Auth.auth()

    
    @IBAction func logoutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}







