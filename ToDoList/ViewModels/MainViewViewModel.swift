//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
  @Published var currentUserId = ""
  private var handler: AuthStateDidChangeListenerHandle?
  init() {
    self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
      DispatchQueue.main.async {
        self?.currentUserId = user?.uid ?? ""
      }
    }
  }
  public var isSignedIn: Bool {
    return Auth.auth().currentUser != nil
  }
}
