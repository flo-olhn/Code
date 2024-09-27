//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Florian Ouilhon on 27/09/2024.
//

import SwiftUI

struct ModifyIngredientsView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient()
    
    var body: some View {
        VStack {
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                    ingredients.append(ingredient)
                    newIngredient = Ingredient()
                })
                Spacer()
            } else {
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }.listRowBackground(listBackgroundColor)
                    NavigationLink("Add another ingredient", destination: ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                        ingredients.append(ingredient)
                        newIngredient = Ingredient()
                    })
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(listBackgroundColor)
                }.foregroundStyle(listTextColor)
            }
        }
    }
}

#Preview {
    @Previewable @State var ingredients = [Ingredient]()
    NavigationView {
        ModifyIngredientsView(ingredients: $ingredients)
    }
}
