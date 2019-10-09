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
//        imageView.image = UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .red
        return imageView
    }()
    
    let bioTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField
//        textField.isEditing = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
//        contentView.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(bioTextField)
        bioTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        bioTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        artistryImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        artistryImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
