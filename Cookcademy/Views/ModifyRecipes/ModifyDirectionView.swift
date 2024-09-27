//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Florian Ouilhon on 27/09/2024.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView {
    @Binding var direction: Direction
    let createAction: (Direction) -> Void
    
    init(component: Binding<Direction>, createAction: @escaping (Direction) -> Void) {
        self._direction = component
        self.createAction = createAction
    }
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Environment(\.dismiss) private var mode
    
    var body: some View {
        Form {
            TextField("Direction Description", text: $direction.description)
                .listRowBackground(listBackgroundColor)
            Toggle("Optional", isOn: $direction.isOptional)
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save") {
                    createAction(direction)
                    mode.callAsFunction()
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        }
        .foregroundStyle(listTextColor)
    }
}

#Preview {
    @Previewable @State var direction : Direction = Direction()
    NavigationView {
        NavigationView {
            ModifyDirectionView(component: $direction, createAction: { _ in return })
        }
    }
}
