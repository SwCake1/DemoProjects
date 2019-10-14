//
//  ArtistryCell.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class ArtistryCell: UITableViewCell {
    
    let artistryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        contentView.addSubview(bioLabel)
        bioLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        bioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10 ).isActive = true
        bioLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        bioLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        

        
        contentView.addSubview(artistryImageView)
        artistryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        artistryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        artistryImageView.trailingAnchor.constraint(equalTo: bioLabel.leadingAnchor, constant: -10).isActive = true
        artistryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        
        contentView.addSubview(nameLabel)
        
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: bioLabel.leadingAnchor, constant: -10).isActive = true
    }
}
