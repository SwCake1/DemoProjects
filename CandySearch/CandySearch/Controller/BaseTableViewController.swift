//
//  BaseTableViewController.swift
//  CandySearch
//
//  Created by pennyworth on 10/16/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(imageLiteralResourceName: "Inline-Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Properties
    
    static var filteredCandies = [Candy]()
    
    // MARK: - Constants
    
    static let tableViewCellIdentifier = "cellID"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: BaseTableViewController.tableViewCellIdentifier)
        setupNavBarView()
    }
    
    // MARK: - Navigation Bar View
    
    func setupNavBarView() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        navigationItem.titleView = titleImageView
        navigationController?.navigationBar.barTintColor = UIColor(red: 118/255, green: 204/255, blue: 140/255, alpha: 1)
    }
    
    // MARK: - Configuration
    
    func configureCell(_ cell: UITableViewCell, forCandy candy: Candy) {
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category
    }
}


