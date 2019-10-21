//
//  ContentView.swift
//  HelloWorld
//
//  Created by Felipe Acosta on 10/19/19.
//  Copyright © 2019 Felipe Acosta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
      ScrollView {
         ArtistDetail(artist: .paul).edgesIgnoringSafeArea(.all)
      }
      .colorScheme(.dark)
      .background(Color.black.edgesIgnoringSafeArea(.all))
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

struct ArtistDetail: View {
   public var artist: Artist
   var body: some View {
      VStack {
         ZStack(alignment: .bottomLeading) {
            Image(artist.rawValue.lowercased())
               .resizable()
               .aspectRatio(contentMode: .fill)
               .frame(maxHeight: 500, alignment: Alignment.top)
               .clipped()
               .overlay(
                  LinearGradient(
                     gradient:
                     Gradient(stops: [
                        Gradient.Stop(color: .black, location: 0),
                        Gradient.Stop(
                           color: Color(red: 0, green: 0, blue: 0, opacity: 0.5),
                           location: 0.2
                        ),
                        Gradient.Stop(color: .clear, location: 0.6),
                        Gradient.Stop(color: .black, location: 0.9)
                     ]),
                     startPoint: .top,
                     endPoint: .bottom
                  )
               )
            Text(artist.rawValue)
               .font(.largeTitle)
               .bold()
               .padding()
         }
         ForEach(0 ..< 15) { _ in
            Text("Hello").padding()
         }
      }
   }
}

enum Artist: String {
   case john = "John"
   case george = "George"
   case paul = "Paul"
   case ringo = "Ringo"
}
