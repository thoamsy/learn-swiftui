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
  @Binding var isMe: Bool
  
  var body: some View {
    let icon = Image(systemName: iconName).imageScale(.large).accentColor(.black)
    
    return Button(action: {
      withAnimation {
        self.iconName = self.isMe
          ? "circle.fill"
          : "xmark.circle.fill"
        self.isMe.toggle()
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
  @Binding var isMe: Bool
  var body: some View {
    HStack {
      Square(iconName: $steps[0], isMe: $isMe)
      Square(iconName: $steps[1], isMe: $isMe)
      Square(iconName: $steps[2], isMe: $isMe)
    }
  }
}

//#if DEBUG
//struct SquareRow_Previews : PreviewProvider {
//
//
//  static var previews: some View {
//    SquareRow(steps: .constant(["circle", "circle", "circle"]), who: .constant(false))
//  }
//}
//#endif
