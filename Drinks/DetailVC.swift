//
//  DetailVC.swift
//  Drinks
//
//  Created by Harsh Verma on 04/05/21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var recipeTxtView: UITextView!
    @IBOutlet weak var ingredientTxtView: UITextView!
    @IBOutlet weak var glassLabel: UILabel!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingTxtField: UITextField!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
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
