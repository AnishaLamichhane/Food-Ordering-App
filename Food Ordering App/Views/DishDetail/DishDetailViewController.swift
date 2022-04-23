//
//  DishDetailViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/13/22.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name!")
            return
        }
        ProgressHUD.show("Placing Order ...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
                
            case .success(_):
                ProgressHUD.showSuccess("Your order has been placed.👩‍🍳")
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
}
