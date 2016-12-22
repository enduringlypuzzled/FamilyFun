//
//  ViewController.swift
//  KidsPlaces
//
//  Created by Steve Mecking on 2016-12-20.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "goToTable", sender: nil)

    }

    @IBAction func signInPressed(_ sender: AnyObject) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                
                //User Signed in with no problem
                if error == nil {
                    print("Steve: Email user authenticated with Firebase")
                    
                    if let user = user {
                        //let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid)
                    }

                    
                } else {
                    
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Steve: Unable to authenticate with Firebase \(error)")
                        }else {
                            print("Steve: Succesfully authenticated with new Firebase user")
                            if let user = user {
                                //let userData = ["provider": user.providerID]
                                self.completeSignIn(id: user.uid)
                            }

                        }
                    })
                }
                
            })
            
        }
    }
    
    
    func completeSignIn(id: String) {
        
        performSegue(withIdentifier: "goToTable", sender: nil)
        
    }
    
    

}

