//
//  ContentViewModel.swift
//  MastermindGame
//
//

import Foundation
import SwiftUI

class ContentViewModel : ObservableObject {
    
    @Published var colors: Array<Color> = Array()
    @Published var letter1: String = ""
    @Published var letter2: String = ""
    @Published var letter3: String = ""
    @Published var letter4: String = ""
    
    var secret: Array<String> = Array()
    let colorCorrect: Color = Color.green
    private let colorIncorrect: Color = Color.red
    private let colorIncorrectPlace: Color = Color.yellow
    
    let alphabet: Array<String> = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    init() {
        setup(length: Array(arrayLiteral: letter1, letter2, letter3, letter4).count)
    }
    
    func getDigit() -> Int {
        let retVal = Int.random(in: 0..<alphabet.count)
        return retVal
    }
    
    func setup(length: Int) {
        secret.removeAll()
        colors.removeAll()
        for _ in 0..<length {
            secret.append(alphabet[getDigit()])
            colors.append(Color.clear)
        }
        print("ContentViewModel, \(#function), line=\(#line), secret=\(secret)")
    }
    
    func onCheck(letters: Array<String>) {
        print("ContentViewModel, \(#function), line=\(#line), secret=\(secret)")
        for index in letters.indices {
            let letter = letters[index]
            if(secret[index] == letter) {
                colors[index] = colorCorrect
            } else if(secret.contains(letter)) {
                colors[index] = colorIncorrectPlace
            } else {
                colors[index] = colorIncorrect
            }
        }
    }
}
