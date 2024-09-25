//
//  WelcomeView.swift
//  Code History
//
//  Created by Florian Ouilhon on 24/09/2024.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                GameColor.main.ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Select the correct answers to the following questions.")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                    Spacer()
                    NavigationLink(destination: GameView()) {
                        BottomTextView(str: "Okay let's go!")
                    }
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
