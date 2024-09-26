//
//  ContentView.swift
//  Cookcademy
//
//  Created by Florian Ouilhon on 26/09/2024.
//

import SwiftUI

struct RecipesListView: View {
    let myIngredient = Ingredient(name: "Banana", quantity: 1.0, unit: .none)
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Show Ingredient") {
                print(myIngredient.description)
            }
        }
        .padding()
    }
}

#Preview {
    RecipesListView()
}
