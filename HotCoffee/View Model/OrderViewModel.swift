//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by call soft on 15/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation

class OrderListViewModel
{
    var orderviewModel:[OrderViewModel]
    init() {
        self.orderviewModel = [OrderViewModel]()
    }
}


extension OrderListViewModel{
    
    func orderViewModel(at index: Int) -> OrderViewModel{
        return self.orderviewModel[index]
    }
    
}


struct OrderViewModel {
    let order: Order
}

extension OrderViewModel{
    
    var name: String{
        return self.order.name
    }
    
    var email: String{
        return self.order.email
    }
    
    var type: String{
        return self.order.type.capitalized
    }
    
    var size: String{
        return self.order.size.capitalized
    }
    
}
