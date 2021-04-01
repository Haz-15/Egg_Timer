//
//  ViewController.swift
//  Egg_Time
//
//  Created by Asim Burrell on 2/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOutput: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    let eggTimes = ["Soft" : 3, "Medium" : 5, "Hard" : 15]
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressView.progress = 0.0
        secondsPassed = 0

        labelOutput.text = hardness
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
                                #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed +=  1
            progressView.progress = Float(secondsPassed)/Float(totalTime)
            
        }
        else {
            labelOutput.text = "Done!"
            timer.invalidate()
            //add alarm for more
        }
    }
    
    
    
}

