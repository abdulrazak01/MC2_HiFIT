//
//  ViewController.swift
//  CountdownTimer
//
//  Created by Abdul Razak on 2020-05-11.
//  Copyright © 2020 Abdul Razak. All rights reserved.
//


import UIKit
import AVFoundation
protocol CountdownTimerDelegate:class {
    func countdownTimerDone()
    func countdownTime(time: (minutes:String, seconds:String))
}

class CountdownTimer {
    //let allExercise = ArayWork()
    //    var exerciseNumber: Int = 0
    weak var delegate: CountdownTimerDelegate?
    
    fileprivate var seconds = 0.0
    fileprivate var duration = 0.0
    
    lazy var timer: Timer = {
        let timer = Timer()
        return timer
    }()
    private let countdownSound: AVAudioPlayer? = {
        if let sound = NSDataAsset(name: "Sounds/currentExerciseEnd") {
            if let audio = try? AVAudioPlayer(data: sound.data) {
                return audio
            }
        }
        return nil
    }()
    public func setTimer( minutes:Int, seconds:Int) {
        
        
        //let minutesToSeconds = minutes * 60
        //let secondsToSeconds = seconds
        
        // let seconds = secondsToSeconds + minutesToSeconds
        
        self.seconds = Double(seconds)
        self.duration = Double(seconds)
        
        delegate?.countdownTime(time: timeString(time: TimeInterval(ceil(duration))))
    }
    
    
    
    public func start() {
        
        runTimer()
        
    }
    
    public func pause() {
        timer.invalidate()
        countdownSound?.pause()
    }
    
    public func stop() {
        timer.invalidate()
        duration = seconds
        delegate?.countdownTime(time: timeString(time: TimeInterval(ceil(duration))))
    }
    
    
    fileprivate func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc fileprivate func updateTimer(){
        
        
        if duration < 0.0 {
            timer.invalidate()
            timerDone()
            
            
        }
        if duration < 5 {
            countdownSound?.play()
            duration -= 0.01
            delegate?.countdownTime(time: timeString(time: TimeInterval(ceil(duration))))
        }
        else {
            duration -= 0.01
            delegate?.countdownTime(time: timeString(time: TimeInterval(ceil(duration))))
            
        }
    }
    
    fileprivate func timeString(time:TimeInterval) -> (minutes:String, seconds:String) {
        
        
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return (minutes: String(format:"%02i", minutes), seconds: String(format:"%02i", seconds))
    }
    
    fileprivate func timerDone() {
        timer.invalidate()
        duration = seconds
        delegate?.countdownTimerDone()
    }
    
    
    
    
    
    
    
    
    
}
