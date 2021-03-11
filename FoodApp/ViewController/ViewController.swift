//
//  ViewController.swift
//  FoodApp
//
//  Created by Clint Favor on 3/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, ModelDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var foods = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getFood()
    }
    
    func foodsFetched(_ foods: [Food]) {
        self.foods = foods
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.FOOD_CELL_ID, for: indexPath) as! FoodTableViewCell
        
        let food = self.foods[indexPath.row]

        cell.setCell(food)
        
        return cell
    }
    
}

