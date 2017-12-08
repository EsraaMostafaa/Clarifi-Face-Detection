//
//  MainVC.swift
//  Clarifi Face Detection
//
//  Created by Admin on 12/7/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MainVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    @IBAction func getImageButton(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let face = Face(context: context)
            face.image = image
            
            performSegue(withIdentifier: "TagView", sender: face)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TagView" {
            if let distination = segue.destination as? TagView {
                if let faceData = sender as? Face {
                    distination.faceItem = faceData
                }
            }
        }
    }

}

