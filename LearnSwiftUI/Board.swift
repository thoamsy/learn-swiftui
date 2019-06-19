//
//  Board.swift
//  LearnSwiftUI
//
//  Created by yk on 6/17/19.
//  Copyright © 2019 yk. All rights reserved.
//

import SwiftUI


struct Board : View {
  let row = 3
  static let linesWhatCanWin = [
    (0, 1, 2),
    (3, 4, 5),
    (6, 7, 8),
    (0, 3, 6),
    (1, 4, 7),
    (2, 5, 8),
    (0, 4, 8),
    (2, 4, 6)
  ]
  @State var showAlert = false
  @State var isMe = true
  @State var steps = Array(repeatElement("circle", count: 3 * 3))
  
  func clearSteps() {
    steps = Array(repeatElement("circle", count: 3 * 3))
    isMe = false
    showAlert = false
  }
  
  var body: some View {
    return VStack {
      
      Button(action: clearSteps) {
        Text("Restart")
          .bold()
          .font(.title)
          .color(.primary)
      }
      
      ForEach(0..<row) { i in
        SquareRow(
          steps: self.$steps,
          isMe: self.$isMe,
          showAlert: self.$showAlert,
          offset: i * 3
        )
      }
      }.presentation($showAlert) {
        Alert(
          title: Text("游戏结束"),
          message: Text("\(self.isMe ? "Me" : "You") Win"),
          dismissButton: .default(
              Text("重新来过"),
              onTrigger: self.clearSteps
          )
        )
    }
  }
}

#if DEBUG
struct Board_Previews : PreviewProvider {
  static var previews: some View {
    Group {
//      Board().environment(\.colorScheme, .dark)
      Board().environment(\.colorScheme, .light)
    }
  }
}
#endif
