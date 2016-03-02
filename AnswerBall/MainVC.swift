//
//  MainVC.swift
//  AnswerBall
//
//  Created by Colton Ehrman on 3/1/16.
//  Copyright © 2016 Colton Ehrman. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var magicAnswer: UILabel!
    
    @IBAction func getAnswerPressed() {
        
        let rand = Int(arc4random_uniform(UInt32(magicAnswers.count)))
        
        let answer = magicAnswers[rand]
        
        magicAnswer.text = answer
       
        playMagicSound()
        
    }
    
    var magicSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let pathToSound = NSBundle.mainBundle().pathForResource("Shakesound", ofType: "wav") {
            
            let soundUrl = NSURL(fileURLWithPath: pathToSound)
            
            do {
                try magicSound = AVAudioPlayer(contentsOfURL: soundUrl)
                magicSound.prepareToPlay()
            }
            catch let err as NSError {
                print(err.debugDescription)
            }
            
        }
        
    }
    
    func playMagicSound() {
        
        if magicSound.playing {
            magicSound.stop()
        }
        
        magicSound.play()
        
    }

}
