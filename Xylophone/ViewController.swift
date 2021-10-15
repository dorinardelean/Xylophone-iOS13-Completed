//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
//import Piano

class ViewController: UIViewController {
    
    @IBOutlet var keys: [UIButton]!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)

        //Animate the button when pressed
        UIView.animate(withDuration: 0.03) {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                sender.transform = CGAffineTransform.identity
            }
        }

    }
    
    func playSound(soundName: String) {
//        You need to put back the Sounds folder and add the wav files for this to work.
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

//        🎹.play([
//            .sound(.asset(name: soundName)),
//            .hapticFeedback(.impact(.light))
//            ])
        
    }
    
    func setupButtons() {
        for key in keys {
            key.layer.cornerRadius = 5
        }
    }
    
}








