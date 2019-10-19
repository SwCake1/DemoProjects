//
//  Candy.swift
//  CandySearch
//
//  Created by pennyworth on 10/16/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct Candy {
    let name: String
    let category: String
    let picture: UIImage
    
    init(name: String, category: String) {
        
        self.name = name
        self.category = category
        self.picture = UIImage(imageLiteralResourceName: name)
    }
}
