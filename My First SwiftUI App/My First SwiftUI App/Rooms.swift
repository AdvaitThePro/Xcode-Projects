//
//  Rooms.swift
//  My First SwiftUI App
//
//  Created by Milind Contractor on 7/8/20.
//  Copyright © 2020 madebyadvait:). All rights reserved.
//

import SwiftUI

struct Room : Identifiable {
    var id = UUID()
    var name : String
    var capacity : Int
    var hasVideo : Bool = false
    
    var imageName : String { return name }
    var imageNameView : String { return name + " OG" }
    var thumbnailName : String { return name }
}


let testData = [
    Room(name: "Observation Deck", capacity: 6, hasVideo: true),
    Room(name: "Executive Suite", capacity: 8, hasVideo: false),
    Room(name: "Charter Jet", capacity: 6, hasVideo: true),
    Room(name: "Dungeon", capacity: 10, hasVideo: true),
    Room(name: "Panorama", capacity: 12, hasVideo: false),
    Room(name: "Oceanfront", capacity: 8, hasVideo: false),
    Room(name: "Rainbow Room", capacity: 10, hasVideo: true),
    Room(name: "Pastoral", capacity: 7, hasVideo: false),
    Room(name: "Elephant Room", capacity: 1, hasVideo: false),
    Room(name: "Skype", capacity: 50, hasVideo: true),
    Room(name: "Zoom", capacity: 500, hasVideo: true),
    
]


