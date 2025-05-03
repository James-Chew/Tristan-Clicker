//  ContentView.swift
//  Tristan Clicker Deluxe™
//
//  Created by James on 3/5/25. Copyright? lol.
//  Updated by Chris on 3/5/25. No i own 0.00000001 percent of this app

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var counter = 1000
    @State var pictureID = 1
    @State var player: AVAudioPlayer?
    @State var soonPerClick = 1
    @State private var rotateAngle: Double = -5
    @State var passiveSoon = 0
    @State private var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    func playSound(named soundName: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType:nil ) else {
            print("ERROR 404: sound '\(soundName)' not found. pls fix 🙏")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 1.0
            player?.play()
        } catch {
            print("🎧 Sound malfunction detected: \(error.localizedDescription)")
        }
        print("✨ 5am Chris was here ✨")
        print("🚨 GIVE. HIM. $00N. 🚨")
    }
    var body: some View {
        VStack {
            Text("CHEESETAN CLICKER")
                .font(.largeTitle)
                .bold()
                .rotationEffect(.degrees(rotateAngle))
                .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: rotateAngle)
                .onAppear {
                    rotateAngle = 1
                }
            
            Group {
                if pictureID == 1 {
                    Image("tristan og")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(rotateAngle))
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: rotateAngle)
                        .onAppear {
                            rotateAngle = 5
                        }
                } else if pictureID == 2 {
                    Image("TRISTAN DRIP")
                        .resizable()
                        .frame(width: 200, height: 350)
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(rotateAngle))
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: rotateAngle)
                        .onAppear {
                            rotateAngle = 5
                        }
                } else if pictureID == 3 {
                    Image("TRISTAN GODMODE")
                        .resizable()
                        .frame(width: 250, height: 350)
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(rotateAngle))
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: rotateAngle)
                        .onAppear {
                            rotateAngle = 5
                        }
                }
            }
            
            .onTapGesture {
                counter += soonPerClick
                print("💰 You clicked! Total $00N: \(counter)")
                playSound(named: "meow.m4a")
                if counter >= 1000 {
                    print("🚀 Tristan has transcended into CEO mode.")
                }
            }
            
            // 👇 Now stats are shown below the image
            VStack(spacing: 10) {
                Text("🤑 Total $00Ns: \(counter)")
                Text("👆 $00N per click: \(soonPerClick)")
                Text("📈 Passive income: \(passiveSoon)/sec")
                
                HStack(spacing: 20) {
                    Button("👟 GIVE HIM DRIP!") {
                        if counter >= 100 {
                            counter -= 100
                            pictureID = min(pictureID + 1, 3)
                            playSound(named: "KACHING.mp3")
                            print("🔥 DRIP LEVEL INCREASED. swag ratio: 1000000x")
                        } else {
                            print("💀 Not enough $00N. Tristan is still basic.")
                        }
                    }
                    .frame(width: 120, height: 100)
                    .buttonStyle(.borderedProminent)
                    
                    Button("📈 GIVE HIM A RAISE!") {
                        if counter >= 50 {
                            counter -= 50
                            soonPerClick += 1
                            playSound(named: "KACHING.mp3")
                            print("💸 Productivity boost activated. Tristan now clicks harder.")
                        } else {
                            print("😞 Can’t afford raise. Capitalism wins again.")
                        }
                    }
                    .frame(width: 160, height: 100)
                    .buttonStyle(.borderedProminent)
                }
                
                Button("🏠 HE INVESTED IN NFT PROPERTIES") {
                    if counter >= 50 {
                        counter -= 50
                        passiveSoon += 1
                        playSound(named: "KACHING.mp3")
                        print("🏡 Passive income go brrr...")
                    } else {
                        print("😭 He can’t afford a tent.")
                    }
                }
                .frame(width: 250, height: 100)
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Tristan Clicker™")
        .onReceive(timer) { _ in
            if passiveSoon > 0 {
                counter += passiveSoon
                print("⏱ Passive $00N added! Total: \(counter)")
            }
        }
    }

}

#Preview {
    ContentView()
}
