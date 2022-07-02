//
//  Support.swift
//  Crazy Race
//
//  Created by Victor Kimpel on 1.07.22.
//


import Foundation
import UIKit

struct ColliderType {
    
    static let CAR_COLLIDER: UInt32 = 0
    static let ITEM_COLLIDER: UInt32 = 1
    static let ITEM_COLLIDER_1: UInt32 = 2
}

class Helper: NSObject {
    
    func randomBetweenTwoNumbers(firstNumber: CGFloat, secondNumber: CGFloat, thirdNumber: CGFloat, fourthNumber: CGFloat) -> CGFloat {
        return CGFloat(arc4random())/CGFloat(UINT32_MAX) * abs(firstNumber - secondNumber + thirdNumber - fourthNumber) + min(firstNumber, secondNumber, thirdNumber, fourthNumber)
    }
}

class Settings {
    static let sharedInstance = Settings()
    private init() {
        
    }
    var highScore = 0
}
