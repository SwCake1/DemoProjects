//
//  MenuItem.swift
//  FacebookMe
//
//  Created by pennyworth on 10/2/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct MenuItem {
    let name : String
    let icon : UIImage
    
    init(name: String,
        icon: String) {
        self.name = name
        self.icon = UIImage(imageLiteralResourceName: icon)
    }
}
