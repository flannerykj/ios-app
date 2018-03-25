//
//  PostTableViewController.swift
//  iOS App
//
//  Created by Flannery Jefferson on 2018-03-24.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user1 =  User(username: "flannerykj", email: "flannj@gmail.com")
        
        let photo1 = UIImage(named: "fruit.jpeg")
        let photo2 = UIImage(named: "mountains.jpg")
        
        let post1 = Post(title: "Hello World Post", user: user1, body: "Lorem ipsum text", category: "History", datePublished: Date(), image: photo1!)
        let post2 = Post(title: "Second Post", user: user1, body: "jhhddrtgghjj text", category: "Science", datePublished: Date(), image: photo2!)
        posts += [post1, post2]
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
        cell.coverPhotoView?.image = post.image
        cell.bodyLabel.text = post.body
        cell.usernameLabel.text = post.user.username
        cell.dateLabel.text = post.datePublished.description
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
