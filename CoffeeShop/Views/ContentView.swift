//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Lucas Silveira on 21/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject private var orderListVM = OrderListViewModel()
  
  @State private var showModal: Bool = false
  
  var body: some View {
//    Text("Options")
//    .contextMenu {
//        Button(action: {
//            // change country setting
//        }) {
//            Text("Choose Country")
//            Image(systemName: "globe")
//        }
//
//        Button(action: {
//            // enable geolocation
//        }) {
//            Text("Detect Location")
//            Image(systemName: "location.circle")
//        }
//    }
    NavigationView {

      OrderListView(orders: self.orderListVM.orders)

        .navigationBarTitle("Coffee Orders")
        .navigationBarItems(leading: Button(action: reloadOrders) {
          Image(systemName: "arrow.clockwise")
            .foregroundColor(Color.white)
            .scaleEffect(0.8)
          }, trailing: Button(action: showAddCoffeeOrderView) {
            Image(systemName: "plus")
              .foregroundColor(Color.white)
        })

        .sheet(isPresented: $showModal) {
          AddCoffeeOrderView(isPresented: self.$showModal)
      }
    }
  }
  
  private func reloadOrders() {
    self.orderListVM.fetchOrders()
  }
  
  private func showAddCoffeeOrderView() {
    self.showModal = true
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
