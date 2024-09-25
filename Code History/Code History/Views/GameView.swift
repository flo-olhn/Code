//
//  ContentView.swift
//  Code History
//
//  Created by Florian Ouilhon on 24/09/2024.
//

import SwiftUI
import CoreData

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    
    let question = Question(
        questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Bettle", "Moth", "Fly"], correctAnswerIndex: 2)
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                QuestionView(question: viewModel.currentQuestion)
            }
        }
        .background(
            NavigationLink(destination: ScoreView(viewModel: ScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)), isActive: .constant(viewModel.gameIsOver), label: { EmptyView() })
        )
        .foregroundStyle(.white)
        .toolbar(.hidden)
        .environmentObject(viewModel)
    }
}

#Preview {
    GameView()
}
