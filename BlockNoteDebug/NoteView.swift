//
//  NoteView.swift
//  BlockNoteDebug
//
//  Created by Kovs on 04.12.2021.
//

import SwiftUI
import CoreData

struct NoteView: View {
    
    @ObservedObject var note: Note
    
    var body: some View {
        VStack {
            Text(note.wrappedNoteName)
                .bold()
                .font(.title)
            Divider()
                .padding(10)
            
            List {
                ForEach(note.noteItemArray, id: \.self) { noteItem in
                    Text(noteItem.wrappedNoteItemName)
                }
            }
            
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let note = Note(context: moc)
        note.noteIsMarked = false
        note.noteName = "Preview Name"
        note.noteType = "Preview type"
        
        return NavigationView {
            NoteView(note: note)
        }
    }
}
