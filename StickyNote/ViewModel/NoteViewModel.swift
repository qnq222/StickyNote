//
//  NoteViewModel.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 04/09/2024.
//

import Foundation
import Observation

@Observable
class NoteViewModel {
    
    var notes: [NoteModel] = []
    
    var completed = 0
    var tasks = 0
    var remaining = 0 
    
}
