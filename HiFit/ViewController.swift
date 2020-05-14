//
//  ViewController.swift
//  HiFIT
//
//  Created by Abdul Razak on 2020-05-11.
//  Copyright © 2020 Abdul Razak. All rights reserved.
//



import UIKit
import AudioToolbox


class ViewController: UIViewController, CountdownTimerDelegate {

    //MARK - Outlets
    
    @IBOutlet weak var progressBar: ProgressBar!
   
    @IBOutlet weak var NumExercise: UILabel!
    @IBOutlet weak var titleWork: UILabel!
    
    @IBOutlet weak var imageWorkout: UIImageView!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var counterView: UIStackView!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
   
    let allExercise = ArayWork()
    var exerciseNumber: Int = 0

    
    var countdownTimerDidStart = false
    
  
    lazy var countdownTimer: CountdownTimer = {
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    
    
    var selectedSecs = 20
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countdownTimer.delegate = self
        countdownTimer.setTimer(minutes: 0, seconds: selectedSecs)
        progressBar.setProgressBar(minutes: 0, seconds: selectedSecs)
        stopBtn.isEnabled = false
        stopBtn.alpha = 0.5

        
      
        counterView.isHidden = false
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
  
    
    func countdownTime(time: (minutes: String, seconds: String)) {
        
        minutes.text = time.minutes
        seconds.text = time.seconds
        
    }
    
   
    
    func countdownTimerDone() {
        
        //counterView.isHidden = true
        //messageLabel.isHidden = false
        seconds.text = String(selectedSecs)
        countdownTimerDidStart = false
        //stopBtn.isEnabled = false
        //stopBtn.alpha = 0.5
        startBtn.setTitle("START",for: .normal)
        exerciseNumber += 1
        updateExercise()
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
    }
    
   
    
    
    @IBAction func startTimer(_ sender: UIButton) {
        
        
       
        counterView.isHidden = false
        
        stopBtn.isEnabled = true
        stopBtn.alpha = 1.0
        
        if !countdownTimerDidStart{
            countdownTimer.start()
            progressBar.start()
            countdownTimerDidStart = true
            startBtn.setTitle("PAUSE",for: .normal)
     
        }
        
        else{
            countdownTimer.pause()
            progressBar.pause()
            countdownTimerDidStart = false
            startBtn.setTitle("RESUME",for: .normal)
        }
    }
    
    @IBAction func NumberExer(_ sender: Any) {
        exerciseNumber += 1
        updateExercise()
    }
    
    func updateExercise(){
        if exerciseNumber <= allExercise.list.count - 1{
            imageWorkout.image = UIImage(named:(allExercise.list[exerciseNumber].workoutImage))
            titleWork.text = allExercise.list[exerciseNumber].exercise
            updateUI()
        }
    }
    func updateUI(){
        NumExercise.text = "\(exerciseNumber + 1)/\(allExercise.list.count)"
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        countdownTimer.stop()
        progressBar.stop()
        countdownTimerDidStart = false
        stopBtn.isEnabled = false
        stopBtn.alpha = 0.5
        startBtn.setTitle("START",for: .normal)
    }
    
    
    


}

