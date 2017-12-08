//
//  TagView.swift
//  Clarifi Face Detection
//
//  Created by Admin on 12/8/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class TagView: UIViewController {
    
    var faceItem: Face?
    @IBOutlet weak var chosenImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        chosenImage.image = faceItem?.image as? UIImage
        
    }
}
