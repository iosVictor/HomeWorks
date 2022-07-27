//  MLCloudGenerator.swift
//  NinjaOnATree
//
//  Created by Victor Kimpel on 26.07.22.

import Foundation
import SpriteKit

class MLCloudGenerator: SKSpriteNode {
    
    let CLOUD_WIDTH: CGFloat = 125.0
    let CLOUD_HEIGHT: CGFloat = 55.0
    
    var generationTimer: Timer!
    
    func populate(num: Int) {
        var i = 0
        if i < num {
            i += 1
            let cloud = MLCloud(size: CGSize(width: CLOUD_WIDTH, height: CLOUD_HEIGHT))
            let x = CGFloat(arc4random_uniform(UInt32(size.width))) - size.width / 2
            let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height / 2
            cloud.position = CGPoint(x: x, y: y)
            cloud.zPosition = -1
            addChild(cloud)
        }
    }
    
    func startGeneratingWithSpawnTime(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generateCloud), userInfo: nil, repeats: true)
    }
    
    func stopGenerating() {
        generationTimer.invalidate()
    }
    
    @objc func generateCloud() {
        let x = size.width / 2 + CLOUD_WIDTH / 2
        let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height / 2
        let cloud = MLCloud(size: CGSize(width: CLOUD_WIDTH, height: CLOUD_HEIGHT))
        cloud.position = CGPoint(x: x, y: y)
        cloud.zPosition = -1
        addChild(cloud)
    }
}
