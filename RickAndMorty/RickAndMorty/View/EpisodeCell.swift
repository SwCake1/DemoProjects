//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/24/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit
import LBTATools

class EpisodeCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let episodeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let airDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.rgb(red: 63, green: 88, blue: 98)
        
        addSubview(nameLabel)
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(episodeLabel)
        episodeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        episodeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
        episodeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        episodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(airDateLabel)
        airDateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        airDateLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        airDateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        airDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(separatorLine)
        separatorLine.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
