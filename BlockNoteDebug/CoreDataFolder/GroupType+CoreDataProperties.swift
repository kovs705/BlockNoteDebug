//
//  GroupType+CoreDataProperties.swift
//  BlockNoteDebug
//
//  Created by Kovs on 04.12.2021.
//
//

import Foundation
import CoreData


extension GroupType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupType> {
        return NSFetchRequest<GroupType>(entityName: "GroupType")
    }

    @NSManaged public var groupColor: String?
    @NSManaged public var groupName: String?
    
    @NSManaged public var noteTypes: NSSet?

    public var wrappedNumber: Int {
        number
    }
    
    public var wrappedGroupName: String {
        groupName ?? "Unknown name of the group"
    }
    
    public var typesOfNoteArray: [Note] {
        let set = noteTypes as? Set<Note> ?? []
        return set.sorted {
            $0.wrappedNoteName < $1.wrappedNoteName
        }
    }
}

extension NSManagedObject {
    func addObject(value: NSManagedObject, forKey key: String) {
        let notes = self.mutableSetValue(forKey: key)
        notes.add(value)
    }
    func removeObject(value: NSManagedObject, forKey key: String) {
        let notes = self.mutableSetValue(forKey: key)
        notes.remove(value)
    }
}

// MARK: Generated accessors for noteTypes
extension GroupType {

    @objc(addNoteTypesObject:)
    @NSManaged public func addToNoteTypes(_ value: Note)

    @objc(removeNoteTypesObject:)
    @NSManaged public func removeFromNoteTypes(_ value: Note)

    @objc(addNoteTypes:)
    @NSManaged public func addToNoteTypes(_ values: NSSet)

    @objc(removeNoteTypes:)
    @NSManaged public func removeFromNoteTypes(_ values: NSSet)

}

extension GroupType : Identifiable {

}
