//
//  Model.swift
//  FoodApp
//
//  Created by Clint Favor on 3/10/21.
//

import Foundation

protocol ModelDelegate {
    func foodsFetched(_ foods: [Food])
}

class Model {
    var delegate:ModelDelegate?
    
    func getFood(searchString:String?) {
        let encodedSearchString = searchString!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: Constants.API_URL + encodedSearchString!)
        
        guard url != nil else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.hints != nil {
                    DispatchQueue.main.async {
                        self.delegate?.foodsFetched(response.hints!)
                    }
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
