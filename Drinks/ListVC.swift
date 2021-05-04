//
//  ViewController.swift
//  Drinks
//
//  Created by Harsh Verma on 04/05/21.
//

import UIKit

class ListVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:- Variables
    var drink = Drinks()
    
    //MARK:- View Controller Entry Point
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let dest = segue.destination as! DetailVC
            let selected = tableView.indexPathForSelectedRow!
            dest.drink = drink.drinkArray[selected.row]
        }
    }


}

//MARK:- Extension
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
