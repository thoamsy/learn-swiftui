//
//  SquareRow.swift
//  LearnSwiftUI
//
//  Created by yk on 6/17/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI

struct Square: View {
  @Binding var iconName: String
  @Binding var who: Bool
  
  var body: some View {
    let icon = Image(systemName: iconName).imageScale(.large).accentColor(.black)
    
    
    return Button(action: {
      withAnimation {
        self.iconName = self.who ? "star.fill" : "star"
        self.who.toggle()
      }
    }) {
      icon
      }.frame(
        width: 80,
        height: 80
      )
  }
}

struct SquareRow : View {
  @State var steps: Slice<[String]>
  @Binding var who: Bool
  var body: some View {
    HStack {
      Square(iconName: $steps[0], who: $who)
      Square(iconName: $steps[1], who: $who)
      Square(iconName: $steps[2], who: $who)
    }
  }
}

//#if DEBUG
//struct SquareRow_Previews : PreviewProvider {
//
//
//  static var previews: some View {
//    SquareRow)
//  }
//}
//#endif
