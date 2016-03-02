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
        
        playMagicSound()
        
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseIn, animations: { () -> Void in
            
            self.magicAnswer.alpha = 0.0
            
            })
            { (Bool) -> Void in
                
                self.magicAnswer.text = answer
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                    self.magicAnswer.alpha = 1.0
                    
                })
                
        }
        
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        getAnswerPressed()
        
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
            magicSound.currentTime = 0
        }
        
        magicSound.play()
        
    }

}
