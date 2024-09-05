//
//  AppTabBar.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 03/09/2024.
//

import SwiftUI

struct AppTabBar: View {
    
    @Binding var selectedTab: TabBarViews
    @Environment(\.colorScheme) var isDark
    @Binding var isPresenting: Bool
    
    var body: some View {
        
        HStack (spacing: 45){
            Button(action: {
                selectedTab = .home
            }, label: {
                Image(systemName: "house")
                    .foregroundStyle(selectedTab == .home ? (Color.primary) : (Color.gray))
            })
            
            Button(action: {
                selectedTab = .list
            }, label: {
                Image(systemName: "list.bullet.rectangle.portrait")
                    .foregroundStyle(selectedTab == .list ? (Color.primary) : (Color.gray))
            })
            
            Spacer()
            
            Button(action: {
                selectedTab = .notification
            }, label: {
                Image(systemName: "bell")
                    .foregroundStyle(selectedTab == .notification ? (Color.primary) : (Color.gray))
            })
            
            Button(action: {
                selectedTab = .search
            }, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(selectedTab == .search ? (Color.primary) : (Color.gray))
            })
            
        }
        .font(.title2)
        .padding(.horizontal)
        .overlay{
            
            Button(action: {
                selectedTab = .add
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation {
                        isPresenting = true
                        
                    }
                }
            }, label: {
                Image(systemName: "plus")
                    .padding(20)
                    .background(isDark == .dark ? .white : .black , in: Circle())
                    .foregroundStyle(isDark == .dark ? .black : .white)
            })
            .offset(y:-30)
            .font(.title2)
            .bold()
            
        }
        
    }
}

#Preview {
    AppTabBar(selectedTab: .constant(.home), isPresenting: .constant(false))
}
