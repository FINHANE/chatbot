//
//  BotSMS.swift
//  Message Bot
//
//  Created by Dnhane on 2023/8/27.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "hey there!"
    } else if tempMessage.contains("how are you?") {
        return "Im a fine, how about you?"
        
    } else if tempMessage.contains("fine thank"){
        return "awesome!"
    }
    else if tempMessage.contains("I'am in need of help"){
        return "how may I help you?"
        
    } else if tempMessage.contains("Thanks") {
        return "No Problem, Glad I could Help."
    } else {
        
        return "Anything else reach out"
//        No problem, glad I could help
        
    }
}
