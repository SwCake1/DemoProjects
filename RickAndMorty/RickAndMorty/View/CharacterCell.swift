//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/22/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit
import LBTATools

class CharacterCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: UIImage(named: "Morty"),contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Morty Smith", font: .systemFont(ofSize: 17), textColor: .white, numberOfLines: 0)
    let speciesLabel = UILabel(text: "Species: Human", font: .systemFont(ofSize: 15),textColor: .white, numberOfLines: 0)
    let genderLabel = UILabel(text: "Gender: Male", font: .systemFont(ofSize: 15),textColor: .white, numberOfLines: 0)
    let originLabel = UILabel(text: "Origin: Earth (C-137)", font: .systemFont(ofSize: 15),textColor: .white, numberOfLines: 0)
    let locationLabel = UILabel(text: "Location: Earth (Replacement Dimension)", font: .systemFont(ofSize: 15),textColor: .white, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.layer.cornerRadius = 125 / 2
        stack(hstack(imageView.withSize(.init(width: 125, height: 125)), nameLabel, spacing: 16, alignment: .center), speciesLabel, genderLabel, originLabel, locationLabel, spacing: 6).withMargins(.allSides(12))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
