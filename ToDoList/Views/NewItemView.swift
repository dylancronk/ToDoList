//
//  NewItemView.swift
//  ToDoList
//
//  Created by Dylan Cronk on 6/3/24.
//

import SwiftUI

struct NewItemView: View {
  @StateObject var viewModel = NewItemViewViewModel()
  @Binding var newItemPresented: Bool
  var body: some View {
    VStack {
      Text("New Item")
        .font(.system(size: 32))
        .bold()
      
      Form {
        TextField("Title", text: $viewModel.title)
        DatePicker("Due Date", selection: $viewModel.dueDate)
          .datePickerStyle(.graphical)
        TDLButton(title: "Save", backgroundColor: .pink) {
          if viewModel.canSave {
            viewModel.save()
            newItemPresented = false
          } else {
            viewModel.showAlert = true
          }
        }
        .padding()
      }
      .alert(isPresented: $viewModel.showAlert) {
        Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
      }
    }
  }
}

#Preview {
  NewItemView(newItemPresented: Binding.constant(false))
}
