import SwiftUI

public struct CircularProgress: View {
    var percentage: CGFloat
    var fontSize : CGFloat
    var backgroundColor : Color
    var fontColor : Color
    var borderColor1 : Color
    var borderColor2 : LinearGradient
    
    public init(percentage: CGFloat, fontSize: CGFloat, backgroundColor : Color, fontColor: Color, borderColor1: Color, borderColor2: LinearGradient) {
        self.percentage = percentage
        self.fontSize = fontSize
        self.backgroundColor = backgroundColor
        self.fontColor = fontColor
        self.borderColor1 = borderColor1
        self.borderColor2 = borderColor2
    }

    public var body: some View {
        return (Circle()
                    .foregroundColor(backgroundColor)
                    .modifier(PercentageIndicator(percentage: self.percentage, fontSize: fontSize, fontColor: fontColor, borderColor1: borderColor1, borderColor2: borderColor2)))
        
    }
}


public struct PercentageIndicator: AnimatableModifier {
    var percentage: CGFloat
    let fontSize : CGFloat
    let fontColor : Color
    let borderColor1 : Color
    let borderColor2 : LinearGradient
    
    public var animatableData: CGFloat {
        get { percentage }
        set { percentage = newValue }
    }
    
    public func body(content: Content) -> some View {
        content
            .overlay(CircularProgressView(percentage: percentage, fontSize: fontSize, fontColor: fontColor, borderColor1: borderColor1, borderColor2: borderColor2))
    }
    
    public struct CircularProgressView: View {
        let percentage: CGFloat
        let fontSize : CGFloat
        let fontColor : Color
        let borderColor1 : Color
        let borderColor2 : LinearGradient
        
        public var body: some View {
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(borderColor1)
                    .padding(.all, 20)
                
                borderColor2
                    .mask(Circle()
                            .trim(from: 0.0, to: self.percentage)
                            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270.0))
                            .padding(.all, 20)
                    )
                    
                Text("\(Int(percentage * 100)) %")
                    .foregroundColor(fontColor)
                    .font(.system(size: fontSize))
                    .fontWeight(.bold)
                    .scaleEffect((percentage/2)+1)
            }
        }
    }
}
