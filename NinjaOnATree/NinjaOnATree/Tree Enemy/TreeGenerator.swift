//
//  TreeGenerator.swift
//  NinjaOnATree
//
//  Created by Victor Kimpel on 27.07.22.
//

import Foundation
import SpriteKit

class TreeGenerator: SKSpriteNode {
    
    var generationTimer: Timer?
    var trees = [Tree]()
    var treeTrackers = [Tree]()
    
    func startGeneratingTreeEvery(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generateTree), userInfo: nil, repeats: true)
        
    }
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    @objc func generateTree() {
        var scale: CGFloat
        let rand = arc4random_uniform(2)
        if rand == 0 {
            scale = 1.0
        } else {
            scale = 1.0
        }
        
        let tree = Tree()
        tree.position.x = size.width / 2 + tree.size.width / 2
        tree.position.y = scale * (kMLGroundHeight / 2 + tree.size.height / 2)
        trees.append(tree)
        treeTrackers.append(tree)
        addChild(tree)
    }
    
    func stopTrees() {
        stopGenerating()
        for tree in trees {
            tree.stopMoving()
        }
    }
}
