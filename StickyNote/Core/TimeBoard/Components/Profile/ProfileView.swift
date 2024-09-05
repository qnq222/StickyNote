//
//  ProfileView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 01/09/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        HStack {
            
            Image(systemName: "rectangle.grid.2x2")
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(lineWidth: 1)
                }
            
            Spacer()
            Text("TimerBoard")
                .font(.custom("DeliciousHandrawn-Regular", size: 30))
            Spacer()
            
            Image(.user)
                .resizable()
                .scaledToFill()
                .frame(width: 45 , height: 45)
                .clipShape(.circle)
            
        }
        
    }
}

#Preview {
    ProfileView()
}
