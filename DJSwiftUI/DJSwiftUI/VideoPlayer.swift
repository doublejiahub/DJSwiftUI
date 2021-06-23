//
//  VideoPlayer.swift
//  DJSwiftUI
//
//  Created by zhihu on 2021/6/21.
//

import SwiftUI
import AVKit

struct ImmersionVideoPlayer: View {
    private let player = AVPlayer(url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!)
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                // Start the player going, otherwise controls don't appear
                player.play()
            }
            .onDisappear() {
                // Stop the player when the view disappears
                player.pause()
            }
    }
}

struct ImmersionVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ImmersionVideoPlayer()
    }
}
