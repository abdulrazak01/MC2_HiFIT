//
//  ViewController.swift
//  HiFIT
//
//  Created by Abdul Razak on 2020-05-11.
//  Copyright © 2020 Abdul Razak. All rights reserved.
//



import Foundation

class workout {
    var workoutImage: String = ""
    var exercise: String = ""
    var prompt: String = ""
    var typeExercise: String = ""
    var time: String = ""
    var goTime: Int
    
    
    init(image : String, WorkText: String, promptText: String, typeText: String, timerr: String, goTimer: Int){
        
        workoutImage = image
        exercise = WorkText
        prompt = promptText
        typeExercise = typeText
        time = timerr
        goTime = goTimer
        
    }

}
