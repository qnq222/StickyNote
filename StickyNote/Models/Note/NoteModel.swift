//
//  NoteModel.swift
//  StickyNote
//
//  Created by Ayman AbuMutair on 04/09/2024.
//

import Foundation

struct NoteModel: Identifiable {
    var id = UUID().uuidString
    var card: String
    var note: String
    var position: CGPoint
}
