//
//  ViewController.swift
//  HiFIT
//
//  Created by Abdul Razak on 2020-05-11.
//  Copyright © 2020 Abdul Razak. All rights reserved.
//


import Foundation

let warmUpDuration:Int = 30
let exerciseDuration:Int = 20
let restDuration:Int = 40
let coolDownDuration:Int = 30

class ArrayWork{
    
    var list = [workout]()
    
    init(){
        list.append(workout(image: "pushup", WorkText: "Neck Mobility", promptText:
            "1. Tuck chin into chest, lift chin upward as far as possible 2. Repeat for 10 seconds 3. Lower left ear towards left shoulder and then the other side. 4. Repeat for 10 seconds 5. Turn your chin laterally towards left shoulder and rotate towards right shoulder 6. Repeat till end of duration", typeText: "Warm Up", timer: "\(warmUpDuration)", goTimer: warmUpDuration, Numb: 1))
        
        list.append(workout(image: "jump", WorkText: "Arm Swings", promptText:
            "1. Feet slightly wider than shoulder-width apart 2. Knees slightly bent 3. Swing both arms continuously to an overhead position 4. Then forward, down and back 5. Repeat for 15 seconds 6. Swing both arms to sides then cross them in front of chest 7. Repeat for 15 seconds", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 0))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 0))
        
        list.append(workout(image: "situp", WorkText: "Side Bends", promptText:
            "1. Feet slightly wider than shoulder-width apart 2. Knees slightly bent, hands resting on hips 3. Bend to one side, avoid leaning front or back 4. Return to upright position 5. Repeat other side 6. Maintain a slow rhythm for 30 seconds", typeText: "Exercise", timer: "\(coolDownDuration)", goTimer: coolDownDuration, Numb: 1))
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 1))
        
        list.append(workout(image: "situp", WorkText: "Hip Circles", promptText:
            "1. Hands on hips, feet wider than shoulders 2. Rotate your hips in clockwise direction for 15 seconds 3. Rotate your hips in the other direction for 15 seconds", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer:exerciseDuration, Numb: 2))
        
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 2))
        
        list.append(workout(image: "situp", WorkText: "Hip Twists", promptText:
            "1. Extend arms to sides 2. Twist torso and hips to left, shift weight to left foot 3. Turn body to right, shift weight to right foot 4. Repeat for 30 seconds", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 3))
        
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 3))
        
        list.append(workout(image: "situp", WorkText: "Half Squat", promptText:
            "1. Hold hands in front of your for balance 2. Bend knees till thighs 45 degrees from the floor 3. Keep back straight and look to the front 4. Knees pointed same direction with toes 5. At lowest point, straighten legs to return to starting position 6. Repeat in a smooth and controlled rhythm 7. Breath in as you descent, breath out as your rise 8. Repeat for the whole duration", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 4))
        
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 4))
        
        list.append(workout(image: "situp", WorkText: "Reverse Lunge with Left Leg", promptText:
            "1. Stand with feet shoulder-width apart 2. Step your left foot behind bending your knees 3. Push through the heel of left foot to stand up 4. Repea", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 5))
        
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 5))
        
        list.append(workout(image: "situp", WorkText: "Reverse Lunge with Right Leg", promptText:
            "1. Stand with feet shoulder-width apart 2. Step your right foot behind bending your knees 3. Push through the heel of right foot to stand up 4. Repeat", typeText: "Exercise", timer: "\(exerciseDuration)", goTimer: exerciseDuration, Numb: 6))
        
        list.append(workout(image: "situp", WorkText: "Rest", promptText:
            "", typeText: "Rest", timer: "\(restDuration)", goTimer: restDuration, Numb: 6))
        
        list.append(workout(image: "situp", WorkText: "Shoulder Circles", promptText:
            "", typeText: "Cool Down", timer: "\(coolDownDuration)", goTimer: coolDownDuration, Numb: 1))
    }
}
