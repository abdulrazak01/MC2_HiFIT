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
    var Num: Int
    var Status: String = ""
    var animation: String

    
    init(image : String, WorkText: String, promptText: String, typeText: String, timer: String, goTimer: Int, Numb: Int, animationName : String, Statuss: String){

        
        workoutImage = image
        exercise = WorkText
        prompt = promptText
        typeExercise = typeText
        time = timer
        goTime = goTimer
        Num = Numb
        Status = Statuss
        animation = animationName
    }

}
