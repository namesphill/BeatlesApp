//
//  ArtistDetail.swift
//  BeatlesApp
//
//  Created by Felipe Acosta on 10/21/19.
//  Copyright © 2019 Felipe Acosta. All rights reserved.
//

import SwiftUI

struct ArtistDetail: View {
   var artist: Artist
   var body: some View {
      ScrollView {
         VStack {
            Image(artist.imageName)
               .fillingImage(maxHeight: 600)
               .darkOverlay()
               .descriptionOverlay(
                  Text(artist.name)
                     .primaryLabel()
                     .padding()
               )
            ForEach(0 ..< artist.bio.count) { line in
               Text(self.artist.bio[line]).padding()
            }
            ForEach(artist.moments) { moment in
               NavigationLink(
                  destination: MomentDetail(moment: moment)
                     .navigationBarHidden(true)
                     .offset(y: -40)
               ) {
                  MomentCard(moment: moment)
               }
            }
         }
      }
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.dark)
      .background(Color.black)
   }
}

struct ArtistDetail_Previews: PreviewProvider {
   static var previews: some View {
      ArtistDetail(artist: John)
   }
}
