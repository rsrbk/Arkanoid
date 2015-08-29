//
//  TransToSecondLevel.swift
//  Arcanoid
//
//  Created by Руслан on 05.12.14.
//  Copyright (c) 2014 Руслан. All rights reserved.
//

import UIKit
import SpriteKit

class TransToSecondLevel: SKScene {
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed: "backgnd4");
        background.position = CGPoint(x:size.width/2, y:size.height/2);
        addChild(background);
        
        let label = SKLabelNode(text: "Level 2");
        label.fontSize = 82;
        label.position = CGPoint(x:size.width/2, y:size.height/2+100);
        addChild(label);
        
        let label1 = SKLabelNode(text: "tap to start");
        label1.fontSize = 55;
        label1.position = CGPoint(x:size.width/2, y:size.height/2);
        addChild(label1);
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let scene = SecondLevelScene(size: CGSize(width: size.width, height: size.height));
        scene.scaleMode = .AspectFill;
        self.view?.presentScene(scene);
    }
}