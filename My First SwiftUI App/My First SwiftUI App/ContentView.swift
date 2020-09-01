//
//  ContentView.swift
//  My First SwiftUI App
//
//  Created by Milind Contractor on 2/8/20.
//  Copyright © 2020 madebyadvait:). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var rooms: [Room] = []
    var body: some View {
        NavigationView {
            List(rooms) { Room in
                RoomCell(Room: Room)
            }
        .navigationBarTitle(Text("Rooms"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rooms: testData)
    }
}

struct RoomCell : View {
    let Room : Room
    
    var body: some View {
        return NavigationLink(destination: RoomDetail(rooms: Room)) {
        Image(Room.thumbnailName)
            .cornerRadius(10)
        VStack(alignment: .leading) {
            Text(Room.name)
            Text("\(Room.capacity) People")
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
        }
    }
    
}
