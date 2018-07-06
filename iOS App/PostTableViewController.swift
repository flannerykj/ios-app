//
//  PostTableViewController.swift
//  iOS App
//
//  Created by Flannery Jefferson on 2018-03-24.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//
import os.log
import UIKit

class PostTableViewController: UITableViewController {
    var posts = [Post]()
    
    func loadSamplePosts() {
        let user1 =  User(username: "flannerykj", email: "flannj@gmail.com")
        
        let photo1 = UIImage(named: "fruit.jpeg")
        let photo2 = UIImage(named: "mountains.jpg")
        
        let post1 = Post(title: "Hello World Post", user: user1, body: "Lorem ipsum text", category: "History", datePublished: Date(), image: photo1!)
        let post2 = Post(title: "Second Post", user: user1, body: "jhhddrtgghjj text", category: "Science", datePublished: Date(), image: photo2!)
        let post3 = Post(title: "Third Post", user: user1, body: "jhhddrtgghjj text", category: "Science", datePublished: Date(), image: photo1!)
        posts += [post1, post2, post3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        loadSamplePosts()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            fatalError("table cell is not of type PostTableViewCell")
        }
        
        let post = posts[indexPath.row]
        cell.titleLabel.text = post.title
        
        // cell.coverPhotoView?.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        
        cell.coverPhotoView?.contentMode = UIViewContentMode.scaleAspectFill
        cell.coverPhotoView?.image = post.image
        
        cell.bodyLabel.text = post.body
        cell.usernameLabel.text = post.user.username
        cell.dateLabel.text = post.datePublished.description

        return cell
    }
    
    // MARK: Actions
    @IBAction func unwintoPostList(sender: UIStoryboardSegue) {
        

        if let sourceViewController = sender.source as? PostViewController, let post = sourceViewController.post {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                posts[selectedIndexPath.row] = post
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add a new post.
                let newIndexPath = IndexPath(row: posts.count, section: 0)
                posts.append(post)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            posts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "AddPost":
            print("adding new")
        case "ShowDetail":  
            print("showing detail")
            guard let postDetailViewController = segue.destination as? PostViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPostCell = sender as? PostTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")

            }
            
            guard let indexPath = tableView.indexPath(for: selectedPostCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedPost = posts[indexPath.row]
            postDetailViewController.post = selectedPost
        default:
            print("didn't work")
        }
    }

}
