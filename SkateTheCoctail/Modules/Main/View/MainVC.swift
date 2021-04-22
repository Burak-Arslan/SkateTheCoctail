//
//  MainVC.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//

import UIKit
import AVFoundation


class MainVC: BaseVC<MainVM> {
    
    
    @IBOutlet weak var mainScroll: UIScrollView!
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var imgCocktail: UIImageView!
    @IBOutlet weak var lblDrinkName: UILabel!
    @IBOutlet weak var lblDrinkCategory: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var collectionMaterial: UICollectionView!
    @IBOutlet weak var collectionSpecification: UICollectionView!
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initilaze()
        getCallService()
    }
    
    func initilaze(){
        imgCocktail.layer.cornerRadius = 8
        imgCocktail.layer.borderWidth = 1
        imgCocktail.layer.borderColor = UIColor.backgroundMain.cgColor
        self.viewModel?.getCocktail()
    }
    
    func getCallService(){
        viewModel?.cocktailInfo.subscribe(onNext : {(data) in
            var arr = [String]()
            for (key, value) in data.drinks[0] {
                arr.append("\(key) \(value)")
            }
            
            for x in 0..<arr.count {
              var test = arr[x]
            }

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

