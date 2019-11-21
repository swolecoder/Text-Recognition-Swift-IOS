//
//  ViewController.swift
//  OCR
//
//  Created by Ashish Ranjan on 11/20/19.
//  Copyright © 2019 Ashish Ranjan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    let kTextRecog = "textRecog"
    @IBOutlet weak var imageV: UIImageView!
    lazy var imagePicker: UIImagePickerController = {
        return UIImagePickerController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    //MARK: choose button action
    @IBAction func didTapChooseImage(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        // present image picker controller
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        // The info dictionary may contain multiple representations of the image. You want to use the original.
      if let selectedImage = info[.originalImage] as? UIImage {
              imageV.image = selectedImage
        }
        // Set photoImageView to display the selected image.
       
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: segue actions
    @IBAction func didTapTextRecog(_ sender: UIButton) {
        performSegue(withIdentifier: kTextRecog, sender: self)
    }
   
    
    //MARK: perpare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kTextRecog {
            let vc = segue.destination as! TextRecoViewController
            vc.sourceImage = self.imageV.image
        }
    }
    
}

