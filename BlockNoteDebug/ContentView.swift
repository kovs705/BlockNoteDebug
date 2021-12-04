//
//  ContentView.swift
//  BlockNoteDebug
//
//  Created by Kovs on 03.12.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(key: "noteID", ascending: true)], predicate: nil) var notes: FetchedResults<Note>
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    addItem()
                }) {
                    Text("Tapp to add a note")
                }
                List {
                    ForEach(notes, id: \.self) { note in
                        NavigationLink(destination: NoteView(note: note)) {
                            Text(note.wrappedNoteName)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .frame(width: UIScreen.main.bounds.width - 20, height: 700)
                // List
            }
            // VStack
        }
        .navigationTitle("Debug App")
        
    }

    private func addItem() {
        withAnimation {
            let newNote = Note(context: viewContext)
            newNote.noteName = "New note name"
            newNote.noteID = (notes.last?.noteID ?? 0) + 1

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { notes[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
