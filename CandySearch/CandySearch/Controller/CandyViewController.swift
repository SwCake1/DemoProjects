//
//  CandyViewController.swift
//  CandySearch
//
//  Created by pennyworth on 10/16/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class CandyViewController: UIViewController {
    
    // MARK: - Properties
    
    var candy: Candy!
    
    let сandyView = CandyView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = candy.category
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func loadView() {
        сandyView.imageView.image = candy.picture
        сandyView.titleLabel.text = candy.name
        view = сandyView
    }
}
