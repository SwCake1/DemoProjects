//
//  Phone.swift
//  OldPhones
//
//  Created by pennyworth on 9/10/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct Phone {
    let name : String?
    let logo : UIImage?
    let picture : UIImage?
    
    init(name: String? = nil,
        logoImgName: String? = nil,
        pictureName: String? = nil) {
        
        self.name = name
        self.logo = UIImage(imageLiteralResourceName: logoImgName!)
        self.picture = UIImage(imageLiteralResourceName: pictureName!)
    }
}
