//
//  BorderView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 04/09/2024.
//

import SwiftUI

struct BorderView: View {
    
    @State var viewModel = NoteViewModel()
    @State var isDragingOverTrash = false
    @State var isEdit = false
    @Binding var isPresenting: Bool
    
    var body: some View {
        ZStack {
            ZStack {
                Image(.bgGrid)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity , maxHeight: .infinity)
                    .ignoresSafeArea()
                
                ForEach(viewModel.notes) {note in
                    ZStack {
                        Image(note.card)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200 , height: 200)
                        
                        Text(note.note)
                            .frame(width: 150 , height: 150)
                            .foregroundStyle(.primary)
                            .font(.custom("DeliciousHandrawn-Regular", size: 20))
                    }
                    .position(note.position)
                    .gesture (
                        DragGesture()
                            .onChanged{ value in
                                withAnimation(.spring) {
                                    if let index = viewModel.notes.firstIndex(where: {$0.id == note.id}) {
                                        viewModel.notes[index].position = value.location
                                    }
                                    
                                    isDragingOverTrash = (30...150).contains(value.location.x) && (300...450).contains(value.location.y)
                                }
                            }
                        
                            .onEnded { value in
                                if isEdit {
                                    if isDragingOverTrash {
                                        viewModel.notes.removeAll {$0.id == note .id}
                                        viewModel.completed += 1
                                    }
                                    isDragingOverTrash = false
                                }
                                
                                
                            }
                        
                        
                    )
                }
                
                if isEdit {
                    trashIcon
                }
            }
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    isEdit.toggle()
                }, label: {
                    Image(systemName: "pencil.slash")
                        .padding(10)
                        .background(.black , in: Circle())
                        .foregroundStyle(.white)
                })
                .padding()
            }
            
            GeometryReader { geometry in
                AddNewNoteView(viewModel: viewModel, isPresenting: $isPresenting)
                    .offset(y: isPresenting ? -100 : geometry.size.height)
            }
        }
        .onChange(of: viewModel.notes.count) { oldValue, newValue in
            if viewModel.notes.count == 0 {
                viewModel.tasks = 0
                viewModel.completed = 0
                
            }
        }
    }
    
    private var trashIcon: some View {
        Image(systemName: isDragingOverTrash ? "trash.fill" : "trash")
            .foregroundStyle(.white)
            .padding()
            .background(isDragingOverTrash ? .pink : .black , in: Circle())
            .opacity(isDragingOverTrash ? 0.7 : 1)
            .scaleEffect(isDragingOverTrash ? 1.3 : 1)
            .position(CGPoint(x: 45, y: 375))
            .animation(.spring, value: isDragingOverTrash)
        
    }
}

#Preview {
    BorderView(viewModel: NoteViewModel(), isPresenting: .constant(false))
}
