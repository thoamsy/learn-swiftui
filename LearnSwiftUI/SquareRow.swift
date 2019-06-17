//
//  SquareRow.swift
//  LearnSwiftUI
//
//  Created by yk on 6/17/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI

struct Square: View {
  var label: String
  @State var isClicked = false
  
  var body: some View {
    let icon = Image(systemName: isClicked ? "star.fill" : "star").imageScale(.large)
    
    return Button(action: {
      withAnimation { self.isClicked.toggle() }
    }) {
      icon
      }.frame(
        width: 80,
        height: 80
      )
  }
}

struct SquareRow : View {
  let label = "X"
  var body: some View {
    HStack {
      Square(label: label)
      Square(label: label)
      Square(label: label)
    }
  }
}

#if DEBUG
struct SquareRow_Previews : PreviewProvider {
  static var previews: some View {
    SquareRow()
  }
}
#endif
