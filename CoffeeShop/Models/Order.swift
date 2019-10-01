//
//  Order.swift
//  CoffeeShop
//
//  Created by Lucas Silveira on 21/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import Foundation

struct Orders: Codable {
  let data: [Order]
}

struct Order: Codable {
  let name: String
  let coffeeName: String
  let total: Double
  let size: String
}
