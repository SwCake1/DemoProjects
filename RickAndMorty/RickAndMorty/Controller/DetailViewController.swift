//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/20/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit
import LBTATools

class DetailViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var episode: Episode? {
        didSet {
//            for character in episode?.characters ?? <#default value#> {
//                fetchJSON(character)
//            }
            collectionView.reloadData()
        }
    }
    
    var characters: [Character] = []
    
    // MARK: - Constants
    
    private let cellID = "cellID"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("detail loadid")
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = UIColor.rgb(red: 74, green: 99, blue: 109)
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return episode.characters.count
        return characters.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CharacterCell
        let character = characters[indexPath.row]
////        guard let imageUrl = URL(string: character.image) else { return }
        let imageUrl = URL(string: character.image)
        cell.imageView.load(url: imageUrl!)
        cell.nameLabel.text = character.name
        cell.speciesLabel.text = "Species: " + character.species
        cell.originLabel.text = "Origin: " + character.origin
        cell.locationLabel.text = "Location: " + character.location

        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 310, height: 250)
    }
}

extension DetailViewController: EpisodeSelectionDelegate {
    func episodeSelected(_ newEpisode: Episode, episodeCharacters: [Character]) {
        episode = newEpisode
        characters = episodeCharacters
  }
}
