//
//  OrderListView.swift
//  CoffeeShop
//
//  Created by Lucas Silveira on 21/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import SwiftUI

struct OrderListView: View {
  
  let orders: [OrderViewModel]
  
  init(orders: [OrderViewModel]) {
    UITableView.appearance().tableFooterView = UIView()
    self.orders = orders
  }
  
  var body: some View {

    List {
      ForEach(self.orders, id:\.id) { order in
        HStack {
          Image(order.coffeeName)
          .resizable()
          .frame(width: 100, height: 100)
          .cornerRadius(16)
          
          VStack {
            Text(order.name)
              .font(.title)
              .padding([.leading, .bottom], 10)
            
            HStack {
              Text(order.coffeeName)
              .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(10)
              
              Text(order.size)
              .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
          }
        }
      }
    }
  }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
      OrderListView(orders: [OrderViewModel(order: Order(name: "Mary", coffeeName: "Cappuccino", total: 3, size: "Medium"))])
    }
}
