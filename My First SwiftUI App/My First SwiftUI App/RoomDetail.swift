//
//  Room Detail.swift
//  My First SwiftUI App
//
//  Created by Milind Contractor on 7/8/20.
//  Copyright © 2020 madebyadvait:). All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    
    var rooms : Room
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if rooms.name == "Zoom" {
                Image("Zoom OG")
            } else if rooms.name == "Skype" {
                Image("Skype OG")
            } else {
            Image(rooms.imageNameView)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(rooms.name), displayMode: .inline)
                .onTapGesture { withAnimation(.easeIn(duration: 0.875)) { self.zoomed.toggle() } }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            if rooms.hasVideo && !zoomed {
                    Image(systemName: "video.fill")
                        .font(.title)
                        .padding(.all)
                        .transition(.move(edge: .leading))
            }
        }
    }
    
}


struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{ ContentView(rooms: testData) }
    }
}
