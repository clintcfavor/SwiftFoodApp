//
//  FoodTableViewCell.swift
//  FoodApp
//
//  Created by Clint Favor on 3/11/21.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodSearchBar: UISearchBar!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var enercKcal: UILabel!
    @IBOutlet weak var procnt: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var chocdf: UILabel!
    @IBOutlet weak var fibtg: UILabel!
    
    var food:Food?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ food:Food) {
        self.food = food
        
        self.foodLabel.text = food.label
        self.enercKcal.text = String(format: "Ener-C KCal: %.2f", food.enerc_kcal)
        self.procnt.text = String(format: "Procnt: %.2f", food.procnt)
        self.fat.text = String(format: "Fat: %.2f", food.fat)
        self.chocdf.text = String(format: "Chocdf: %.2f", food.chocdf)
        self.fibtg.text = String(format: "Fibtg: %.2f", food.fibtg)
    }

}
