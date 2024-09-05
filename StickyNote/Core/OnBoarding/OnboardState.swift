//
//  Screens.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 01/09/2024.
//

import SwiftUI

struct OnboardState: View {
    
    var image: ImageResource
    var title: String
    var subtitle: String
    
    @Binding var currentView: Int
    @State var show = false
    
    var body: some View {
        
        VStack (alignment: .leading , spacing: 20){
            Spacer()
            Image(image).resizable()
                .scaledToFit()
                .frame(width: 300 , height: 300)
                .frame(maxWidth: .infinity)
                .scaleEffect(show ? 1 : 0)
            Spacer()
            
            Text(title)
                .font(.largeTitle)
                .scaleEffect(show ? 1 : 0 , anchor: .leading)
                .animation(.smooth.delay(0.4), value: show)
            
            Text(subtitle)
                .scaleEffect(show ? 1 : 0 , anchor: .leading)
                .animation(.smooth.delay(0.8), value: show)
            
            Spacer()
            Button(action: {
                withAnimation {
                    currentView += 1
                }
            }, label: {
                Text("Continue")
                    .foregroundStyle(.white).bold()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.bg , in: .rect(cornerRadius: 10))
            })
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            withAnimation {
                show = true
            }
        }
    }
}

#Preview {
    OnboardState(image: .on1,
            title: "Sticky Notes",
            subtitle: "You Can choose one of five different stickers in shape and color to suit your tasks", currentView: .constant(0))
}
