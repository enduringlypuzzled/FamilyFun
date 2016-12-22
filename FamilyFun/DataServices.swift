//
//  DataService.swift
//  MeckingSocial
//
//  Created by Steve Mecking on 2016-11-28.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import Foundation
import Firebase

let DB_Base = FIRDatabase.database().reference()

class DataService {
    
    static let ds = DataService()
    
    //DB References
    private var _REF_BASE = DB_Base
    private var _REF_POSTS = DB_Base.child("categories")
    private var _REF_USERS = DB_Base.child("users")
    
    //Storage References
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
       
    func createFirbaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
        
        
    }
    
    
}

