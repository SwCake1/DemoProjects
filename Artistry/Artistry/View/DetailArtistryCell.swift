//
//  DetailArtistryCell.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class DetailArtistryCell: UITableViewCell {
    
    let workImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let workNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let moreInfoTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Select For More Info >"
        textView.textColor = .systemGray
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        contentView.addSubview(workImageView)
        workImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        workImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        workImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        workImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -110).isActive = true
        
        contentView.addSubview(workNameLabel)
        workNameLabel.topAnchor.constraint(equalTo: workImageView.bottomAnchor, constant: 20).isActive = true
        workNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        workNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        
        contentView.addSubview(moreInfoTextView)
        moreInfoTextView.topAnchor.constraint(equalTo: workNameLabel.bottomAnchor, constant: 20).isActive = true
        moreInfoTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        moreInfoTextView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        moreInfoTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        moreInfoTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        
        
        
    }
}
