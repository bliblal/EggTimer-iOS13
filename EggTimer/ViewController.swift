//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    var timerValues = ["Soft" : 300, "Medium" :420, "Hard": 720]
    var timerValues = ["Soft" : 3, "Medium" :4, "Hard": 7]
    var timer = Timer()
    var secondsRemaining = 60
    @IBOutlet weak var eggLabel: UILabel!

    @IBAction func eggPressed(_ sender: UIButton) {
        timer.invalidate()
        eggLabel.text = "How do you like your eggs?"
        secondsRemaining = timerValues[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
   
        
        
    }
    
    
    @objc func updateTimer(){
        if (secondsRemaining>0){
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        }
        else{
            timer.invalidate()
            eggLabel.text = "DONE"
        }
       
    }
    
   
}
