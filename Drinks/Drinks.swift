//
//  Drinks.swift
//  Drinks
//
//  Created by Harsh Verma on 04/05/21.
//

import Foundation
class Drinks {
    
    struct Return: Codable {
        var drinks: [Drink] //hold array of drink
    }
    
    struct Drink: Codable {
        var strDrink = ""
    }
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=A"
    var drinkArray: [Drink] = []
    
    func getData(completion: @escaping() -> ()) {
        print("accessing url:- \(urlString)")
        
        //create url
        guard let url = URL(string: urlString) else {
            print("Error accessing url")
            completion()
            return
        }
        
        //Session Creation
        let session = URLSession.shared
        
        //Obtain the Data
        let task = session.dataTask(with: url) { data, response, error in
            if let err = error {
                print(err.localizedDescription)
            }
            do {
                let returned = try JSONDecoder().decode(Return.self, from: data!)
                print(returned)
                self.drinkArray = self.drinkArray + returned.drinks
            }
            catch {
                print(error.localizedDescription)
            }
            completion()
        }
        task.resume()
    }
    
}
