//
//  ViewController.swift
//  iTimer-Komarov-Krasyuk
//
//  Created by Student on 06.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var lapResetButton: UIButton!
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    @IBAction func lapResetButtonTapped(_ sender: Any)
    {
        if(timerCounting)
        {
            
        }
        else
        {
            self.count = 0
            self.timer.invalidate()
            self.timerLabel.text = self.makeTimeString(minutes: 0, seconds: 0)
        }
    }
    
    @IBAction func startStopButtonTapped(_ sender: Any)
    {
        if(timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            lapResetButton.setTitle("Reset", for: .normal)
        }
        else
        {
            timerCounting = true
            startStopButton.setTitle("Pause", for: .normal)
            lapResetButton.setTitle("Lap", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter () -> Void
    {
        count = count + 1
        let time = secondsToHourMinutesSeconds(seconds: count)
        let timeString = makeTimeString(minutes: time.0, seconds: time.1)
        timerLabel.text = timeString
    }
    
    func secondsToHourMinutesSeconds(seconds: Int) -> (Int, Int)
    {
        return (((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(minutes: Int, seconds: Int) -> String
    {   var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
