//
//  MastermindGameTests.swift
//  MastermindGameTests
//
//

import Testing
@testable import MastermindGame

struct MastermindGameTests {

    @Test func digitTest() async throws {
        let viewModel: ContentViewModel = ContentViewModel()
        #expect(viewModel.alphabet.count > viewModel.getDigit())
        #expect(viewModel.getDigit() < viewModel.alphabet.count)
    }

    @Test func randomTest() async throws {
        let viewModel: ContentViewModel = ContentViewModel()
        #expect(viewModel.secret.count == 4)
        
        for letter in viewModel.secret {
            #expect(viewModel.alphabet.contains(letter))
        }
        
        viewModel.onCheck(letters: viewModel.secret)
        for color in viewModel.colors {
            #expect(color == viewModel.colorCorrect)
        }
    }
}
