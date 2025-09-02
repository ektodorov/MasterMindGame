//
//  ContentView.swift
//  MastermindGame
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: ContentViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: ContentViewModel())
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("A", text: $viewModel.letter1)
                    .frame(minHeight: 44.0)
                    .multilineTextAlignment(TextAlignment.center)
                    .background(RoundedRectangle(cornerRadius: 4).fill(viewModel.colors[0]))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 1)
                    )
                TextField("B", text: $viewModel.letter2)
                    .frame(minHeight: 44.0)
                    .multilineTextAlignment(TextAlignment.center)
                    .background(RoundedRectangle(cornerRadius: 4).fill(viewModel.colors[1]))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 1)
                    )
                TextField("C", text: $viewModel.letter3)
                    .frame(minHeight: 44.0)
                    .multilineTextAlignment(TextAlignment.center)
                    .background(RoundedRectangle(cornerRadius: 4).fill(viewModel.colors[2]))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 1)
                    )
                TextField("D", text: $viewModel.letter4)
                    .frame(minHeight: 44.0)
                    .multilineTextAlignment(TextAlignment.center)
                    .background(RoundedRectangle(cornerRadius: 4).fill(viewModel.colors[3]))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 1)
                    )
            }
            .frame(height: 60.0)
            .padding()
            
            Button() {
                let array: Array<String> = Array(arrayLiteral: viewModel.letter1, viewModel.letter2, viewModel.letter3, viewModel.letter4)
                viewModel.onCheck(letters: array)
            } label: {
                Text("Check")//or if we prefer String(localized: "Check")
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: CGFloat.infinity, minHeight: 44.0)
            .background(
                RoundedRectangle(
                    cornerRadius: 4,
                    style: RoundedCornerStyle.continuous
                )
                .stroke(Color.blue, lineWidth: 1)
            )
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
