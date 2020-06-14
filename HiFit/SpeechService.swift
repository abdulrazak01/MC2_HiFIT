//
//  SpeechService.swift
//  HiFit
//
//  Created by Rian Rusmaldi on 12/06/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import AVFoundation
import UIKit

class SpeechService {
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    
    func say(_ phrase:String){
        
//        guard UIAccessibility.isVoiceOverRunning else {
//            return
//        }
        
        let utterenece = AVSpeechUtterance(string: phrase)
        let langCode = "en-EN".localized
        utterenece.voice = AVSpeechSynthesisVoice(language: langCode)
        speechSynthesizer.speak(utterenece)
    }
    func stop(){
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    func pause(){
        speechSynthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
    }
    func resume(){
        speechSynthesizer.continueSpeaking()
    }
}

extension String{
    var localized : String{
        return NSLocalizedString(self, comment: "")
    }
}
