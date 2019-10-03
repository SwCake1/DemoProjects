//
//  ArtWork.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct ArtWork {
    let title : String
    let image : UIImage
    let info: String
    
    init(title: String, imageName: String, info: String) {
        self.title = title
        self.image = UIImage(imageLiteralResourceName: imageName)
        self.info = info
    }
}
