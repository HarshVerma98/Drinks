//
//  DetailVC.swift
//  Drinks
//
//  Created by Harsh Verma on 04/05/21.
//

import UIKit

class DetailVC: UIViewController {
    
    //MARK:- IBOutlet References
    @IBOutlet weak var recipeTxtView: UITextView!
    @IBOutlet weak var ingredientTxtView: UITextView!
    @IBOutlet weak var glassLabel: UILabel!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingTxtField: UITextField!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    
    //MARK:- Variables
    var drink: Drink!
    
    //MARK:- View Entry point
    override func viewDidLoad() {
        super.viewDidLoad()
        if drink == nil {
            drink = Drink()
        }
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- User Defined Functions
    func updateUI() {
        drinkLabel.text = drink.strDrink
    }
    
    //MARK:- Button Actions
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        let present = presentingViewController is UINavigationController
        if present {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController?.popViewController(animated: true)
        }
    }
}
