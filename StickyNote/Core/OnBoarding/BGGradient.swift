//
//  BGGradient.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 01/09/2024.
//

import SwiftUI

struct BGGradient: View {
    
    @State var shapeOne = Color.topl
    @State var shapeTwo = Color.topr
    @State var shapeThree = Color.bottoml
    @State var shapeFour = Color.bottomr
    
    let colors: [Color] = [.topl , .topr , .bottoml , .bottomr]
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack {
                ZStack {
                    Image(.shape1).resizable()
                        .renderingMode(.template )
                        .frame(width: 500, height: 500)
                        .offset(x: -80 , y: -200)
                        .foregroundStyle(shapeOne)
                    
                    Image(.shape2).resizable()
                        .renderingMode(.template )
                        .frame(width: 550, height: 550)
                        .offset(x: 180 , y: -300)
                        .foregroundStyle(shapeTwo)
                    
                    
                    Image(.shape3).resizable()
                        .renderingMode(.template )
                        .frame(width: 600, height: 600)
                        .offset(x: 100 , y: 230)
                        .foregroundStyle(shapeThree)
                    
                    
                    Image(.shape4).resizable()
                        .renderingMode(.template )
                        .frame(width: 600, height: 450)
                        .offset(x: -150 , y: 230)
                        .foregroundStyle(shapeFour)
                }
                .blur(radius: 100)
                MishView(size: 1, opacity: 0.1).ignoresSafeArea()
                
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            withAnimation(.easeInOut(duration: 4)) {
                                let shuffledColors = colors.shuffled()
                                shapeOne = shuffledColors[0]
                                shapeTwo = shuffledColors[1]
                                shapeThree = shuffledColors[2]
                                shapeFour = shuffledColors[3]
                            }
                        }
                        
                    }
                
            }
            .frame(width: proxy.size.width , height: proxy.size.height)
        }
        
    }
}

#Preview {
    BGGradient()
}


struct MishView: View {
    
    let size: CGFloat
    let opacity: Double
    
    var body: some View {
        Canvas{context, size in
            for _ in 0...(Int(size.width * size.height) / 1) {
                
                let x = CGFloat.random(in: 0...size.width)
                let y = CGFloat.random(in: 0...size.height)
                context.fill(Path(ellipseIn: CGRect(x: x, y: y, width: self.size, height: self.size)), with: .color(Color.white.opacity(opacity)))
            }
        }
        .blendMode(.overlay)
    }
}
