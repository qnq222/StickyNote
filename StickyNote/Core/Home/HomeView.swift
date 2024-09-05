//
//  HomeView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 01/09/2024.
//

import SwiftUI

enum TabBarViews{
    case home , list , add , notification , search
}

struct HomeView: View {
    
    @State var selectedTab: TabBarViews = .home
    @State var isPresenting = false
    @State var viewModel = NoteViewModel()
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                TimeBoardView(viewModel: viewModel)
            case .list , .add:
                BorderView(viewModel: viewModel, isPresenting: $isPresenting)
            case .notification:
                Text("Notifications")
            case .search:
                Text("search")
            }
            
            AppTabBar(selectedTab: $selectedTab, isPresenting: $isPresenting)
                .frame(maxHeight: .infinity , alignment: .bottom)
        }
        
    }
}

#Preview {
    HomeView()
}
