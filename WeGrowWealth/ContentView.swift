//
//  ContentView.swift
//  WeGrowWealth
//
//  Created by Zhanerke Ussen on 12/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var incomeAmount = 0.0
    
    @State private var selectedMortgageDownpaymentPercent = 0
    @State private var selectedEmergencySavingsPercent = 0
    @State private var selectedBigPurchasePercent = 0
    @State private var selectedGiftsPercent = 0
    @State private var selectedAdditionalWantsPercent = 0
    
    @State private var selectedRetirementInvestmentsPercent = 0
    @State private var selectedTaxedInvestmentsPercent = 0
    
    private var mortgageDownpaymentAmount: Double {
        return incomeAmount * Double(selectedMortgageDownpaymentPercent)/100
    }
    
    private var emergencySavingsAmount: Double {
        return incomeAmount * Double(selectedEmergencySavingsPercent)/100
    }
    
    private var bigPurchaseAmount: Double {
        return incomeAmount * Double(selectedBigPurchasePercent)/100
    }
    private var giftsAmount: Double {
        return incomeAmount * Double(selectedGiftsPercent)/100
    }
    
    private var additionalWantsAmount: Double {
        return incomeAmount * Double(selectedAdditionalWantsPercent)/100
    }
    
    private var retirementInvestmentsAmount: Double {
        return incomeAmount * Double(selectedRetirementInvestmentsPercent)/100
    }
    
    private var taxedInvestmentsAmount: Double {
        return incomeAmount * Double(selectedTaxedInvestmentsPercent)/100
    }
    
    private let mortgageSavingPercentages = [5, 10, 15, 20]
    private let giftsSavingPercentages = [3, 5]
    private let otherSavingPercentages = [3, 5, 8, 10, 12, 15]
    private let investmentPercentages = [5, 8, 10, 12, 15]
    
    
    private var leftToSpend: Double {
        return incomeAmount - (mortgageDownpaymentAmount + emergencySavingsAmount + bigPurchaseAmount + giftsAmount + additionalWantsAmount + retirementInvestmentsAmount + taxedInvestmentsAmount)
    }
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section("Income") {
                        TextField("Income", value: $incomeAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                    }
                    
                    Section {
                        Picker("Mortgage downpayment", selection: $selectedMortgageDownpaymentPercent) {
                            ForEach(mortgageSavingPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                        HStack {
                            Text("Mortgage downpayment:")
                            Spacer()
                            Text(mortgageDownpaymentAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                        
                        
                        Picker("Emergency savings", selection: $selectedEmergencySavingsPercent) {
                            ForEach(otherSavingPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                        HStack {
                            Text("Emergency savings: ")
                            Spacer()
                            Text(emergencySavingsAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                        
                        
                        Picker("Big purchase", selection: $selectedBigPurchasePercent) {
                            ForEach(otherSavingPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                        HStack {
                            Text("Big purchase")
                            Spacer()
                            Text(bigPurchaseAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                        
                        Picker("Gifts", selection: $selectedGiftsPercent) {
                            ForEach(giftsSavingPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                        HStack {
                            Text("Gifts")
                            Spacer()
                            Text(giftsAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                    } header: {
                        Text("Savings")
                    }
                    
                    Section {
                        Picker("Retirement investments", selection: $selectedRetirementInvestmentsPercent) {
                            ForEach(investmentPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                        HStack {
                            Text("Retirement investments")
                            Spacer()
                            Text(retirementInvestmentsAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                        
                        Picker("Taxed investments", selection: $selectedTaxedInvestmentsPercent) {
                            ForEach(investmentPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                        HStack {
                            Text("Investments amount:")
                            Spacer()
                            Text(taxedInvestmentsAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                    } header: {
                        Text("Investments")
                    }
                    
                    Section {
                        HStack {
                            Text("Amount:")
                            Spacer()
                            Text(leftToSpend, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                    } header: {
                        Text("Left to spend")
                        
                        
                    }
                }
                .navigationTitle("Grow wealth")
            }
        }
    }
    
   private var contentView: some View {
        Text("Placeholder")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
