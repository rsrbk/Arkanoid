//
//  GameScene.swift
//  Arcanoid
//
//  Created by Руслан on 04.12.14.
//  Copyright (c) 2014 Руслан. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed: "mback.jpg");
        background.position = CGPoint(x:size.width, y:size.height);
        addChild(background);
        
        let start = SKLabelNode(text: "New game");
        start.fontSize = 69;
        start.position = CGPoint(x:size.width/2, y:size.height/2+(69*0.625));
        addChild(start);
        
        let choose = SKLabelNode(text: "Choose level");
        choose.fontSize = 69;
        choose.position = CGPoint(x:size.width/2, y:size.height/2-(69*0.625));
        addChild(choose);
    }

    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch;
        let touchL = touch.locationInNode(self);
    
        if(touchL.x > size.width/2-150 && touchL.x < size.width/2+150 && touchL.y < size.height/2+69 && touchL.y > size.height/2 + (69*0.625)/2) {
            
            let scene = TransToFirstLevel(size: CGSize(width: size.width, height: size.height))
            scene.scaleMode = .AspectFill;
            self.view?.presentScene(scene);
            
        }
        else if(touchL.x > size.width/2-150 && touchL.x < size.width/2+150 && touchL.y < size.height/2 && touchL.y > size.height/2 + (69*0.3125) - 69) {
            let scene = ChooseLevelScene(size: CGSize(width: size.width, height: size.height))
            scene.scaleMode = .AspectFill;
            self.view?.presentScene(scene);
        }
    }
    
}
