//
//  OnboardView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 01/09/2024.
//

import SwiftUI

struct OnboardView: View {
    
    @State var currentView = 0
    
    var body: some View {
        ZStack {
            
            if currentView <= 2 {
                BGGradient()
                    .transition(.opacity)
            }
            
            
            switch currentView {
            case 0:
                OnboardState(image: .on1,
                        title: "Sticky Notes",
                        subtitle: "You Can choose one of five different stickers in shape and color to suit your tasks",
                        currentView: $currentView)
            case 1:
                OnboardState(image: .on2,
                        title: "Dragin Board",
                        subtitle: "You Can drag a memo to any location inside the the whiteboard",
                        currentView: $currentView)
            case 2:
                OnboardState(image: .on3,
                        title: "Tracking",
                        subtitle: "Track the progress of the tasks and the remaining tasks and the completed tasks",
                        currentView: $currentView )
            default:
                HomeView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                
            }
        }
        
    }
}

#Preview {
    OnboardView()
}
