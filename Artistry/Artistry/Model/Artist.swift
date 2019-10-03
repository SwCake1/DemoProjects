//
//  Artist.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct Artist {
    let name : String
    let picture : UIImage
    let bio: String
    let works: [ArtWork]
    
    static func readResources() -> [Artist] {
        
        var artists = [Artist]()
        
        let path = Bundle.main.path(forResource: "artists", ofType: "json")
        
        
        // json decode
        
        return artists
    }
}
