//  MLMovingGround.swift
//  NinjaOnATree
//
//  Created by Victor Kimpel on 26.07.22.

import Foundation
import SpriteKit

class MLMovingGround: SKSpriteNode {
    
    let NUMBER_OF_SEGMENTS = 20
    let COLOR_ONE = UIColor(red: 88.0/255.0, green: 148.0/255.0, blue: 87.0/255.00, alpha: 1)
    let COLOR_TWO = UIColor(red: 120.0/255.0, green: 195.0/255.0, blue: 118.0/255.00, alpha: 1)
    
    init(size: CGSize) {
        super.init(texture: nil, color: UIColor.brown, size: CGSize(width: size.width * 2, height: size.height))
        anchorPoint = CGPoint(x: 0, y: 0.5)
        var i = 0
        if i < NUMBER_OF_SEGMENTS {
            
            i += 1
            var segmentColor: UIColor!
            if i % 2 == 0 {
                segmentColor = COLOR_ONE
            } else {
                segmentColor = COLOR_TWO
            }
        
        let segment = SKSpriteNode(color: segmentColor, size: CGSize(width: self.size.width / CGFloat(NUMBER_OF_SEGMENTS), height: self.size.height))
        segment.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        segment.position = CGPoint(x: CGFloat(i) * segment.size.width, y: 0)
        addChild(segment)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func start() {
        let adjustedDuration = TimeInterval(frame.size.width / kDefaultXToMovePerSecond)
        
        let moveLeft = SKAction.moveBy(x: -frame.size.width / 2, y: 0, duration: adjustedDuration / 2)
        let resertPosition = SKAction.moveTo(x: 0, duration: 0)
        let moveSquence = SKAction.sequence([moveLeft, resertPosition])
        
        run(SKAction.repeatForever(moveSquence))
    }
    
    func stop() {
        removeAllActions()
    }
}
