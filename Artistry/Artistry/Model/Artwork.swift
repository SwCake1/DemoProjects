//
//  ArtWork.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct ArtWork: Codable {
    let title : String
    let image : String
    let info: String
    var isExpanded: Bool
    
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      title = try container.decode(String.self, forKey: .title)
      image = try container.decode(String.self, forKey: .image)
      info = try container.decode(String.self, forKey: .info)
      isExpanded = false
    }
}


