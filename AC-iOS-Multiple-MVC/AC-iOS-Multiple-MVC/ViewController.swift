//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
//    private var animals = ZooAnimal.zooAnimals {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    var data = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        data = ZooAnimal.getSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailsViewController, let indexpath = tableView.indexPathForSelectedRow else {
            return
        }
        vc.data = data[indexpath.row][indexpath.section]
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        let animal = data[indexPath.section][indexPath.row]
        cell.textLabel?.text = animal.name
        cell.detailTextLabel?.text = animal.origin
        cell.imageView?.image = UIImage(named: String(animal.imageNumber))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].first?.classification
    }
}

