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
    
    
    var eggTimes = ["Soft" : 3, "Medium" : 5, "Hard" : 15]
    
    
    var timer = Timer()
    var startTime = 0
    var totalTime = 0
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        startTime = 0
        
        progressView.progress = 0.0
        timer.invalidate()
        var hardness = sender.currentTitle!
        
        
        totalTime = eggTimes[hardness]!
        
        labelOutput.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
                                #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        //example functionality
        if startTime < totalTime {
        
           
            startTime += 1
            progressView.progress = Float(startTime)/Float(totalTime)
        
        }
        else {
            labelOutput.text = "Done!"
            timer.invalidate()
            //add alarm for more
        }
    }
    
    
    
}

