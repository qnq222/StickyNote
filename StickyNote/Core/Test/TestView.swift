//
//  TestView.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 03/09/2024.
//

import SwiftUI
import Observation

struct DataModel: Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var position: CGPoint
    
}

struct TestView: View {
    
    @State var vmItems: [DataModel] = []
    @State var isDragingOverTrash = false
    
    var body: some View {
        
        ZStack {
            
            ForEach(vmItems) { item in
                ZStack {
                    Image(.noteBrown)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200 , height: 200)
                    Text(item.name)
                }
                .position(item.position)
                .gesture(
                    DragGesture()
                        .onChanged {value in
                            withAnimation(.spring) {
                                if let index = vmItems.firstIndex(where: {$0.id == item.id}) {
                                    vmItems[index].position = value.location
                                }
                                
                                isDragingOverTrash = (30...150).contains(value.location.x) && (300...450).contains(value.location.y)
                            }
                        }
                    
                        .onEnded {value in
                            if isDragingOverTrash {
                                vmItems.removeAll {$0.id == item.id}
                            }
                            
                            isDragingOverTrash = false
                        }
                    
                )
            }
            
            Button(action: {
                withAnimation {
                    vmItems.append(DataModel(name: "New Note", position: CGPoint(x: 100, y: 100)))
                }
                
            }, label: {
                Text("Add Note")
                    .font(.largeTitle)
            })
            .frame(maxHeight: .infinity , alignment: .bottom)
            
            
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
}

#Preview {
    TestView()
}


struct TestContentView: View {
    
    @State var viewModel: DataClass
    
    var body: some View {
        Button {
            viewModel.classArray.append(TestDataModel(name: "New Item"))
        } label: {
            Text("Add New Item")
        }

    }
}

struct TestDataModel: Identifiable {
    var id = UUID().uuidString
    var name: String
}


@Observable
class DataClass {
    var classArray: [TestDataModel] = []
}

struct DisplayData: View {
    
    @State var viewModel: DataClass
    
    var body: some View {
        VStack {
            
            TestContentView(viewModel: viewModel)
            
            ForEach(viewModel.classArray) { item in
                Text(item.name)
            }
            
        }
        
    }
}
