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
    
    @IBOutlet weak var promptWork: UILabel!
    @IBOutlet weak var typeWork: UILabel!
    
    let allExercise = ArrayWork()
    var exerciseNumber: Int = 0

    
    var countdownTimerDidStart = false
    
  
    lazy var countdownTimer: CountdownTimer = {
        
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    
    

     var selectedSecs = 6
   


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      
     
        updateExercise()
        updateUI()
        countdownTimer.delegate = self
     
        
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
            typeWork.text = allExercise.list[exerciseNumber].typeExercise
            promptWork.text = allExercise.list[exerciseNumber].prompt
            
            countdownTimer.setTimer(minutes: 0, seconds: allExercise.list[exerciseNumber].goTime)
            progressBar.setProgressBar(minutes: 0, seconds: allExercise.list[exerciseNumber].goTime)
           
           
   updateUI()
        }
    }
    func updateUI(){
         if typeWork.text == "Warm Up" {
            self.NumExercise.text = "1 Of 1"
        }
        else if typeWork.text == "Exercise" {
            
            NumExercise.text = "\(allExercise.list[exerciseNumber].Num + 1) Of \(7)"
        }
        else if typeWork.text == "Rest" {
           
            NumExercise.text = "\(allExercise.list[exerciseNumber].Num + 1) Of \(7)"
        }
         else if typeWork.text == "Cool Down" {
            self.NumExercise.text = "1 Of 1"
        }
        //NumExercise.text = "\(exerciseNumber + 1)/\(allExercise.list.count)"
        
       
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
    




