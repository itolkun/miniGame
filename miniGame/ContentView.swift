//
//  ContentView.swift
//  miniGame
//
//  Created by Айтолкун Анарбекова on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue = Double.random(in: 0...100)
    @State var currentValue = 0.0
    
    @State private var showAlert = false

    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер, как можно ближе к: \(lround(targetValue))")
            
            HStack {
                Text("0")
                SliderView(
                    currentValue: $currentValue,
                    thumbOpacity: computeScore
                )
                Text("100")
            }
            
            Button("Проверь меня!", action: {showAlert.toggle()} )
                .alert("Your Score", isPresented: $showAlert, actions: {}) {
                    Text("dd")
                }
            Button("Начать заново", action: randomNum)
            
        }
        .padding()
    }
    
    
    private func computeScore(v:Int) -> Double {
        let difference = abs(Int(targetValue) - lround(v))
        return Double(100 - difference)
    }
    
    private func randomNum() {
        currentValue = Double.random(in: 0...100)
        targetValue = Double.random(in: 0...100)
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
