//
//  SiriWaveView.swift
//  SwiftUI-SiriWaveView
//
//  Created by Noah Chalifour on 2019-09-14.
//  Copyright © 2019 Noah Chalifour. All rights reserved.
//

import SwiftUI

public struct SiriWaveView: View {
        
    let colors: [Color] = [
        Color(red: (173 / 255), green: (57 / 255), blue: (76 / 255)),
        Color(red: (48 / 255), green: (220 / 255), blue: (155 / 255)),
        Color(red: (25 / 255), green: (122 / 255), blue: (255 / 255))
    ]
    let supportLineColor: Color = .white

    @Binding var power: Double
    
    public init(power: Binding<Double>) {
        self._power = power
    }
    
    public var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                SupportLine(color: self.supportLineColor)
                ForEach(0..<self.colors.count, id: \.self) { i in
                    WaveView(power: $power, color: self.colors[i])
                        .animation(.linear(duration: 0.3))
                }                
            }
            .blendMode(.lighten)
            .drawingGroup()
        }
    }
    
}

struct SiriWaveView_Previews: PreviewProvider {
    
    @State static var power = 1.0
    
    static var previews: some View {
        SiriWaveView(power: $power)
    }
}
