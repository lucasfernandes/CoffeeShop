//
//  CoffeeOrderViewModel.swift
//  CoffeeShop
//
//  Created by Lucas Silveira on 29/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
  
  var name: String = ""
  @Published var size: String = "Medium"
  @Published var coffeeName: String = ""
  
  
  private var webservice: Webservice
  
  var coffeeList: [CoffeeViewModel] {
    return Coffee.all().map(CoffeeViewModel.init)
  }
  
  init() {
    self.webservice = Webservice()
  }
  
  var total: Double {
    return callcuateTotalPrice()
  }
  
  func placeOrder() {
    let order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
    self.webservice.createCoffeeOrder(order: order) { _ in
      
    }
  }
  
  private func priceForSize() -> Double {
    let pricess = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
    return pricess[self.size]!
  }
  
  private func callcuateTotalPrice() -> Double {
    let coffeeVM = coffeeList.first { $0.name == coffeeName }
    if let coffeVM = coffeeVM {
      return coffeeVM!.price * priceForSize()
    } else {
      return 0.0
    }
  }
}
