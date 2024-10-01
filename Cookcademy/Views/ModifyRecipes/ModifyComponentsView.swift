//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Florian Ouilhon on 27/09/2024.
//

import SwiftUI

protocol RecipeComponent: CustomStringConvertible {
    init()
    static func singularName() -> String
    static func pluralName() -> String
}

extension RecipeComponent {
    static func singularName() -> String {
        String(describing: self).lowercased()
    }
    
    static func pluralName() -> String {
        singularName() + "s"
    }
}

protocol ModifyComponentView: View {
    associatedtype Component
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}

struct ModifyComponentsView<Component: RecipeComponent, DestinationView: ModifyComponentView>: View where DestinationView.Component == Component {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var components: [Component]
    @State private var newComponent = Component()
    
    var body: some View {
        VStack {
            let addComponentView = DestinationView(component: $newComponent) { component in
                components.append(component)
                newComponent = Component()
            }.navigationTitle("Add \(Component.singularName().capitalized)")
            if components.isEmpty {
                Spacer()
                NavigationLink("Add the first \(Component.singularName())", destination: addComponentView)
                Spacer()
            } else {
                HStack {
                    Text(Component.pluralName().capitalized)
                        .font(.title)
                        .padding()
                    Spacer()
                    EditButton()
                        .padding()
                }
                List {
                    ForEach(components.indices, id: \.self) { index in
                        let component = components[index]
                        // Text(component.description)
                        let editComponentView = DestinationView(component: $components[index]) { _ in
                            return
                        }
                        .navigationTitle("Edit" + "\(Component.singularName().capitalized)")
                        //.listRowBackground(listBackgroundColor)
                        NavigationLink(component.description, destination: editComponentView)
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(listBackgroundColor)
                    }
                    .onDelete { components.remove(atOffsets: $0) }
                    .onMove { indices, newOffset in
                        components.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }.foregroundStyle(listTextColor)
            }
        }
    }
}

#Preview {
    @Previewable @State var recipe = Recipe.testRecipes[1]
    @Previewable @State var emptyIngredients = [Ingredient]()
    NavigationView {
        ModifyComponentsView<Ingredient, ModifyIngredientView>(components: $recipe.ingredients)
    }
}
