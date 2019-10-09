//
//  DetailViewController.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var works = [ArtWork]()
    
    var author = ""
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = author
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 117/255, green: 157/255, blue: 71/255, alpha: 1)
        self.tableView.tableFooterView = UIView()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let work = works[indexPath.row]
        
        cell.textLabel?.text = work.title
        cell.imageView?.image = UIImage(named: work.image)
        cell.detailTextLabel?.text = work.info

        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return works.count
    }
}

