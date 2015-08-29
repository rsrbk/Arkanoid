//
//  ChooseLevelScene.swift
//  Arcanoid
//
//  Created by Руслан on 05.12.14.
//  Copyright (c) 2014 Руслан. All rights reserved.
//

import UIKit
import SpriteKit

class ChooseLevelScene: SKScene {
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed: "mback.jpg");
        background.position = CGPoint(x:size.width, y:size.height);
        addChild(background);
        
        let first = SKLabelNode(text: "1");
        first.fontSize = 200;
        first.position = CGPoint(x:size.width*0.25, y:size.height/2);
        addChild(first);
        
        let firstLabel = SKLabelNode(text: "level");
        firstLabel.fontSize = 40;
        firstLabel.position = CGPoint(x:size.width*0.25+15, y:size.height/2-50);
        addChild(firstLabel);
        
        let second = SKLabelNode(text: "2");
        second.fontSize = 200;
        second.position = CGPoint(x:size.width*0.75, y:size.height/2);
        addChild(second);
        
        let secondLabel = SKLabelNode(text: "level");
        secondLabel.fontSize = 40;
        secondLabel.position = CGPoint(x:size.width*0.75, y:size.height/2-50);
        addChild(secondLabel);
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch;
        let touchL = touch.locationInNode(self);
        
        if(touchL.x > size.width*0.25-25 && touchL.x < size.width*0.25+50 && touchL.y < size.height/2+140 && touchL.y > size.height/2 - 50) {
            let scene = TransToFirstLevel(size: CGSize(width: size.width, height: size.height))
            scene.scaleMode = .AspectFill;
            self.view?.presentScene(scene);
        }
        else if(touchL.x > size.width*0.75-50 && touchL.x < size.width*0.75+50 && touchL.y < size.height/2+140 && touchL.y > size.height/2 - 50) {
            let scene = TransToSecondLevel(size: CGSize(width: size.width, height: size.height))
            scene.scaleMode = .AspectFill;
            self.view?.presentScene(scene);
        }
    }
}
