//
//  AddBudgetViewModel.swift
//  EconLedger
//
//  Created by J. DeWeese on 11/28/23.
//

import SwiftUI
import Foundation


final class AddBudgetViewModel: ObservableObject {
    @Published  var selectedIcon: String = "figure.run.circle.fill"
    @Published var selectedColor: Color = .blue
    @Published var name  = ""
    @Published var budgetAmount = ""
    
    
    
    
    
    
    func isInvalidForm() -> Bool {
        name.isEmpty || budgetAmount.isEmpty
    }
}

