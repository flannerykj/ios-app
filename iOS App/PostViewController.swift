//
//  PostViewController.swift
//  iOS App
//
//  Created by Flannery Jefferson on 2018-03-24.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
    }
    
    // MARK: Actions
    @IBAction func saveNewPost(_ sender: UIBarButtonItem) {
        print("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
