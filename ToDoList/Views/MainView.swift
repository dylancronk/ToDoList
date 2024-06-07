//
//  ContentView.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/2/24.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel = MainViewViewModel()
  var body: some View {
    VStack {
      if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
        TabView {
          ToDoListView(userId: viewModel.currentUserId).tabItem {
            Label("home", systemImage: "house")
          }
          
          ProfileView().tabItem {
            Label("Profile", systemImage: "person.circle")
          }
        }
        
      } else {
        LoginView()
      }
    }
  }
}

#Preview {
  MainView()
}
