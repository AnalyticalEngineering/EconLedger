//
//  BudgetScreen.swift
//  EconLedger
//
//  Created by J. DeWeese on 11/28/23.
//

import SwiftUI

struct BudgetScreen: View {
    //MARK:  PROPERTIES
    @State private var isAddBudget = false
//MARK:  ADD BUTTON
    @ViewBuilder
    private func AddButton()-> some View {
        Button(action: {
            HapticManager.notification(type: .success)
            isAddBudget = true
            print("add budget")
        }, label: {
            ZStack{
                Circle()
                Image(systemName: "plus")
                    .foregroundStyle(.white)
            }
        })
        .font(.title3)
        .fontWeight(.bold)
        .frame(width: 30, height: 30)
        .padding([.vertical, .leading], 5)
    }
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(0..<5){ i in
                    Text("row \(i)")
                }
            }
            .navigationTitle("My Budgets")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    AddButton()
                }
            }
            .sheet(isPresented: $isAddBudget, content: {
                Text("Add Budget View")
            })
        }
    }
}
#Preview {
    BudgetScreen()
}
