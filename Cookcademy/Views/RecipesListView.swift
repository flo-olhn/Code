//
//  ContentView.swift
//  Cookcademy
//
//  Created by Florian Ouilhon on 26/09/2024.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundStyle(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

#Preview {
    NavigationView {
        RecipesListView(category: .dessert)
            .environmentObject(RecipeData())
    }
}
