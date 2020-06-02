//
//  ViewController.swift
//  HiFIT
//
//  Created by Abdul Razak on 2020-05-11.
//  Copyright © 2020 Abdul Razak. All rights reserved.
//


import Foundation

let warmUpDuration:Int = 20    // Default: 30
let exerciseDuration:Int = 20
let restDuration:Int = 30      // Beginnner Default: 40
let coolDownDuration:Int = 20  // Default: 30

class ArrayWork{
    var list = [workout]()
    
    init(){
        // MARK: - Neck Mobility
        list.append(workout(image: "pushup", WorkText: "Neck Mobility", promptText:
            "1. Tuck chin into chest, lift chin upward as far as possible 2. Repeat for 10 seconds 3. Lower left ear towards left shoulder and then the other side. 4. Repeat for 10 seconds 5. Turn your chin laterally towards left shoulder and rotate towards right shoulder 6. Repeat till end of duration", typeText: "Warm Up", timer: "\(warmUpDuration)", goTimer: warmUpDuration, Numb: 1, animationName: "NeckMobility", Statuss: "On"))
        
        // MARK: - Jumping Jacks
        list.append(workout(image: "jump", WorkText: "Jumping Jacks", promptText:
            "1. Stand with legs straight and arm by your sides 2. Jump up and spread feet beyond hip-width apart 3. Bring arms above head 4. Jump again, lower arm, bring legs together 5. Return to starting position", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 0, animationName: "Jumping Jack",  Statuss: "On"))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 0, animationName: "Rest",  Statuss: "On"))
        
        // MARK: - Push Up
        list.append(workout(image: "situp", WorkText: "Push Up", promptText:
            "1. Hands on the floor 2. Shoulder width apart 3. Engage your core 4. Exhale when lowering your chest 5. Inhale when push back up 6. Maintain flat back", typeText: "Exercise", timer: "\(coolDownDuration)", goTimer: coolDownDuration, Numb: 1, animationName: "Push Ups",  Statuss: "Off"))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 1, animationName: "Rest", Statuss: "Off"))
        
        // MARK: - Plank
        list.append(workout(image: "situp", WorkText: "Plank", promptText:
            "1. Get into a push up position 2. Keep palms and toes on ground 3. Keep back straight, core muscles tight 4. Don’t let your head or back sag towards the floors 5. Hold plank throughout the duration", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer:exerciseDuration, Numb: 2, animationName: "Plank", Statuss: "Off"))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 2, animationName: "Rest", Statuss: "Off"))
        
        // MARK: - Air Swimming
        list.append(workout(image: "situp", WorkText: "Air Swimming", promptText:
            "1. Lie on stomach with arms extended 2. Lift chest, arms and legs 3. Squeeze your glutes 4. Flutter arms and legs while not touching the floor", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 3, animationName: "Air Swimming", Statuss: "Off"))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 3, animationName: "Rest", Statuss: "Off"))
        
        // MARK: - Jump Squat
        list.append(workout(image: "situp", WorkText: "Jump Squat", promptText:
            "1. Stand with feet shoulder-width apart 2. Toes slightly turned out, hands in front of chest 3. When lowering, engage core, chest lifted and flat back 4. Maintain posture and jump as high as you can 5. Swinging arms down by your sides for momentum 6. Land softly, avoid knees from moving inwards", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 4, animationName: "Jump Squat", Statuss: "Off"))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 4, animationName: "Rest", Statuss: "Off"))
        
        // MARK: - Half Push Up
        list.append(workout(image: "situp", WorkText: "Half Push Up", promptText:
            "1. Hands on the floor 2. Shoulder width apart 3. Knees on floor 4. Exhale when lowering your chest 5. Inhale when push back up", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 5, animationName: "Half Push Ups", Statuss: "Off"))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 5, animationName: "Rest", Statuss: "Off"))
        
        // MARK: - Pike Push Up
        list.append(workout(image: "situp", WorkText: "Pike Push Up", promptText:
            "1. Get into a push up position 2. Form a triangle by raising your glutes and moving feet inwards 3. Bend elbows and lower your shoulder to the ground 4. Allow forehead to very lightly contact the ground 5. Push upwards and back to starting position", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 6, animationName: "Pike Push Ups", Statuss: "Off"))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 6, animationName: "Rest", Statuss: "Off"))
        
        // MARK: - Shoulder Stretch
        list.append(workout(image: "situp", WorkText: "Shoulder Stretch", promptText:
            "1. Feet slightly wider than shoulder width apart 2. Knees slightly bent 3. Place right arm parallel to the ground across your chest 4. Bend left arm up and use forearm to ease right arm 5. Closer to chest", typeText: "Cool Down", timer: "\(coolDownDuration)", goTimer: coolDownDuration, Numb: 1, animationName: "Shoulder Stretch", Statuss: "Off"))
    }
}
