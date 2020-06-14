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
import Lottie

class ViewController: UIViewController, CountdownTimerDelegate,AVSpeechSynthesizerDelegate{
    
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
    
    @IBOutlet weak var workT: UITextField!
    @IBOutlet weak var typeT: UITextField!
    @IBOutlet weak var promptWork: UILabel!
    @IBOutlet weak var typeWork: UILabel!
    
    //public var completion: ((String, String) -> Void)?
    
    @IBOutlet weak var animationView: AnimationView!
    
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    
    
    let allExercise = ArrayWork()   // Import list of exercises
    var exerciseNumber: Int = 0
    //var list = [workout]()
    
    @IBAction func shareButton(_ sender: Any) {
        
        
    }
    weak var delegate: ViewController!
    var countdownTimerDidStart = false
    
    
    lazy var countdownTimer: CountdownTimer = {
        
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    
    
    
    var selectedSecs = 0
    let speechSynthesizer = AVSpeechSynthesizer()
    var skipToResult:Bool = false
    
    
    
    fileprivate func buttonStyle(button: UIButton, borderColor: CGColor, startGradientColor: UIColor, endGradientColor: UIColor) {
        button.layer.backgroundColor = UIColor.systemBackground.cgColor // resets Storyboard Button Color to SystemBackgroundColor
        
        let border = CALayer()
        border.frame = button.layer.bounds
        border.cornerRadius = 42
        border.backgroundColor = UIColor.systemBackground.cgColor
        border.borderColor = borderColor
        border.borderWidth = 1
        button.layer.insertSublayer(border, at: 0)
        
        let gradient = CAGradientLayer()
        gradient.cornerRadius = 39
        gradient.frame = CGRect(x: 3, y: 3, width: 78, height: 78)
        gradient.colors = [ startGradientColor.cgColor, endGradientColor.cgColor ]
        button.layer.insertSublayer(gradient, at: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //startNow()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        stopBtn.isEnabled = true
        speechSynthesizer.delegate = self
        
        //workT.delegate = self
        //typeT.delegate = self
        updateExercise()
        updateUI()
        countdownTimer.delegate = self
        
        
        
        stopBtn.isEnabled = true
        // Rojak version was set to false, maybe need to change 
        // stopBtn.isEnabled = false		
        //        stopBtn.alpha = 0.5
        
        
        
        counterView.isHidden = false
        
        buttonStyle(button: redBtn, borderColor: #colorLiteral(red: 0.7607843137, green: 0, blue: 0.06666666667, alpha: 1), startGradientColor: #colorLiteral(red: 1, green: 0.4, blue: 0.5019607843, alpha: 1), endGradientColor: #colorLiteral(red: 0.9019607843, green: 0.02745098039, blue: 0.1019607843, alpha: 1))
        buttonStyle(button: greenBtn, borderColor: #colorLiteral(red: 0.4862745098, green: 0.7294117647, blue: 0.262745098, alpha: 1), startGradientColor: #colorLiteral(red: 0.6039215686, green: 0.8784313725, blue: 0.2274509804, alpha: 1), endGradientColor: #colorLiteral(red: 0.3333333333, green: 0.6, blue: 0.09019607843, alpha: 1))
        
    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    class speech{
        
    
    }
    
    
    func countdownTime(time: (minutes: String, seconds: String)) {
        
        minutes.text = time.minutes
        seconds.text = time.seconds
        
    }
    
    func display(){
        /* if let workText = workT.text , !workText.isEmpty ,
         let typeText = typeT.text, !typeText.isEmpty{
         
         
         //completion?(workText,typeText)
         
         
         
         }*/
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "Result") as! Result
        present(secondVc, animated: true)
    }
    
    func countdownTimerDone() {
        
        //display()
        //counterView.isHidden = true
        //messageLabel.isHidden = false
        stopBtn.isEnabled = true
        
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
        
        
       
        
        stopBtn.isEnabled = true
        
        
        // MARK: Exercise Start
        if !countdownTimerDidStart {
            countdownTimer.start()
            progressBar.start()
            countdownTimerDidStart = true
            startBtn.setTitle("Pause",for: .normal)
            start()
          
            if speechSynthesizer.isPaused {
                 speechSynthesizer.continueSpeaking()
            }
            
        } else{
            countdownTimer.pause()
            progressBar.pause()
            countdownTimerDidStart = false
            
            startBtn.setTitle("Resume",for: .normal)
        pauses()
       
        //if startBtn.titleLabel?.text as Any as! String == "Resume" {
           
         
        
       // }
    }
        
        }
    
    func pauses() {
         speechSynthesizer.pauseSpeaking(at: .immediate)
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        
       
    }
   
    func start() {
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.pauseSpeaking(at: .immediate)
            
        }
    
        else {
            let promptString = allExercise.list[exerciseNumber].prompt
            let promptArray = promptString.split(usingRegex: #"\d+\.\s+|\n"#)   // removes numbered list and whitespace
            
            var filteredPromptArray: [String] = []  // generate array consist of individual prompts
            for item in promptArray {
                if item != ""{
                    filteredPromptArray.append(item)
                }
                if allExercise.list[exerciseNumber].typeExercise == "Rest" {
                    filteredPromptArray.append("Rest for \(allExercise.list[exerciseNumber].goTime) seconds")
                    filteredPromptArray.append(item)
                }
            }
            
            // Display Exercise Prompt Individually
            var count = 0
            
            // Initialise voice
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {t in
                self.promptWork.text = filteredPromptArray[count]
                
                // Voice Prompt
                // TODO: What to do if audio didn't finish instruction and exercise completed
                
                let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: filteredPromptArray[count])
                DispatchQueue.main.async {
                    speechUtterance.rate = 0.45
                    speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    self.speechSynthesizer.speak(speechUtterance)
                }
                
                
                count += 1
                
                if count == filteredPromptArray.count-1 || self.skipToResult {
                    t.invalidate()
                    
                }
            })
           
        }
    }
    @IBAction func NumberExer(_ sender: Any) {
        
        
        exerciseNumber += 1
        updateExercise()
        
    }
    
    public func prompt() {
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
                filteredPromptArray.append("Rest for \(allExercise.list[exerciseNumber].goTime) seconds")
                filteredPromptArray.append(item)
            }
        }
        
        // Display Exercise Prompt Individually
        var count = 0
        
        // Initialise voice
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {t in
            self.promptWork.text = filteredPromptArray[count]
            
            // Voice Prompt
            // TODO: What to do if audio didn't finish instruction and exercise completed
            
            let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: filteredPromptArray[count])
            
            speechUtterance.rate = 0.45
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            self.speechSynthesizer.speak(speechUtterance)
            
            count += 1
            
            if count == filteredPromptArray.count-1 || self.speechSynthesizer.isPaused || self.skipToResult {
                t.invalidate()
            }
        })
    }
    
    func updateExercise(){
        
        
        if exerciseNumber <= allExercise.list.count - 1{
            // MARK: Change Exercise Image
            
            imageWorkout.image = UIImage(named:(allExercise.list[exerciseNumber].workoutImage))
            titleWork.text = allExercise.list[exerciseNumber].exercise
            typeWork.text = allExercise.list[exerciseNumber].typeExercise
            //            promptWork.text = allExercise.list[exerciseNumber].prompt
            
            let animation = Animation.named(allExercise.list[exerciseNumber].animation)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.animationSpeed = 1
            animationView.play()
            
            // Countdown Timer
            
            countdownTimer.setTimer(minutes: 0, seconds: allExercise.list[exerciseNumber].goTime)
            progressBar.setProgressBar(minutes: 0, seconds: allExercise.list[exerciseNumber].goTime)
            //self.list[exerciseNumber].self.Status = "On"
            
            
            
            //workT.text = allExercise.list[exerciseNumber].exercise
            //typeT.text = allExercise.list[exerciseNumber].typeExercise
            
            startTimer(startBtn)
            
            
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
    @IBAction func skipToResult(_ sender: AnyObject) {
        countdownTimer.stop()
        progressBar.stop()
        countdownTimerDidStart = false
        speechSynthesizer.stopSpeaking(at: .immediate)  // FIXME: Not Working
        skipToResult = true
        
    }
    
    
    @IBAction func stopTimer(_ sender: UIButton) {
        display()
        
        countdownTimer.stop()
        progressBar.stop()
        countdownTimerDidStart = false
        stopBtn.isEnabled = false
        stopBtn.alpha = 0.5
        startBtn.setTitle("START",for: .normal)
        speechSynthesizer.stopSpeaking(at: .immediate)
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
