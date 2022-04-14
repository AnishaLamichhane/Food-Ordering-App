//
//  OrderListViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/14/22.
//

import UIKit

class OrderListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Orders] = [
        .init(id: "id1", name: "Anisha", dish: .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822)),
        .init(id: "id1", name: "Anisha", dish: .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822)),
        .init(id: "id1", name: "Anisha", dish: .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822)),
        .init(id: "id1", name: "Anisha", dish: .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822)),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerViews()
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
