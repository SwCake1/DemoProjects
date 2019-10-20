//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/20/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit
import LBTATools

class EpisodesViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let episodes = [Episode]()
    
    private var filteredEpisodes = [Episode]()
    
    private var searchController: UISearchController!
    
    // MARK: - Constants
    
    private let cellID = "cellID"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavBarView()
        setupSearchController()
    }
    
    // MARK: - Setup Search Controller
    
    private func setupSearchController() {
        
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        
        if #available(iOS 11, *) {
            self.navigationItem.searchController = searchController
            self.navigationItem.searchController?.isActive = true
            self.navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
    }
    
    // MARK: - Navigation Bar View
    
    private func setupNavBarView() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        let titleLabel = UILabel(text: "Episodes", font: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold), textColor: .white)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 74, green: 99, blue: 109)
    }
}

// MARK: - UITableViewDelegate
    
extension EpisodesViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
//        vc.episode = episodes[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    
// MARK: - UITableViewDataSource

extension EpisodesViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

}


// MARK: - UISearchBarDelegate

extension EpisodesViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

}

// MARK: - UISearchResultsUpdating

extension EpisodesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        
        filteredEpisodes = episodes.filter { episode in
              return episode.name.lowercased().contains(searchText.lowercased()) || searchText == ""
          }
        tableView.reloadData()
    }
}
