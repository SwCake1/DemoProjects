//
//  MenuViewController.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    let artists = Artist.readResources()
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationItem.title = "Artistry"
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 117/255, green: 157/255, blue: 71/255, alpha: 1)
        self.tableView.tableFooterView = UIView()

        tableView.register(ArtistryCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArtistryCell
        let artist = artists[indexPath.row]
        cell.artistryImageView.image = UIImage(named: artist.image)
        cell.nameLabel.text = artist.name
        
        cell.bioLabel.text = artist.bio
        cell.textLabel?.numberOfLines = 0

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.author = artists[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 350
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
}

