//
//  NoteItem+CoreDataClass.swift
//  BlockNoteDebug
//
//  Created by Kovs on 03.12.2021.
//
//

import Foundation
import CoreData

enum NoteItemType: Int {
    case textBlock
    case vocabularyBlock
    case countDownBlock
    case emptyBlockTest
    // and so on
}

@objc(NoteItem)
public class NoteItem: NSManagedObject {
    @NSManaged var noteItemOrder: Int
    // @NSManaged fileprivate var noteTypeValue: Int
    @NSManaged fileprivate var noteItemType: Int
    
    var type: NoteItemType {
        get {
            return NoteItemType(rawValue: noteItemType) ?? .emptyBlockTest
        }
        set {
            noteItemType = newValue.rawValue
        }
    }
}
