//
//  Response.swift
//  FoodApp
//
//  Created by Clint Favor on 3/10/21.
//

import Foundation

struct Response:Decodable {
    var hints:[Food]?
    
    enum CodingKeys: String, CodingKey {
        case hints
    }

    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.hints = try container.decode([Food].self, forKey: .hints)
    }
}
