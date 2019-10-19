//
//  ResultsTableController.swift
//  CandySearch
//
//  Created by pennyworth on 10/18/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

//import UIKit
//
//class ResultsTableController: BaseTableViewController {
//
//    // MARK: - UITableViewDataSource
//
////    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewController.tableViewCellIdentifier, for: indexPath)
////        cell = UITableViewCell(style: .subtitle, reuseIdentifier: BaseTableViewController.tableViewCellIdentifier)
////        let candy = candys[indexPath.row]
////        configureCell(cell, forCandy: candy)
////        return cell
////    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredCandys.count
//    }
//}

import UIKit

class ResultsTableController: BaseTableViewController {
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BaseTableViewController.filteredCandies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewController.tableViewCellIdentifier, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: BaseTableViewController.tableViewCellIdentifier)
        let candy = BaseTableViewController.filteredCandies[indexPath.row]
        configureCell(cell, forCandy: candy)
        
        return cell
    }
}
