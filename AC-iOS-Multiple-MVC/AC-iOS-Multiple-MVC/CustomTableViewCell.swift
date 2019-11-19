//
//  CustomTableViewCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tsering Lama on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var animalPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var continentLabel: UILabel!
    
    func configureCell(animal: ZooAnimal) {
        animalPhoto.image = UIImage(named: String(animal.imageNumber))
        nameLabel.text = animal.name
        continentLabel.text = animal.origin
    }
}
