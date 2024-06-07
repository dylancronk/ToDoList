//
//  User.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import Foundation

struct User: Codable {
  let id: String
  let name: String
  let email: String
  let joined: TimeInterval
}
