//
//  NoteItem+CoreDataProperties.swift
//  BlockNoteDebug
//
//  Created by Kovs on 03.12.2021.
//
//

import Foundation
import CoreData


extension NoteItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteItem> {
        return NSFetchRequest<NoteItem>(entityName: "NoteItem")
    }

    // @NSManaged public var noteItemOrder: Int16
    // @NSManaged public var noteItemType: Int16
    @NSManaged public var noteItemName: String?
    @NSManaged public var noteItemText: String?
    
    @NSManaged public var note: Note?
    
    public var wrappedNoteItemName: String {
        noteItemName ?? "Unknown NoteItem name"
    }
    public var wrappedNoteItemText: String {
        noteItemText ?? "Unknown text"
    }
    public var wrappedNoteItemOrder: Int {
        noteItemOrder
    }

}

extension NoteItem : Identifiable {

}
