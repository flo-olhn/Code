//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Florian Ouilhon on 25/09/2024.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
