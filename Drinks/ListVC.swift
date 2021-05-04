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
    var myDrink: [String: String] = [:]
    //MARK:- View Controller Entry Point
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        drink.getData {
            DispatchQueue.main.async {
                self.navigationItem.title = "Drinks Shown \(self.drink.drinkArray.count)"
                self.tableView.reloadData()
            }
        }
    }
    
    
    func saveData() {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let docUrl = dir.appendingPathComponent("myDrink").appendingPathExtension("json")
        
        let jsonEnc = JSONEncoder()
        let data = try? jsonEnc.encode(myDrink)
        do {
            try data?.write(to: docUrl, options: .noFileProtection)
        }catch {
            print("error saving json file")
        }
    }
    
    func loadData() {
        let dirUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let docURl = dirUrl.appendingPathComponent("myDrink").appendingPathExtension("json")
    
        guard let data = try? Data(contentsOf: docURl) else {
            return
        }
        let jsonDec = JSONDecoder()
        do {
            myDrink = try jsonDec.decode(Dictionary.self, from: data)
            tableView.reloadData()
        }catch {
            print("error loading json file")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let dest = segue.destination as! DetailVC
            let selected = tableView.indexPathForSelectedRow!
            dest.drink = drink.drinkArray[selected.row]
            dest.myDrink = myDrink
        }
    }

    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
        let source = segue.source as! DetailVC
        myDrink = source.myDrink
        // Save Data Here
        saveData()
        tableView.reloadData()
    }

}

//MARK:- Extension
extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drink.drinkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == drink.drinkArray.count-1 && drink.index < drink.alphabets.count {
            drink.getData {
                DispatchQueue.main.async {
                    self.navigationItem.title = "Drinks Shown \(self.drink.drinkArray.count)"
                    self.tableView.reloadData()
                }
            }
        }
        cell.textLabel?.text = drink.drinkArray[indexPath.row].strDrink
        let drinkName = drink.drinkArray[indexPath.row].strDrink
        if let drinkRatin = myDrink[drinkName] {
            cell.detailTextLabel?.text = drinkRatin
        }
        else {
            cell.detailTextLabel?.text = "-"
        }
        
        return cell
    }
    
    
}
