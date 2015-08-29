//
//  GameScene.swift
//  Arcanoid
//
//  Created by Руслан on 04.12.14.
//  Copyright (c) 2014 Руслан. All rights reserved.
//

import SpriteKit

struct categories {
    static let block : UInt32 = 0x1 << 0;
    static let bottom : UInt32 = 0x1 << 1;
    static let ball : UInt32 = 0x1 << 2;
    static let paddle : UInt32 = 0x1 << 3;
    static let border : UInt32 = 0x1 << 4;
    static var knocked = 0;
    static var firstBlocksCount = 38;
    static var secondBlocksCount = 60;
}

class TemplateLevelScene: SKScene, SKPhysicsContactDelegate {
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch;
        let touchLoc = touch.locationInNode(self);
        
        let paddle = self.childNodeWithName("paddle");
        if(touchLoc.x>75 && touchLoc.x<size.width-55) {
            paddle?.position.x = touchLoc.x;
        }
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        let ball = self.childNodeWithName("ball");
        var dx = ball?.physicsBody?.velocity.dx;
        var dy = ball?.physicsBody?.velocity.dy;
        
        while sqrt(dx!*dx! + dy!*dy!) < 400 {
            dx = CGFloat(1.2 * dx!);
            dy = CGFloat(1.2 * dy!);
        }
        
        ball?.physicsBody?.velocity.dx = dx!;
        ball?.physicsBody?.velocity.dy = dy!;
    }
}
