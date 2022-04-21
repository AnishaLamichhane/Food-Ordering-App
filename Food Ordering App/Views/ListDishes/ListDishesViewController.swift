//
//  ListDishesViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/14/22.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    var dishes : [Dish] = [
        .init(id: "id1", name: "Plantian", description: "This is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.", image: "https://picsum.photos/100/100", calories: 34.2822),
        .init(id: "id1", name: "Nope", description: "This is tmy special dish.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Nope", description: "This is tmy special dish.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Nope", description: "This is tmy special dish.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Nope", description: "This is tmy special dish.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Nope", description: "This is tmy special dish.", image: "https://picsum.photos/100/200", calories: 34.2822),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = category.categoryLabel
        
        registerCells()
    }
    
 private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}

extension ListDishesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setUp(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
