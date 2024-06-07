//
//  RegisterView.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
      VStack {
        HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, backgroundColor: .orange)
        Spacer()
        Form {
          TextField("Name", text: $viewModel.name)
            .autocorrectionDisabled()
          TextField("Email Address", text: $viewModel.email)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
          SecureField("Password", text: $viewModel.password)
          TDLButton(title: "Create Account", backgroundColor: .green) {
            viewModel.register()
          }
          .padding()
        }
      }
      .offset(y: -40)
      .padding(.bottom, 60)
    }
}

#Preview {
  RegisterView()
}
