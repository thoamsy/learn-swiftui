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
  let isEnd: Bool
  let getWinner: () -> Void
  
  var body: some View {
    let icon = Image(systemName: iconName).imageScale(.large).accentColor(.primary)
    
    return Button(action: {
      withAnimation {
        self.iconName = self.isMe
          ? "circle.fill"
          : "xmark.circle.fill"
        self.isMe.toggle()
        self.getWinner()
      }
    }) {
      icon
      }.frame(
        width: 80,
        height: 80
      ).disabled(self.iconName != "circle" || isEnd)
  }
}

struct SquareRow : View {
  @Binding var steps: [String]
  @Binding var isMe: Bool
  @Binding var showAlert: Bool
  let offset: Int
  
  // NOTE: 在这里的对 showAlert 的改动并不会同步给父组件
  // 这可能是 SwiftUI 在 action 中做了特殊的双向绑定，但是普通函数里没有
  func calculateWinner() {
    if (showAlert) { return }
    for line in Board.linesWhatCanWin {
      let (a, b, c) = line
      if (steps[a] != "circle" && steps[a] == steps[b] && steps[b] == steps[c]) {
        self.showAlert.toggle()
        return
      }
    }
  }
  
  
  var body: some View {
    return HStack {
      ForEach(0..<3) {
        Square(
          iconName: self.$steps[self.offset + $0],
          isMe: self.$isMe,
          isEnd: self.showAlert,
          getWinner: self.calculateWinner
        )
      }
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
