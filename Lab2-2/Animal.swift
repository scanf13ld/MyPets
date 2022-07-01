//
//  Animal.swift
//  Lab2
//
//  Created by Shane Canfield on 6/29/22.
//

import Foundation
import UIKit

class Animal {
    
    var happinessLevel: Int
    var foodLevel: Int
    var timesPlayedWith: Int
    var timesFed: Int
    var nickname: String
    var name: Pets
    var bgColor: UIColor
    var image: UIImage
    
    enum Pets: String {
        case dog = "Dog"
        case cat = "Cat"
        case bird = "Bird"
        case bunny = "Bunny"
        case fish = "Fish"
    }
    
    init(name: Pets, bgColor: UIColor, image: UIImage){
        
        self.name = name
        self.bgColor = bgColor
        self.image = image
        self.nickname = "Name"
        self.happinessLevel = 0
        self.foodLevel = 0
        self.timesPlayedWith = 0
        self.timesFed = 0
        
        
    }
    
    func feedAnimal(){
        if foodLevel < 10{
            foodLevel += 1
            timesFed += 1
            //Update foodLevel, timesFed with labels
        }
    }
    func playAnimal(){
        if foodLevel > 0 {
            
            foodLevel -= 1
            timesPlayedWith += 1
            happinessLevel += 1
            //Update foodLevel, timesPlayed with labels
        }
    }
    func changeNickname(name: String){
        nickname = name
    }
    

    
}
