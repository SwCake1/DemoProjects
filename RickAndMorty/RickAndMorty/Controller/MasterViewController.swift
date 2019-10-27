//
//  MasterViewController.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/20/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit
import LBTATools
import TRON
import SwiftyJSON

class MasterViewController: UITableViewController {
    
    // MARK: - Properties

    
    weak var delegate: EpisodeSelectionDelegate?
    
    var episodes: [Episode] = []
    var characters: [Character] = []
    
    private var filteredEpisodes = [Episode]()
    
    private var searchController: UISearchController!
    
    private let group = DispatchGroup()
    
//    private let lastPage = false
    
    // MARK: - Constants
    
    private let cellID = "cellID"
    private let tron = TRON(baseURL: "https://rickandmortyapi.com")
//    private var ApiPath = "/api/episode/"
//    private var ApiQuery: String?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(episodes)
        
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: cellID)
        setupNavBarView()
        setupSearchController()
        
        view.backgroundColor = UIColor.rgb(red: 74, green: 99, blue: 109)
        fetchJSON()
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
        var episodeCharacters = [Character]()
        let selectedEpisode = episodes[indexPath.row]
//        guard let charactersUrl = selectedEpisode.characters else { return }
        for selectedcharacter in selectedEpisode.characters! {
            for character in characters {
                if selectedcharacter == character.url {
                    episodeCharacters.append(character)
                }
            }
        }
        delegate?.episodeSelected(selectedEpisode, episodeCharacters: episodeCharacters)
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
        cell.episodeLabel.text = episode.episodeNum
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
//        tableView.reloadData()
    }
}

// MARK: - Fetch JSON

extension MasterViewController {

    fileprivate func fetchJSON() {
        
        for i in 0 ..< 2 {
            group.enter()
            fetchEpisodesPageJSON(page: i + 1)
            print(123)
        }
        
        for i in 0 ..< 20 {
            group.enter()
            fetchCharactersPageJSON(page: i + 1)
            print(123)
        }
        
        group.notify(queue: DispatchQueue.main, execute: {
            self.tableView.reloadData()
        })
    }
    
    private class EpisodesPageResource: JSONDecodable {
        
        var episodes: [Episode]?
        
        required init(json: JSON) throws {
            var episodes = [Episode]()
            let array = json["results"].array
            guard let episodesJSON = array else {
                return
            }
            for episodeJSON in episodesJSON {
                let id = episodeJSON["id"].intValue
                let name = episodeJSON["name"].stringValue
                let airDate = episodeJSON["air_date"].stringValue
                let episodeNum = episodeJSON["episode"].stringValue
                let characters = episodeJSON["characters"].arrayObject as? [String]
                
                let episode = Episode(id: id, name: name, airDate: airDate, episodeNum: episodeNum, characters: characters)
                episodes.append(episode)
            }
            self.episodes = episodes
            
        }
    }
    
    fileprivate func fetchEpisodesPageJSON(page: Int) {
        let request: APIRequest<EpisodesPageResource, APIError> = tron.swiftyJSON.request("/api/episode/").parameters(["page" : page])
        
        request.perform(withSuccess: { (episodesPage) in
            print("Successfully fetched our json objects")
            print(episodesPage)
            guard let episodes = episodesPage.episodes else { return }
            self.episodes += episodes
            self.group.leave()

        }) { (err) in
            print("Failed to fetch json...", err)
            self.group.leave()
        }
    }
    
    private class CharactersPageResource: JSONDecodable {
        
        var characters: [Character]?
        
        required init(json: JSON) throws {
            var characters = [Character]()
            let array = json["results"].array
            guard let charactersJSON = array else {
                return
            }
            for characterJSON in charactersJSON {
                let id = characterJSON["id"].intValue
                let name = characterJSON["name"].stringValue
                let image = characterJSON["image"].stringValue
                let species = characterJSON["species"].stringValue
                let gender = characterJSON["gender"].stringValue
                guard let originDic = characterJSON["origin"].dictionary else { return }
                guard let origin = originDic["name"]?.stringValue else { return }
                guard let locationDic = characterJSON["location"].dictionary else { return }
                guard let location = locationDic["name"]?.stringValue else { return }
//                let location = characterJSON["location"].stringValue
                let url = characterJSON["url"].stringValue
                
                let character = Character(id: id, name: name, image: image, species: species, gender: gender, origin: origin, location: location, url: url)
                characters.append(character)
            }
            self.characters = characters
            
        }
    }
    
    fileprivate func fetchCharactersPageJSON(page: Int) {
        let request: APIRequest<CharactersPageResource, APIError> = tron.swiftyJSON.request("/api/character/").parameters(["page" : page])
        
        request.perform(withSuccess: { (charactersPage) in
            print("Successfully fetched our json objects")
            guard let characters = charactersPage.characters else { return }
            self.characters += characters
            self.group.leave()

        }) { (err) in
            print("Failed to fetch json...", err)
            self.group.leave()
        }
    }
}

protocol EpisodeSelectionDelegate: class {
    func episodeSelected(_ newEpisode: Episode, episodeCharacters: [Character])
}
