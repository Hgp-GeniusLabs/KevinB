//
//  CommentsViewController.swift
//  PlayGround2
//
//  Created by Kevin on 7/27/17.
//  Copyright © 2017 Kevin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var refComments: DatabaseReference!
    var refUsername: DatabaseReference!
    
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentsTableView: UITableView!
    
    
    var commentsList = [CommentModel]()
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentsTableViewCell
        
        let comment: CommentModel
        
        comment = commentsList[indexPath.row]
        
        cell.playerComment.text = comment.playerComment
        cell.playerUsername.text = comment.playerUsername
        
        return cell
    }
    
    @IBAction func addComment(_ sender: Any) {
        addComment()
    }
    func addComment() {
        //generating a new key inside artists node
        //and also getting the generated key
        let key = refComments.childByAutoId().key
        
        //suppose to get the username declared in the signinviewcontroller
        let username = Auth.auth().currentUser?.email
        
        //creating comment with the given values
        let comment = ["id":key,
                      "playerComment": commentTextField.text! as String,
                      "playerUsername": username
        ]
        
        //adding the comment inside the generated unique key
        refComments.child(key).setValue(comment)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refComments = Database.database().reference().child("comments")
        refUsername = Database.database().reference().child("username")
        
        
        refComments.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.commentsList.removeAll()
                
                for comments in snapshot.children.allObjects as! [DataSnapshot] {
                    let commentObject = comments.value as? [String: AnyObject]
                    let playerComment = commentObject?["playerComment"]
                    let commentId = commentObject?["commentId"]
                    let playerUsername = commentObject?["playerUsername"]
                    
                    let comment = CommentModel(id: commentId as! String?, playerComment: playerComment as! String?, playerUsername: playerUsername as! String?)
                    
                    self.commentsList.append(comment)
                }
                
                self.commentsTableView.reloadData()
            }
        })
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
