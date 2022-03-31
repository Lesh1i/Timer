//
//  ViewController.swift
//  iTimer_Komarov_Krasyuk
//
//  Created by Student on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var lapButton: UIButton!
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    @IBAction func LapTapped(_ sender: Any)
    {
        self.count = 0
        self.timer.invalidate()
        self.timerLabel.text = self.makeTimeString(minutes: 0, seconds: 0)
        self.startStopButton.setTitle("Start", for: .normal)
    }
    
    @IBAction func startStopButtonTapped(_ sender: Any)
    {
        if(timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startStopButton.setTitle("Start", for: .normal)
        }
        else
        {
            timerCounting = true
            startStopButton.setTitle("Stop", for: .normal)
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
    {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
