//
//  GameScene.swift
//  Ninja-Punch
//
//  Created by Beetu on 27/8/2015.
//  Copyright (c) 2015 Brijrajsinh Gohil. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var shadow: SKNode!
    var lowerTorso: SKNode!
    var upperTorso: SKNode!
    var upperArmFront: SKNode!
    var lowerArmFront: SKNode!
    var fistFront: SKNode!
  
  override func didMoveToView(view: SKView) {
    upperTorso = lowerTorso.childNodeWithName("torso_upper")
    upperArmFront = upperTorso.childNodeWithName("arm_upper_front")
    lowerArmFront = upperArmFront.childNodeWithName("arm_lower_front")
    fistFront = lowerArmFront.childNodeWithName("fist_front")

    lowerTorso = childNodeWithName("torso_lower")
    lowerTorso.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) - 30)
    
    shadow = childNodeWithName("shadow")
    shadow.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) - 100)
   
  }
    
    
    
    func punchAtLocation(location: CGPoint) {
        // 1
        let punch = SKAction.reachTo(location, rootNode: upperArmFront, duration: 0.1)
        // 2
        fistFront.runAction(punch)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            punchAtLocation(location)
        }
    }
}
