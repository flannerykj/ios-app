//
//  PostViewController.swift
//  iOS App
//
//  Created by Flannery Jefferson on 2018-03-24.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import os.log

class PostViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var post: Post?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddPostMode = presentingViewController is UINavigationController
        if (isPresentingInAddPostMode) {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var bodyTextField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        titleTextField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("ok")
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    //MARK: Navigation
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
    // Configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let titleText = titleTextField.text ?? ""
        let bodyText = bodyTextField.text ?? ""
        let photo = photoImageView.image
        let user1 =  User(username: "flannerykj", email: "flannj@gmail.com")
        post = Post(title: titleText, user: user1, body: bodyText, category: "photography", datePublished: Date.init(), image: photo!)
    }
    
    // MARK: Actions
    @IBAction func saveNewPost(_ sender: UIBarButtonItem) {
        print("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
        if let post = post {
            navigationItem.title = post.title
            titleTextField.text   = post.title
            photoImageView.image = post.image
            bodyTextField.text = post.body
        }
    }

}
