//
//  TextRecoViewController.swift
//  OCR
//
//  Created by Ashish Ranjan on 11/20/19.
//  Copyright © 2019 Ashish Ranjan. All rights reserved.
//

import UIKit
import Firebase


class TextRecoViewController: UIViewController {
    
    var sourceImage: UIImage?
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var textV: UITextView!
    
    
    //MARK: Firebase var
     lazy var vision = Vision.vision()
     var textDetector:  VisionTextRecognizer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imageV.image = sourceImage
        self.textV.text = ""
        //
        textDetector = vision.onDeviceTextRecognizer()
    }
    
    
          override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
    
            let image = VisionImage(image: sourceImage!)
            
            textDetector!.process(image) { result, error in

                guard error == nil, let result = result else {


                    return

                }
                let text = result.text
                self.textV.text = self.textV.text + " " + text
            }
        }
    
}
