//
//  DetailsViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tsering Lama on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
        
    var data: ZooAnimal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: String(data.imageNumber))
        textLabel.text = data.info
    }
  

}
