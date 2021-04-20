//
//  MainVC.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//

import UIKit
import AVFoundation


class MainVC: BaseVC<MainVM> {
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.getCocktail()
        
        viewModel?.cocktailInfo.subscribe(onNext : { [self](data) in
            var test = ""
        }).disposed(by: loadingDisposeBag)
    }
    
    func playSound (){
        let playerSound = Bundle.main.path(forResource: "shaker", ofType: "mp3") ?? ""
        let url = URL(fileURLWithPath: playerSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            var test = ""
        }
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            playSound()
            self.viewModel?.getCocktail()
        }
    }
}

