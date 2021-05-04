//
//  ViewController.swift
//  Drinks
//
//  Created by Harsh Verma on 04/05/21.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var drink = Drinks()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        drink.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


}
extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drink.drinkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = drink.drinkArray[indexPath.row].strDrink
        cell.detailTextLabel?.text = "-"
        return cell
    }
    
    
}
