
//  ContentView.swift
//  Tristan Clicker
//
//  Created by James on 3/5/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var counter = 100
    @State var pictureID = 1
    @State var player: AVAudioPlayer?

    
    func playSound(named soundName: String) {

        guard let path = Bundle.main.path(forResource: soundName, ofType:nil ) else {
            print("path not created")
            return
        }

        let url = URL(fileURLWithPath: path)


        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 1.0
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        VStack {
            Button {
                counter += 1
                print(counter)
                playSound(named: "meow.m4a")
            } label: {
                if (pictureID == 1){
                    Image("tristan og")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                }
                if (pictureID == 2){
                    Image("TRISTAN DRIP")
                        .resizable()
                        .frame(width: 200, height: 350)
                        .aspectRatio(contentMode: .fit)
                }

            }
            Text("You have \(counter) $00Ns!")
            Button("GIVE HIM DRIP!")
            {
                if (counter == 100)
                {
                    print("Upgrade clicked")
                    counter -= 100
                    pictureID += 1
                }
            }

        }
        .navigationTitle("Tristan Clicker!")
        .padding()
    }
}

#Preview {
    ContentView()
}
