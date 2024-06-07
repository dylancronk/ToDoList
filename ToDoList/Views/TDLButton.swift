//
//  TDLButton.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import SwiftUI

struct TDLButton: View {
  let title: String
  let backgroundColor: Color
  let action: () -> Void
  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .foregroundStyle(backgroundColor)
        Text(title)
          .foregroundStyle(.white)
      }
    }
  }
}

#Preview {
  TDLButton(title: "Title", backgroundColor: .pink) {
    
  }
}
