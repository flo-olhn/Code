//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Florian Ouilhon on 26/09/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                            .foregroundStyle(listTextColor)
                    }
                }.listRowBackground(listBackgroundColor)
                Section(header: Text("Directions")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1). ").bold()
                            Text("\(direction.isOptional ? "(Optional)" : "")" + "\(direction.description)")
                        }.foregroundStyle(listTextColor)
                    }
                }.listRowBackground(listBackgroundColor)
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

#Preview {
    @Previewable @State var recipe = Recipe.testRecipes[0]
    NavigationView {
        RecipeDetailView(recipe: recipe)
    }
}
