//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Florian Ouilhon on 27/09/2024.
//

import SwiftUI

struct ModifyIngredientView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    
    @Binding var ingredient: Ingredient
    let createAction: ((Ingredient) -> Void)
    
    @Environment(\.dismiss) private var mode
    
    var body: some View {
        VStack {
            Form {
                TextField("Ingredient Name", text: $ingredient.name)
                    .listRowBackground(listBackgroundColor)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack {
                        Text("Quantity")
                        TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }.listRowBackground(listBackgroundColor)
                Picker(selection: $ingredient.unit, label:
                        HStack {
                    Text("Unit")
                    Spacer()
                    // Text(ingredient.unit.rawValue)
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }.listRowBackground(listBackgroundColor)
                .pickerStyle(MenuPickerStyle())
                HStack {
                    Spacer()
                    Button("Save") {
                        createAction(ingredient)
                        mode.callAsFunction()
                    }
                    Spacer()
                }.listRowBackground(listBackgroundColor)
            }
            .foregroundStyle(listTextColor)
        }
    }
}

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

#Preview {
    @Previewable @State var ingredient = Ingredient()
    ModifyIngredientView(ingredient: $ingredient) { ingredient in
        print(ingredient)
    }
}
