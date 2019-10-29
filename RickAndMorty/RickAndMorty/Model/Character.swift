//
//  Character.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/21/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct Character: Decodable {
    
    let id: Int?
    let name: String?
    let image: String?
    let species: String?
    let gender: String?
    let origin: String?
    let location: String?
    let url: String?
}
