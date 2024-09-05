//
//  InfoView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 01/09/2024.
//

import SwiftUI
import Combine

struct InfoView: View {
    
    @State var timerViewModel = TimerViewModel()
    @State var viewModel: NoteViewModel
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            VStack (alignment: .leading , spacing: 10){
                Text(Date().formatted(.dateTime.day()))
                    .font(.system(size: 110))
                    .frame(height: 100)
                Text("\(viewModel.tasks - viewModel.completed) Availble Tasks").bold()
                Text(Date().formatted(.dateTime.weekday(.wide)))
            }
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 130 , height: 1)
                .foregroundStyle(.gray.opacity(0.3))
                .offset(y: 5)
            
            
            VStack (alignment: .leading , spacing: 10){
                Text(timerViewModel.currentTime)
                    .font(.system(size: 33))
                Text("Last Task is").bold()
                if viewModel.notes.isEmpty {
                    Text("No task yet all you need is to add new one")
                        .frame(width: 120 , height: 62 , alignment: .topLeading)
                        .font(.footnote)
                }
                
                if let lastNote = viewModel.notes.last {
                    Text(lastNote.note  )
                        .frame(width: 120 , height: 62 , alignment: .topLeading)
                        .font(.footnote)
                }
                
            }
            .frame(height: 150)
            
        }
        
    }
}

#Preview {
    InfoView(viewModel: NoteViewModel())
}

class TimerViewModel: ObservableObject {
    @Published var currentTime: String = ""
    private var timer: AnyCancellable?
    
    init() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTime()
            }
        updateTime()
    }
    
    
    private func updateTime(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "h:mm:a"
        currentTime = dateFormatter.string(from: Date())
    }
}
