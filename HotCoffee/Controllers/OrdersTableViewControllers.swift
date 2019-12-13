//
//  OrdersTableViewControllers.swift
//  HotCoffee
//
//  Created by call soft on 14/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation
import UIKit

class OrdersTableViewControllers : UITableViewController{
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders(){
       guard let coffeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
        
            fatalError("Url are incorrect")
            return
        }
        
        let resource = Resource<[Order]>(url: coffeOrdersURL)
        
        WebServices().Load(resource: resource) {  result in
          
            switch result{
            case .success(let orders):
                print(orders)
                self.orderListViewModel.orderviewModel = orders.map(OrderViewModel.init)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.orderviewModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        cell.textLabel?.text! = vm.type
        cell.detailTextLabel?.text! = vm.size
        return cell
        
    }
}
