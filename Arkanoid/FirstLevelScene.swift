//
//  FirstLevelScene.swift
//  Arcanoid
//
//  Created by Руслан on 05.12.14.
//  Copyright (c) 2014 Руслан. All rights reserved.
//

import UIKit
import SpriteKit

class FirstLevelScene: TemplateLevelScene {
    
    override func didMoveToView(view: SKView) {
        categories.knocked = 0;
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        self.physicsWorld.contactDelegate = self;
        
        let background = SKSpriteNode(imageNamed: "backgnd5");
        background.position = CGPoint(x:size.width/2, y:size.height/2);
        addChild(background);
        
        let border = SKPhysicsBody(edgeLoopFromRect: CGRect(x: CGFloat(0), y: CGFloat(0), width: self.frame.size.width, height: CGFloat(UInt(self.frame.size.height) - 95)));
        
        let ball = SKSpriteNode(imageNamed: "ballBlue");
        ball.position = CGPoint(x:(size.width/2)-50, y:200);
        ball.name = "ball";
        addChild(ball);
        
        let paddle = SKSpriteNode(imageNamed: "paddleRed");
        paddle.position = CGPoint(x: size.width/2, y: size.height*0.2);
        addChild(paddle);
        
        let bottom = SKNode();
        addChild(bottom);
        let bottomRect = CGRectMake(self.frame.origin.x, self.frame.origin.x, self.frame.width, 1);
        var blocks: [SKSpriteNode] = [];
        for i in 0...37 {
            blocks.append(SKSpriteNode(imageNamed: "rectRed"));
            blocks[i].name = "block";
            blocks[i].physicsBody = SKPhysicsBody(rectangleOfSize: blocks[i].size);
            blocks[i].physicsBody?.allowsRotation = false;
            blocks[i].physicsBody?.dynamic = false;
            blocks[i].physicsBody?.friction = 0;
            blocks[i].physicsBody?.restitution = 1;
            blocks[i].physicsBody?.categoryBitMask = categories.block;
        }
        for i in 0...14 {
            var startX : uint = uint(blocks[i].size.width);
            var posX : uint = startX + (uint(i) * uint(blocks[i].size.width));
            var posY: uint = (uint(i) % 2) * uint(blocks[i].size.height);
            blocks[i].position = CGPoint(x:CGFloat(posX), y:size.height - 130 - CGFloat(posY));
            addChild(blocks[i]);
        }
        for i in 15...29 {
            var startX : uint = uint(blocks[i].size.width);
            var posX : uint = startX + (uint(i-15) * uint(blocks[i].size.width));
            var posY: uint = (1 - (uint(i) % 2)) * uint(blocks[i].size.height) + (2 * uint(blocks[i].size.height));
            blocks[i].position = CGPoint(x:CGFloat(posX), y:size.height - 130 - CGFloat(posY));
            addChild(blocks[i]);
        }
        for i in 30...37 {
            var startX : uint = uint(blocks[i].size.width);
            var posX : uint = startX + (uint(i-30) * 2 * uint(blocks[i].size.width));
            var posY: uint = 4 * uint(blocks[i].size.height);
            blocks[i].position = CGPoint(x:CGFloat(posX), y:size.height - 130 - CGFloat(posY));
            addChild(blocks[i]);
        }
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2);
        ball.physicsBody?.friction = 0;
        ball.physicsBody?.restitution = 1;
        ball.physicsBody?.linearDamping = 0;
        ball.physicsBody?.dynamic = true;
        ball.physicsBody?.allowsRotation = false;
        ball.physicsBody?.applyImpulse(CGVectorMake(1, 2));
        ball.physicsBody?.categoryBitMask = categories.ball;
        ball.physicsBody?.contactTestBitMask = categories.bottom | categories.block;
        
        paddle.physicsBody = SKPhysicsBody(rectangleOfSize: paddle.size);
        paddle.physicsBody?.categoryBitMask = categories.paddle;
        paddle.name = "paddle";
        paddle.physicsBody?.friction = 0.4;
        paddle.physicsBody?.restitution = 0.1;
        paddle.physicsBody?.linearDamping = 0;
        paddle.physicsBody?.dynamic = false;
        paddle.physicsBody?.allowsRotation = false;
        paddle.physicsBody?.categoryBitMask = categories.paddle;
        
        bottom.physicsBody = SKPhysicsBody(edgeLoopFromRect: bottomRect);
        bottom.physicsBody?.categoryBitMask = categories.bottom;
        
        self.physicsBody = border;
        self.physicsBody?.friction = 1;
        self.physicsBody?.restitution = 1;
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        var first: SKPhysicsBody;
        var second: SKPhysicsBody;
        
        if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
            first = contact.bodyB;
            second = contact.bodyA;
        } else {
            first = contact.bodyA;
            second = contact.bodyB;
        }
        
        if (first.categoryBitMask == categories.ball && second.categoryBitMask == categories.bottom) {
            let scene = SKEndScene(size: CGSize(width: size.width, height: size.height))
            scene.scaleMode = .AspectFill;
            self.view?.presentScene(scene);
        }
        else if(first.categoryBitMask == categories.ball && second.categoryBitMask == categories.block) {
            second.node?.removeFromParent();
            categories.knocked++;
            if(categories.knocked == categories.firstBlocksCount) {
                let scene = TransToSecondLevel(size: CGSize(width: size.width, height: size.height))
                scene.scaleMode = .AspectFill;
                self.view?.presentScene(scene);
            }
        }
    }
}
