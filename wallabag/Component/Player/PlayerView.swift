//
//  PlayerView.swift
//  wallabag
//
//  Created by Marinel Maxime on 19/11/2019.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var playerPublisher: PlayerPublisher
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            SwipePlayerView()
            if appState.showPlayer {
                if playerPublisher.podcast != nil {
                    playerPublisher.podcast.map { podcast in
                        VStack {
                            HStack {
                                EntryPicture(url: podcast.picture).frame(width: 25, height: 25, alignment: .center)
                                Text(podcast.title)
                                Spacer()
                                Button(action: {
                                    self.playerPublisher.togglePlaying()
                                }, label: {
                                    Image(systemName: playerPublisher.isPlaying ? "pause" : "play")
                                })
                            }
                        }.padding()
                    }
                } else {
                    Text("Please select entry")
                }
            }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
