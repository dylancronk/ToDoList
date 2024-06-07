//
//  ProfileView.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewModel = ProfileViewViewModel()
  var body: some View {
    NavigationStack {
      VStack {
        if let user = viewModel.user {
          Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)
            .padding()
          
          VStack(alignment: .leading) {
            HStack {
              Text("Name:")
                .bold()
              Text(user.name)
            }
            HStack {
              Text("Email:")
                .bold()
              Text(user.email)
            }
            HStack {
              Text("Member since:")
                .bold()
              Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
          }
          .padding()
          Button("Log out") {
            viewModel.logout()
          }
          .tint(.red)
          .padding()
          Spacer()
        } else {
          Text("Loading profile...")
        }
      }.navigationTitle("Profile")
    }
    .onAppear {
      viewModel.fetchUser()
    }
  }
}

#Preview {
  ProfileView()
}
