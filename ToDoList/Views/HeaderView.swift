//
//  HeaderView.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import SwiftUI

struct HeaderView: View {
  let title: String
  let subtitle: String
  let angle: Double
  let backgroundColor: Color
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 0)
        .foregroundStyle(backgroundColor)
        .rotationEffect(.degrees(angle))
      VStack {
        Text(title)
          .foregroundStyle(.white)
          .font(.system(size: 50))
          .bold()
        Text(subtitle)
          .foregroundStyle(.white)
          .font(.system(size: 30))
      }
      .padding(.top, 30)
    }
    .frame(width: UIScreen.main.bounds.width * 3, height: 350)
    .offset(y: -100)
  }
}

#Preview {
  HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, backgroundColor: .blue)
}
