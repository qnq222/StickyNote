//
//  NoteOverviewView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 01/09/2024.
//

import SwiftUI

struct NoteOverviewView: View {
    
    @State var viewModel: NoteViewModel
    
    var body: some View {
        
        if viewModel.notes.isEmpty{
            VStack(spacing: 10) {
                StickerNote(image: .noteGreen, title: "1. \n Click on + button", degrees: 3)
                StickerNote(image: .noteBlue, title: "2. \n Type your task", degrees: -4)
                StickerNote(image: .noteOrange, title: "3. \n choose the sticker \n note color", degrees: -10)
            }
        } else {
            VStack(spacing: 15){
                ForEach(viewModel.notes.prefix(3)) {note in
                    ZStack {
                        Image(note.card)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 145, height: 120)
                        
                        Text(note.note)
                            .frame(width: 120 , height: 110)
                            .foregroundStyle(.primary)
                            .font(.custom("DeliciousHandrawn-Regular", size: 20))
                    }
                }
                 
            }
            .frame(height: 350 , alignment: .top)
        }
    }
}

#Preview {
    NoteOverviewView(viewModel: NoteViewModel())
}


struct StickerNote: View {
    
    var image: ImageResource
    var title: String
    var degrees: Double
    
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 145, height: 120)
            
            Text(title)
                .font(.custom("DeliciousHandrawn-Regular", size: 20))
        }
        .rotationEffect(.degrees(degrees))
        .offset(y:-10)
    }
}
