//
//  OrderListViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/14/22.
//

import UIKit
import ProgressHUD

class OrderListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Orders] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerViews()
        
        ProgressHUD.show()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders {  (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self.orders = orders
                self.tableView.reloadData()
                
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerViews(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setUp(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
