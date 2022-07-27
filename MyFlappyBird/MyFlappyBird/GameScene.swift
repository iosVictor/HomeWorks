//
//  GameScene.swift
//  MyFlappyBird
//
//  Created by Victor Kimpel on 26.07.22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var backgroundNode: SKNode!
    var birdNode: SKSpriteNode!
    var gameOverLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        backgroundNode = self.childNode(withName: "background")!
        birdNode = self.childNode(withName: "bird") as! SKSpriteNode
        gameOverLabel = self.childNode(withName: "gameOverLabel") as! SKLabelNode
        
        gameOverLabel.alpha = 0
        
        self.physicsWorld.contactDelegate = self
        
        let moveBackground = SKAction.move(by: CGVector(dx: -1500, dy: 0), duration: 10)
//        run(SKAction.repeatForever(moveBackground))
        
        backgroundNode.run(moveBackground)
      
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 2))
    }
    func stopGame() {
        backgroundNode.removeAllActions()
        birdNode.physicsBody!.pinned = true
        gameOverLabel.run(SKAction.fadeIn(withDuration: 0.5))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
}
