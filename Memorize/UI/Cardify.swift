//
//  Cardify.swift
//  Memorize
//
//  Created by Valeriy Kovalevskiy on 6/8/20.
//  Copyright © 2020 Valeriy Kovalevskiy. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    //MARK: - Computed properties
    var rotation: Double
    
    var isFaceUp: Bool {
        rotation < halfPiDegrees
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? zeroDegrees : piDegrees
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
                    .foregroundColor(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill()
            .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    
    //Drawing constants
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
    private let halfPiDegrees: Double = 90
    private let piDegrees: Double = 180
    private let zeroDegrees: Double = 0
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
