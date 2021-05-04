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
        alcoholLabel.text = "Yes"
        if drink.strAlcoholic != "Alcoholic" {
            alcoholLabel.text = "No"
        }
        glassLabel.text = drink.strGlass
        recipeTxtView.text = drink.strInstructions
        createIngredients()
        guard let url = URL(string: drink.strDrinkThumb ?? "") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            self.imageView.image = UIImage(data: data)
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func createIngredients() {
        ingredientTxtView.text = ""
        addIngredient(measure: drink.strMeasure1, ingredient: drink.strIngredient1)
        addIngredient(measure: drink.strMeasure2, ingredient: drink.strIngredient2)
        addIngredient(measure: drink.strMeasure3, ingredient: drink.strIngredient3)
        addIngredient(measure: drink.strMeasure4, ingredient: drink.strIngredient4)
        addIngredient(measure: drink.strMeasure5, ingredient: drink.strIngredient5)
        addIngredient(measure: drink.strMeasure6, ingredient: drink.strIngredient6)
        addIngredient(measure: drink.strMeasure7, ingredient: drink.strIngredient7)
        addIngredient(measure: drink.strMeasure8, ingredient: drink.strIngredient8)
        addIngredient(measure: drink.strMeasure9, ingredient: drink.strIngredient9)
        addIngredient(measure: drink.strMeasure10, ingredient: drink.strIngredient10)
        addIngredient(measure: drink.strMeasure11, ingredient: drink.strIngredient11)
        addIngredient(measure: drink.strMeasure12, ingredient: drink.strIngredient12)
        addIngredient(measure: drink.strMeasure13, ingredient: drink.strIngredient13)
        addIngredient(measure: drink.strMeasure14, ingredient: drink.strIngredient14)
        addIngredient(measure: drink.strMeasure15, ingredient: drink.strIngredient15)
    }
    
    
    func addIngredient(measure: String?, ingredient: String?) {
        guard measure != nil else {
            return
        }
        ingredientTxtView.text += measure!
        guard ingredient != nil else {
            return
        }
        ingredientTxtView.text += " \(ingredient)\n"
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
