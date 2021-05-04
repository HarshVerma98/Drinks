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
    
   let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f="
    var urlString = ""
    var drinkArray: [Drink] = []
    let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var index = 0
    var isFecthing = false
    //MARK:- API Access Method
    func getData(completion: @escaping() -> ()) {
        
        guard !isFecthing else {
            print("Not accessing due to no availabilty of data")
            completion()
            return
        }
        isFecthing = true
        print("accessing url:- \(urlString)")
        urlString = baseUrl + alphabets[index]
        index += 1
        //create url
        guard let url = URL(string: urlString) else {
            print("Error accessing url")
            isFecthing = false
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
                self.drinkArray += returned.drinks
            }
            catch {
                print(error.localizedDescription)
            }
            self.isFecthing = false
            completion()
        }
        task.resume()
    }
    
}
