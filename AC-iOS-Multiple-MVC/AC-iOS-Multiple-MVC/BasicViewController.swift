//
//  BasicViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tsering Lama on 11/19/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {
    
    
    @IBOutlet weak var basicTable: UITableView!
    
    private var data = ZooAnimal.zooAnimals {
        didSet {
            basicTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicTable.dataSource = self
    }
}

extension BasicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        let animal = data[indexPath.row]
        cell.textLabel?.text = animal.name
        cell.detailTextLabel?.text = animal.origin
        cell.imageView?.image = UIImage(named: String(animal.imageNumber))
        return cell
    }
}
