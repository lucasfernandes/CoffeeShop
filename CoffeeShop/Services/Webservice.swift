//
//  Webservice.swift
//  CoffeeShop
//
//  Created by Lucas Silveira on 21/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import Foundation

class Webservice {
  
  var baseURL = "http://127.0.0.1:3000/api/v1"
  
  func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> Void) {
    var request = URLRequest(url: URL(string: "\(baseURL)/orders")!)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try? JSONEncoder().encode(order)
    
    URLSession.shared.dataTask(with: request) { data, resposne, error in
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      
      let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
      
      DispatchQueue.main.async {
        completion(createOrderResponse)
      }
      
    }.resume()
  }
  
  func getAllOrders(completion: @escaping ([Order]?) -> ()) {
    guard let url = URL(string: "\(baseURL)/orders") else {
      DispatchQueue.main.async {
        completion(nil)
      }
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      
      let orders = try? JSONDecoder().decode(Orders.self, from: data)
      DispatchQueue.main.async {
        completion(orders?.data)
      }
      
    }.resume()
  }
}
