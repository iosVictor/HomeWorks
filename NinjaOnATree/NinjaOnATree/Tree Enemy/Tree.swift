//
//  Tree.swift
//  NinjaOnATree
//
//  Created by Victor Kimpel on 27.07.22.
//

import Foundation
import SpriteKit

class Tree: SKSpriteNode {
    
    let WALL_WIDTH: CGFloat = 80.0
    let WALL_HEIGHT: CGFloat = 80.0
    let WALL_COLOR = UIColor.clear
    
    init() {
        let enemyImage = UIImage(named: "tree")
        let texture = SKTexture(image: enemyImage!)
        let size = CGSize(width: WALL_WIDTH, height: WALL_HEIGHT)
        super.init(texture: texture, color: WALL_COLOR, size: size)
        loadPhysicsBodyWithSize(size: size)
        startMoving()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = treeCategory
        physicsBody?.affectedByGravity = false
        physicsBody?.contactTestBitMask = heroCategory
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveBy(x: -kDefaultXToMovePerSecond, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
}
