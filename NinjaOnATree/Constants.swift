//
//  Constants.swift
//  NinjaOnATree
//
//  Created by Victor Kimpel on 26.07.22.
//

import Foundation
import UIKit


// Configuration
let kMLGroundHeight: CGFloat = 20.0

// Initial Variables
let kDefaultXToMovePerSecond: CGFloat = 320.0

// Collision Detection
let heroCategory: UInt32 = 0x1 << 0
let enemyCategory: UInt32 = 0x1 << 1
let treeCategory: UInt32 = 0x1 << 2
