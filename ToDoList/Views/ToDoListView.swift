//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
  @StateObject var viewModel: ToDoListViewViewModel
  @FirestoreQuery var items: [ToDoListItem]
  
  init(userId: String) {
    self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    
    self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
  }
  var body: some View {
    NavigationStack {
      VStack {
        List(items) { item in
          ToDoListItemView(item: item)
            .swipeActions {
              Button {
                viewModel.delete(id: item.id)
              } label: {
                Text("Delete")
              }
              .tint(.red)
            }
        }
      }
      .navigationTitle("To Do List")
      .toolbar {
        Button {
          viewModel.showingNewItemView = true
        } label: {
          Image(systemName: "plus")
        }
      }
      .sheet(isPresented: $viewModel.showingNewItemView, content: {
        NewItemView(newItemPresented: $viewModel.showingNewItemView)
      })
    }
  }
}

#Preview {
  ToDoListView(userId: "dv88TCUt2sV9KaBZQwNqBZIBmzK2")
}
