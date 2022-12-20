//
//  SliderView.swift
//  miniGame
//
//  Created by Айтолкун Анарбекова on 20/12/22.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var currentValue: Double
    var thumbOpacity : (Int) -> Double
    
    func makeUIView(context: Context) -> UISlider {

        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(
            Color(
                red: 1,
                green: 0,
                blue: 0,
                opacity: thumbOpacity(Int(currentValue))
            )
        )
        slider.value = Float(Int.random(in: 0...100))
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueDidChange), for: .valueChanged
        )
        return slider
    }
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(
            Color(
                red: 1,
                green: 0,
                blue: 0,
                opacity: thumbOpacity(Int(currentValue))
            )
        )
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValueDidChange(_ sender: UISlider) {
            _ = sender.value
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(10), thumbOpacity: {_ in 0.2})
    }
}
