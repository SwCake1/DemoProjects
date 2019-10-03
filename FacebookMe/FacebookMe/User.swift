//
//  User.swift
//  FacebookMe
//
//  Created by pennyworth on 10/2/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct User {
    let name : String
    let picture : UIImage?
    
    init(name: String,
        picture: String) {
        self.name = name
        self.picture = UIImage(imageLiteralResourceName: picture)
    }
}
