//
//  OrderTotalView.swift
//  CoffeeShop
//
//  Created by Lucas Silveira on 29/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
  let total: Double
  
    var body: some View {
      HStack(alignment: .center) {
        Spacer()
        Text(String(format: "$%.2f", self.total))
          .font(.title)
          .foregroundColor(Color.green)
        Spacer()
      }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
      OrderTotalView(total: 45)
    }
}
