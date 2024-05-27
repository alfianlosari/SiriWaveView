//
//  SiriWaveView.swift
//  SwiftUI-SiriWaveView
//
//  Created by Noah Chalifour on 2019-09-14.
//  Copyright © 2019 Noah Chalifour. All rights reserved.
//

import SwiftUI

public struct SiriWaveView: View {
    
    @State var siriWave: SiriWave
    
    let colors: [Color] = [
        Color(red: (173 / 255), green: (57 / 255), blue: (76 / 255)),
        Color(red: (48 / 255), green: (220 / 255), blue: (155 / 255)),
        Color(red: (25 / 255), green: (122 / 255), blue: (255 / 255))
    ]
    let supportLineColor: Color = .white
    
    @Binding var power: Double
    
    public init(power: Binding<Double>) {
        self._power = power
        self.siriWave = SiriWave(numWaves: colors.count, power: power.wrappedValue)
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                SupportLine(color: self.supportLineColor)
                ForEach(0..<self.colors.count, id: \.self) { i in
                    WaveView(wave: self.siriWave.waves[i], color: self.colors[i])
//                        .animation(.spring())
                        .animation(.linear(duration: 0.3))
//                        .shadow(color: self.colors[i], radius: 2, x: 0, y: 0)
                }
            }
            .blendMode(.lighten)
            .drawingGroup()
        }
        .onChange(of: self.power) {
            siriWave.updateWaves(numWaves: colors.count, power: $1)
        }
        .onAppear {
            
        }
    }
}

struct SiriWaveView_Previews: PreviewProvider {
    static var previews: some View {
        SiriWaveView(power: .constant(1))
    }
}
