//
//  Food.swift
//  FoodApp
//
//  Created by Clint Favor on 3/10/21.
//

import Foundation

struct Food:Decodable {
    var label = ""
    var enerc_kcal:Double = 0.0
    var procnt:Double = 0.0
    var fat:Double = 0.0
    var chocdf:Double = 0.0
    var fibtg:Double = 0.0
    var category = ""
    var categoryLabel = ""
    var imageUrl = ""
    
    enum CodingKeys: String, CodingKey {
        case food
        case label
        case nutrients
        case enerc_kcal = "ENERC_KCAL"
        case procnt = "PROCNT"
        case fat = "FAT"
        case chocdf = "CHOCDF"
        case fibtg = "FIBTG"
        case category
        case categoryLabel
        case imageUrl = "image"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let foodContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .food)
        self.label = try foodContainer.decode(String.self, forKey: .label)
        let nutrientsContainer = try foodContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .nutrients)
        self.enerc_kcal = try nutrientsContainer.decodeIfPresent(Double.self, forKey: .enerc_kcal) ?? 0.0
        self.procnt = try nutrientsContainer.decodeIfPresent(Double.self, forKey: .procnt) ?? 0.0
        self.fat = try nutrientsContainer.decodeIfPresent(Double.self, forKey: .fat) ?? 0.0
        self.chocdf = try nutrientsContainer.decodeIfPresent(Double.self, forKey: .chocdf) ?? 0.0
        self.fibtg = try nutrientsContainer.decodeIfPresent(Double.self, forKey: .fibtg) ?? 0.0
        self.category = try foodContainer.decodeIfPresent(String.self, forKey: .category) ?? "None"
        self.categoryLabel = try foodContainer.decodeIfPresent(String.self, forKey: .categoryLabel) ?? "None"
        self.imageUrl = try foodContainer.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
    }
}
