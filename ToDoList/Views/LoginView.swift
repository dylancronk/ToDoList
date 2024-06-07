//
//  LoginView.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import SwiftUI

struct LoginView: View {
  @StateObject var viewModel = LoginViewViewModel()
  var body: some View {
    NavigationStack {
      VStack {
        // Header
        HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, backgroundColor: .pink)
        Spacer()
        // Login Form
        Form {
          if !viewModel.errorMessage.isEmpty {
            Text(viewModel.errorMessage).foregroundStyle(.red)
          }
          TextField("Email Address", text: $viewModel.email)
            .textInputAutocapitalization(.never)
          SecureField("Password", text: $viewModel.password)
          TDLButton(title: "Login", backgroundColor: .blue) {
            viewModel.login()
          }
          .padding()
        }
        Spacer()
        // Create Account
        VStack {
          Text("New around here?")
          NavigationLink("Create An Account", destination: RegisterView())
        }
        .padding(.bottom, 50)
      }
    }
  }
}

#Preview {
  LoginView()
}
