//
//  DishDetailViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/13/22.
//

import UIKit

class DishDetailViewController: UIViewController {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
    }
}
