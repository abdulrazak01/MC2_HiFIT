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
    @IBOutlet weak var skip: UIButton!
    
    @IBOutlet weak var promptWork: UILabel!
    @IBOutlet weak var typeWork: UILabel!
    
    @IBOutlet weak var animationView: AnimationView!
    
    let allExercise = ArrayWork()   // Import list of exercises
    var exerciseNumber: Int = 0
    
    weak var delegate: ViewController!
    var countdownTimerDidStart = false
    
    lazy var countdownTimer: CountdownTimer = {
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    var selectedSecs = 0
    let speechSynthesizer = AVSpeechSynthesizer()
    var skipToResult:Bool = false
    var speechIsStopped:Bool = false
    
    
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
    
    let speechService = SpeechService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        stopBtn.isEnabled = true
        speechSynthesizer.delegate = self
        updateExercise()
        updateUI()
        countdownTimer.delegate = self
        stopBtn.isEnabled = true
        counterView.isHidden = false
        
        buttonStyle(button: stopBtn, borderColor: #colorLiteral(red: 0.6784313725, green: 0.01568627451, blue: 0.07058823529, alpha: 1), startGradientColor: #colorLiteral(red: 0.8549019608, green: 0.1882352941, blue: 0.3058823529, alpha: 1), endGradientColor: #colorLiteral(red: 0.7764705882, green: 0.1098039216, blue: 0.2, alpha: 1))
        buttonStyle(button: startBtn, borderColor: #colorLiteral(red: 0.3320430013, green: 0.7472464243, blue: 0.07450980392, alpha: 1), startGradientColor: #colorLiteral(red: 0.537254902, green: 0.7882352941, blue: 0.1921568627, alpha: 1), endGradientColor: #colorLiteral(red: 0.3294117647, green: 0.6117647059, blue: 0.07058823529, alpha: 1))
        stopBtn.titleLabel?.adjustsFontForContentSizeCategory = true
        startBtn.titleLabel?.adjustsFontForContentSizeCategory = true
        skip.titleLabel?.adjustsFontForContentSizeCategory = true
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
        stopBtn.isEnabled = true
        countdownTimerDidStart = false
        startBtn.setTitle("Start",for: .normal)
        exerciseNumber += 1
        updateExercise()
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        stopBtn.isEnabled = true
        
        // MARK: Exercise Start
        
        if !countdownTimerDidStart {
            countdownTimer.start()
            progressBar.start()
            countdownTimerDidStart = true
            startBtn.setTitle("Pause",for: .normal)
            
            
            
            speechSynthesizer.continueSpeaking()
            
            
            animationView.play()
            
            
        } else{
            countdownTimer.pause()
            progressBar.pause()
            countdownTimerDidStart = false
            animationView.pause()
            startBtn.setTitle("Resume",for: .normal)
            
            speechSynthesizer.pauseSpeaking(at: .immediate)
            speechSynthesizer.pauseSpeaking(at: .word)
            
            if self.speechSynthesizer.isSpeaking{
                speechSynthesizer.pauseSpeaking(at: .immediate)
            }
            
            //  if startBtn.titleLabel?.text as Any as! String == "Resume" {
            
            
            
            //}
        }
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        //start()
        promptWork.text = utterance.speechString
        
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.speechSynthesizer.pauseSpeaking(at: .immediate)
        self.speechSynthesizer.pauseSpeaking(at: .word)
        
        
    }
    
    func start() {
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.pauseSpeaking(at: .immediate)
            speechSynthesizer.pauseSpeaking(at: .word)
            
            
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
                
                
                
                speechUtterance.rate = 0.45
                speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                self.speechSynthesizer.speak(speechUtterance)
                
                
                
                count += 1
                if  count == filteredPromptArray.count-0 || self.skipToResult || self.speechSynthesizer.isPaused  {
                    t.invalidate()
                    
                    if self.speechSynthesizer.isPaused {
//                        count == count
                        Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {t in
                            let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: filteredPromptArray[count])
                            
                            self.speechSynthesizer.speak(speechUtterance)
                            count += 1
                            
                            if count == filteredPromptArray.count-0  || self.skipToResult  || self.speechSynthesizer.isPaused {
                                t.invalidate()}
                        })
                        
                    }
                }
                
                
                
                
            })
        }
    }
    
    @IBAction func NumberExer(_ sender: Any) {
        exerciseNumber += 1
        updateExercise()
        
    }
    
    func updateExercise(){
        if exerciseNumber <= allExercise.list.count - 1{
            // MARK: Change Exercise Image
            
            imageWorkout.image = UIImage(named:(allExercise.list[exerciseNumber].workoutImage))
            titleWork.text = allExercise.list[exerciseNumber].exercise
            typeWork.text = allExercise.list[exerciseNumber].typeExercise
            
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
            // start()
            startTimer(startBtn)
            
            start()
            
            // startTimer(startBtn)
            
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
    }
    
    @IBAction func skipToResult(_ sender: AnyObject) {
        countdownTimer.stop()
        progressBar.stop()
        countdownTimerDidStart = false
        // FIXME: Not Working
        
        
        self.speechSynthesizer.pauseSpeaking(at: .immediate)
        
        // speechSynthesizer.stopSpeaking(at: .immediate)
        skipToResult = true
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        display()
        
        countdownTimer.stop()
        progressBar.stop()
        countdownTimerDidStart = false
        stopBtn.isEnabled = false
        stopBtn.alpha = 0.5
        // startBtn.setTitle("START",for: .normal)
        
        self.speechSynthesizer.pauseSpeaking(at: .immediate)
        // FIXME: Not Working
        
        
        
        
        // speechSynthesizer.stopSpeaking(at: .immediate)
        startBtn.setTitle("Resume",for: .normal)
        // speechService.stop()
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
