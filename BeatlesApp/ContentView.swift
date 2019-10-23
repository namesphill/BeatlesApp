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
      NavigationView {
         ArtistDetail(artist: Paul)
      }.colorScheme(.dark)
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
