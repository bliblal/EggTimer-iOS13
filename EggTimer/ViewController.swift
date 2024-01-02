//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timerValues: [String:Float] = ["Soft" : 300, "Medium" :420, "Hard": 720]
//    var timerValues: [String:Float] = ["Soft" : 3, "Medium" :4, "Hard": 7]
    var timer = Timer()
    var secondsRemaining:Float = 60
    var totalSeconds: Float = 0
    @IBOutlet weak var eggLabel: UILabel!
    var progressValue: Float = 0
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func eggPressed(_ sender: UIButton) {
        timer.invalidate()
        eggLabel.text = "How do you like your eggs?"
        secondsRemaining = timerValues[sender.currentTitle!]!
        totalSeconds = timerValues[sender.currentTitle!]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        eggLabel.text = sender.currentTitle
   
        
        
    }
    
    
    @objc func updateTimer(){
        if (secondsRemaining>=0){
            print("\(secondsRemaining) seconds")
            let percent = getPercent(seconds: totalSeconds)
            print(percent)
            progressBar.progress = percent
            secondsRemaining -= 1
            
        }
        else{
            timer.invalidate()
            eggLabel.text = "DONE"
        }
       
    }
    
    func getPercent(seconds: Float) -> Float{
        let percent: Float = 1-(secondsRemaining/seconds)
        return Float(percent)
    }
    
   
}
