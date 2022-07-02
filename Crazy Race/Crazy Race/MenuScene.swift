//
//  MenuScene.swift
//  Crazy Race
//
//  Created by Victor Kimpel on 1.07.22.
//

import Foundation
import SpriteKit

class MenuScene: SKScene {
    var startGame = SKLabelNode()
    var scoreLabel = SKLabelNode()
    var gameSettings = Settings.sharedInstance
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        startGame = self.childNode(withName: "startGame") as! SKLabelNode
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        scoreLabel.text = "Score: \(gameSettings.highScore)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "startGame" {
                let gameScene = SKScene(fileNamed: "GameScene")!
                gameScene.scaleMode = .aspectFill
                view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }
        }
    }
}
