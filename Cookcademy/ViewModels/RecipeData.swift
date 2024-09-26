//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Florian Ouilhon on 26/09/2024.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
