//
//  RingView.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 26/02/21.
//

import SwiftUI

struct RingView: View {
    
    var width: CGFloat = 88
    var height: CGFloat = 88
    var percent: CGFloat = 4.48
    @State var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let vote = percent * 20
        let progress = 1 - (percent/5)
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: multiplier * 5))
                .frame(width: width, height: height)
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0)
                        )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0.0, z: 0.0))
                .frame(width: width, height: height)
                .onAppear{
                    self.show = true
                }
                .onDisappear{
                    self.show = false
                }
            
            Text("\(Int(vote))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: false)
    }
}
