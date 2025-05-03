
//  ContentView.swift
//  Tristan Clicker
//
//  Created by James on 3/5/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var counter = 0
    @State var pictureID = 1
    @State var player: AVAudioPlayer?
    @State var soonPerClick = 1
    @State private var rotateAngle: Double = -5
    @State var passiveSoon = 0
    @State private var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()


    
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
            Spacer()
            Button {
                counter += soonPerClick
                print(counter)
                playSound(named: "meow.m4a")
            } label: {
                if (pictureID == 1){
                    Image("tristan og")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(rotateAngle))
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: rotateAngle)
                        .onAppear {
                            rotateAngle = 5
                        }
                }
                if (pictureID == 2){
                    Image("TRISTAN DRIP")
                        .resizable()
                        .frame(width: 200, height: 350)
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(rotateAngle))
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: rotateAngle)
                        .onAppear {
                            rotateAngle = 5
                        }
                }

            }
            VStack{
                
                Text("You have \(counter) $00Ns!")
                Text("$00N per click: \(soonPerClick) $00Ns!")
                Text("Passive $00N Income: \(passiveSoon)")
                HStack{
                    Button("GIVE HIM DRIP!")
                    {
                        if (counter >= 100)
                        {
                            print("Upgrade clicked")
                            counter -= 100
                            pictureID += 1
                            playSound(named: "KACHING.mp3")
                        }
                    }
                    .frame(width: 100, height: 100)
                    .buttonStyle(.borderedProminent)
                    Button("GIVE HIM BETTER PAY!")
                    {
                        if (counter >= 50)
                        {
                            print("Upgrade clicked")
                            counter -= 50
                            soonPerClick += 1
                            playSound(named: "KACHING.mp3")
                        }
                    }
                    .frame(width: 150, height: 100)
                    .buttonStyle(.borderedProminent)
                    
                }
                Button("HE INVESTED IN PROPERTIES!")
                {
                    if (counter >= 50)
                    {
                        print("Upgrade clicked")
                        counter -= 50
                        passiveSoon += 1
                        playSound(named: "KACHING.mp3")
                    }
                }
                .frame(width: 150, height: 100)
                .buttonStyle(.borderedProminent)
                Spacer()
                Spacer()
            }
            
        }
        .navigationTitle("Tristan Clicker!")
        .onReceive(timer) { _ in
            if passiveSoon > 0 {
                counter += passiveSoon
            }
        }
    }
}

#Preview {
    ContentView()
}
