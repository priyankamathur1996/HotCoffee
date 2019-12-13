//
//  Order.swift
//  HotCoffee
//
//  Created by call soft on 15/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation

enum CoffeeType: String,Codable{
    
    case cappuccino
    case latte
    case espressino
    case cortado
    
}

enum CoffeSize: String ,Codable{
    
    case samll
    case medium
    case large
    
}

struct Order: Codable {
    
    let name :String
    let email: String
    let type: String
    let size: String
    
}

