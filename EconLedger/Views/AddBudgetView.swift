//
//  AddBudgetView.swift
//  EconLedger
//
//  Created by J. DeWeese on 11/28/23.
//

import SwiftUI

struct AddBudgetView: View {
    //MARK:  PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = AddBudgetViewModel( )
    @State private var selectedIcon: String = "figure.run.circle.fill"
    @State private var selectedColor: Color = .blue
    @State private var name  = ""
    @State var budgetAmount = ""
    
    
    //MARK:  CANCEL FUNCTION
    @ViewBuilder
    private func cancelButton()-> some View{
        Button {
            dismiss( )
        } label: {
            Text("Cancel")
                .font(.title3)
                .fontWeight(.bold)
                .tint(.red)
        }
    }
    //MARK:  SAVE FUNCTION
    @ViewBuilder
    private func saveButton()-> some View{
        Button(action: {
            dismiss()
        }, label: {
            Text("Save")
        })
        .font(.title3)
        .fontWeight(.bold)
        .tint(.green)
        .padding([.vertical, .leading], 5)
        .disabled(viewModel.isInvalidForm())
    }
    var body: some View {
        NavigationStack {
            
            VStack {
                Form{
                    Section("Budget Name") {
                        FloatingTextField(title: "Budget Name", text: $viewModel.name, axis: .vertical)
                            .textInputAutocapitalization(.sentences)
                            .autocorrectionDisabled()
                            .padding(.horizontal)
                    }
                    Section("Budget Icon & Color") {
                        IconPicker(selectedIcon: $selectedIcon, selectedColor: $viewModel.selectedColor)
                            .foregroundStyle(selectedColor)
                    }.tint(selectedColor)
                    Section("Budget Amount") {
                        FloatingTextField(title: "Enter Budget Amount ", text: $viewModel.budgetAmount, axis: .vertical)
                            .keyboardType(.decimalPad)
                            .padding(.horizontal)
                        
                    }
                    
                    
                }
            }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        cancelButton()
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        saveButton()
                    }
                    
                }
        }
       
    }
}

#Preview {
    AddBudgetView()
}
