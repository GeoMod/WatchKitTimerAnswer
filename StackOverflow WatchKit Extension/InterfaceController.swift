//
//  InterfaceController.swift
//  StackOverflow WatchKit Extension
//
//  Created by Dan OLeary on 8/31/17.
//  Copyright © 2017 Impulse Coupled Development. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    var theTimer = Timer()
    var backgroundTimer = TimeInterval(15)
    @IBOutlet var appleTimer: WKInterfaceTimer!
    @IBOutlet var label: WKInterfaceLabel!
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        appleTimer.setDate(Date(timeIntervalSinceNow: 15))
        label.setText("")
    }    
    
    
    @IBAction func startButton() {
        let startTime = Date(timeIntervalSinceNow: 15)
        appleTimer.setDate(startTime)
        appleTimer.start()
        
        // This will call timerCountDown() once per second until conditions are met.
        theTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCountDown), userInfo: nil, repeats: true)
        
    }
    
    func timerCountDown() {
        backgroundTimer -= 1.0
        print(backgroundTimer)
        if backgroundTimer == 0 {
            theTimer.invalidate()
            appleTimer.stop()
            
            // You could call an Alert Action here.
            label.setText("Timer Done!")
        }
        
    }

    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
