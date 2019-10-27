//
//  Episode.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/21/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import TRON
import SwiftyJSON

//struct Info: Decodable {
//    let count: Int
//    let pages: Int
//    let next: String?
//    let prev: String?
//}
//
//struct JsonData: Decodable {
//    let info: Info
//    let results: [Episode]
//}

struct Episode {
    let id: Int?
    let name: String?
    let airDate: String?
    let episodeNum: String?
    let characters: [String?]?
    
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
////        if let name = try container.decodeIfPresent(String.self, forKey: .name) {
////            self.name = name
////        }
//        self.name = try container.decodeIfPresent(String.self, forKey: .name)
//        self.airDate = try container.decodeIfPresent(String.self, forKey: .airDate)
//        self.episode = try container.decodeIfPresent(String.self, forKey: .episode)
//        self.characters = try container.decodeIfPresent([String].self, forKey: .episode)
//    }
}
