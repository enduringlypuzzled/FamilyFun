//
//  FeedVC.swift
//  KidsPlaces
//
//  Created by Steve Mecking on 2016-12-21.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
       
    
    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    //var posts = [] ()
    
    let ref = FIRDatabase.database().reference()

    let refgroc = FIRDatabase.database().reference(withPath: "grocery-items")
    let refcat = FIRDatabase.database().reference(withPath: "categories")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
        ref.observe(.value, with: { snapshot in
            print("Snap \(snapshot.value)")
            let keycat = snapshot.key
            print("key: \(keycat)")
        })
        
        refcat.observe(.value, with: { snapshot in
            print("Snap2 \(snapshot.value)")
            let keycat = snapshot.key
            print("keycat: \(keycat)")
            
        })
    
        
        
        /*DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            //print(snapshot.value)
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    
                   /* if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                        
                        print("steve: \(key)")
                        
                    }*/

                    
                    
                }
            }
            self.tableView.reloadData()
        })*/
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let post = posts[indexPath.row]
        //print("Steve: \(post.caption)")
        
        return tableView.dequeueReusableCell(withIdentifier: "PostCell" ) as! PostCell

    }

}
