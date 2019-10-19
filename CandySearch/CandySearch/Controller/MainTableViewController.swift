//
//  MainTableViewController.swift
//  CandySearch
//
//  Created by pennyworth on 10/17/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class MainTableViewController: BaseTableViewController {
    // MARK: - Properties
    
    var candies = [Candy]()
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var searchController: UISearchController!
    
    private var resultsTableController: ResultsTableController!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }
    
    // MARK: - Setup Search Controller
    
    private func setupSearchController() {
        resultsTableController = ResultsTableController()
        
        resultsTableController.tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsTableController)
        
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
        if #available(iOS 11, *) {
            self.navigationItem.searchController = searchController
            self.navigationItem.searchController?.isActive = true
            self.navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
    }
}



// MARK: - UITableViewDelegate
    
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CandyViewController()
        vc.candy = candies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    
// MARK: - UITableViewDataSource

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewController.tableViewCellIdentifier, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: BaseTableViewController.tableViewCellIdentifier)
        let candy: Candy
        
        if searchController.isActive {
            candy = BaseTableViewController.filteredCandies[(indexPath as NSIndexPath).row]
        } else {
            candy = candies[(indexPath as NSIndexPath).row]
        }
        configureCell(cell, forCandy: candy)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return BaseTableViewController.filteredCandies.count
        } else {
            return candies.count
        }
    }
}

// MARK: - UISearchBarDelegate

extension MainTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }

}

// MARK: - UISearchResultsUpdating

extension MainTableViewController: UISearchResultsUpdating {
    
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        BaseTableViewController.filteredCandies = candies.filter { candy in
              if !(candy.category == scope) && scope != "All" {
                  return false
              }
              
              return candy.name.lowercased().contains(searchText.lowercased()) || searchText == ""
          }
        tableView.reloadData()
        resultsTableController.tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}
