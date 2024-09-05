//
//  AddNewNoteView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 04/09/2024.
//

import SwiftUI

struct AddNewNoteView: View {
    
    @Environment(\.colorScheme) var isDark
    @State var viewModel: NoteViewModel
    @Binding var isPresenting: Bool
    @State var selected = "note_blue"
    @FocusState var isTyping: Bool
    @State var title = ""
    @State var placeholder = "Quick Note..."
    var cards: [String] = [
        "note_blue",
        "note_brown",
        "note_green",
        "note_orange",
        "note_red"
    ]
    
    var body: some View {
        
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        isPresenting = false
                    }
                }
            VStack (spacing: 40){
                
                TextEditor(text: isTyping ? $title : $placeholder)
                    .focused($isTyping)
                    .font(.custom("DeliciousHandrawn-Regular", size: 24))
                    .frame(height: 90)
                    .foregroundStyle(title.count >= 64 ? .red : .primary)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(alignment: .bottomTrailing) {
                        Text("\(title.count) / 64")
                            .foregroundStyle(title.count >= 64 ? .red : .white)
                            .offset(y: 30)
                    }
                
                HStack (spacing: 20){
                    ForEach(cards , id: \.self) {card in
                        Image(card)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .scaleEffect(selected == card ? 1.5 : 1)
                            .animation(.spring, value: selected)
                            .onTapGesture {
                                selected = card
                            }
                    }
                }
                
                Button(action: {
                    withAnimation {
                        viewModel.notes.append(NoteModel(card: selected, note: title, position: CGPoint(x: 100, y: 200)))
                        title = ""
                        isPresenting = false
                        viewModel.tasks += 1
                    }
                    
                }, label: {
                    Text("Save").bold()
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(isDark == .dark ? .white : .black)
                        .background(isDark == .dark ? .black : .white , in: .rect(cornerRadius: 10))
                })
            }
            .padding(.horizontal , 10)
            .frame(maxWidth: .infinity)
            .frame(height: 280)
            .background(isDark == .dark ? .bg : .bg , in: .rect(cornerRadius: 20))
            .padding()
        .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
    }
}

#Preview {
    AddNewNoteView(viewModel: NoteViewModel(), isPresenting: .constant(false))
}
