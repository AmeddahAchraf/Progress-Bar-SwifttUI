//
//  SwiftUIView.swift
//  
//
//  Created by BqNqNNN on 7/30/20.
//

import SwiftUI

public struct LinearProgress: View {
    var percentage: CGFloat
    var foregroundColor : LinearGradient
    var backgroundColor : Color
    
    public init(percentage: CGFloat, backgroundColor : Color, foregroundColor: LinearGradient) {
        self.percentage = percentage
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    public var body: some View {
        ZStack{
            GeometryReader { geometry in
                Rectangle().frame(width: min(geometry.size.width, geometry.size.width) , height: geometry.size.height)
                    .foregroundColor(backgroundColor)
                    .cornerRadius(geometry.size.width/7)
                    .opacity(0.5)
                    .shadow(radius: 1)
                
                
                foregroundColor
                    .mask(Rectangle()
                            .cornerRadius(geometry.size.width/7)
                            .animation(.linear, value: percentage))
                    .frame(width: min(geometry.size.width*percentage, geometry.size.width) , height: geometry.size.height)
            }
        }
    }
}
