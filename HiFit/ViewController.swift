//
//  ViewController.swift
//  HiFIT
//
//  Created by Abdul Razak on 2020-05-11.
//  Copyright © 2020 Abdul Razak. All rights reserved.
//



import UIKit
import AVFoundation
import AudioToolbox


class ViewController: UIViewController, CountdownTimerDelegate {

    // MARK: - Outlets
    
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
    
    let allExercise = ArrayWork()   // Import list of exercises
    var exerciseNumber: Int = 0

    @IBAction func shareButton(_ sender: Any) {
        
        
    }
    
    var countdownTimerDidStart = false
    
  
    lazy var countdownTimer: CountdownTimer = {
        
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    
    

     var selectedSecs = 0
   


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)

      
     
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
    
    func display(){
                   
              
               let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                          let secondVc = storyboard.instantiateViewController(withIdentifier: "Result") as! Result
               present(secondVc, animated: true)
                
           
          
       }
    
    func countdownTimerDone() {
       display()
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
        
        // Maybe flag to start timer, hasTimerStart = true it'll continue as normal, if hadTimerStart = false, it'll change to true and timer start automatically
      
      
        counterView.isHidden = false
        
        stopBtn.isEnabled = true
        stopBtn.alpha = 1.0
        
        // MARK: Exercise Start
        if !countdownTimerDidStart {
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
        
        // MARK: - Exercise Prompts
        // Convert text prompt of type String into Array:[String]
        
        let promptString = allExercise.list[exerciseNumber].prompt
        let promptArray = promptString.split(usingRegex: #"\d+\.\s+|\n"#)   // removes numbered list and whitespace
        
        var filteredPromptArray: [String] = []  // generate array consist of individual prompts
        for item in promptArray {
            if item != ""{
                filteredPromptArray.append(item)
            }
           if allExercise.list[exerciseNumber].typeExercise == "Rest" {
                filteredPromptArray.append("Rest for 30 seconds")
            filteredPromptArray.append(item)
            }
            if allExercise.list[exerciseNumber].typeExercise == "Cool Down" {
                filteredPromptArray.append("Relax and chill")
            filteredPromptArray.append(item)
            }
        }
                
        // Display Exercise Prompt Individually
        var count = 0
        let speechSynthesizer = AVSpeechSynthesizer()   // Initialise voice
                
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {t in
            self.promptWork.text = filteredPromptArray[count]

            // Voice Prompt
            // TODO: What to do if audio didn't finish instruction and exercise completed
            
            let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: filteredPromptArray[count])
            
            speechUtterance.rate = 0.45
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechSynthesizer.speak(speechUtterance)
             
            count += 1
            
            if count == filteredPromptArray.count-1 {
                t.invalidate()
            }
        })
            
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
//            promptWork.text = allExercise.list[exerciseNumber].prompt
            

            
            // Countdown Timer
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
       // NumExercise.text = "\(exerciseNumber + 1)/\(allExercise.list.count)"
        
       
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
    

extension String {
    func split(usingRegex pattern: String) -> [String] {
        //### Crashes when you pass invalid `pattern`
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: self, range: NSRange(0..<utf16.count))
        let ranges = [startIndex..<startIndex] + matches.map{Range($0.range, in: self)!} + [endIndex..<endIndex]
        return (0...matches.count).map {String(self[ranges[$0].upperBound..<ranges[$0+1].lowerBound])}
    }
}


