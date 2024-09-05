//
//  TimeBoardView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 01/09/2024.
//

import SwiftUI

struct TimeBoardView: View {
    
    @State var viewModel = NoteViewModel()
    
    var body: some View {
        VStack(spacing: 55) {
            ProfileView()
            NoteProgressView(viewModel: viewModel)
            HStack(alignment: .top) {
                NoteOverviewView(viewModel: viewModel)
                Spacer()
                InfoView(viewModel: viewModel)
                    .frame(height: 400 , alignment: .top)
            }
            Spacer()
        }
        .padding(.horizontal , 25)
    }
}

#Preview {
    TimeBoardView()
}
