//
//  ProductViewController.swift
//  OldPhones
//
//  Created by pennyworth on 9/9/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var phoneName: String!
    var phoneImg: UIImage!
    
    let phoneImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        
        phoneImageView.image = phoneImg
        label.text = phoneName
        addButton.setImage(UIImage(imageLiteralResourceName: "button-addtocart"), for: .normal)
    }
    
    func setupView() {
        view.addSubview(phoneImageView)
        view.addSubview(label)
        view.addSubview(addButton)
               
        phoneImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        phoneImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        phoneImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        phoneImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        addButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
