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
            collectionView.reloadData()
        }
    }
    
    var characters: [Character] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Constants
    
    private let cellID = "cellID"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = UIColor.rgb(red: 74, green: 99, blue: 109)
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CharacterCell
        let character = characters[indexPath.row]
        guard let imageURL = character.image else { return cell }
        guard let name = character.name else { return cell }
        guard let species = character.species else { return cell }
        guard let origin = character.origin else { return cell }
        guard let location = character.location else { return cell }
        cell.nameLabel.text = name
        cell.speciesLabel.text = "Species: " + species
        cell.originLabel.text = "Origin: " + origin
        cell.locationLabel.text = "Location: " + location
        cell.imageView.loadImage(urlString: imageURL)
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
