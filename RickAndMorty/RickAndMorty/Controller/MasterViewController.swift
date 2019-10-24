//
//  MasterViewController.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/20/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit
import LBTATools
import Kingfisher

class MasterViewController: UITableViewController {
    
    // MARK: - Properties
    
    weak var delegate: EpisodeSelectionDelegate?
    
    var episodes = [Episode]()
    var characters = [Character]()
    
    private var filteredEpisodes = [Episode]()
    
    private var searchController: UISearchController!
    
    // MARK: - Constants
    
    private let cellID = "cellID"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
        
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: cellID)
        setupNavBarView()
        setupSearchController()
        
        view.backgroundColor = UIColor.rgb(red: 74, green: 99, blue: 109)
    }
    
    
    fileprivate func fetchJSON() {
        let urlString = "https://rickandmortyapi.com/api/episode/"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in DispatchQueue.main.async {
            if let err = err {
                print("Failed to get data from url:", err)
                return
            }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let jsondata = try decoder.decode(JsonData.self, from: data)
                self.episodes = jsondata.results
                self.tableView.reloadData()
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }
        }.resume()
    }

    
    // MARK: - Setup Search Controller
    
    private func setupSearchController() {
        
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.searchController?.isActive = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
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

extension MasterViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEpisode = episodes[indexPath.row]
        delegate?.episodeSelected(selectedEpisode)
        if let detailViewController = delegate as? DetailViewController {
          splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
}

// MARK: - UITableViewDataSource

extension MasterViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! EpisodeCell
        let episode = episodes[indexPath.row]
        cell.nameLabel.text = episode.name
        cell.episodeLabel.text = episode.episode
        cell.airDateLabel.text = episode.airDate
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

}

// MARK: - UISearchBarDelegate

extension MasterViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

}

// MARK: - UISearchResultsUpdating

extension MasterViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        
//        filteredEpisodes = episodes.filter { episode in
//              return episode.name.lowercased().contains(searchText.lowercased()) || searchText == ""
//          }
        tableView.reloadData()
    }
}

protocol EpisodeSelectionDelegate: class {
    func episodeSelected(_ newEpisode: Episode)
}
