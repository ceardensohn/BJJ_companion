//
//  DrillScene.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/9/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import SpriteKit
private let movableNodeName = "movable"

class DrillScene: SKScene {
    
    var selectedNode = SKShapeNode()
    var background = SKSpriteNode()
    var shoulder = SKShapeNode()
    var handL = SKShapeNode()
    var midArmL = SKShapeNode()
    var upperArmL = SKShapeNode()
    var body = SKShapeNode()
    var elbow = SKShapeNode()
    var wrist = SKShapeNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        
        //shapes
        body = SKShapeNode(rect: CGRect(x: (size.width/2)-35, y: (size.height/2)-75, width: 70, height: 150))
        upperArmL = SKShapeNode(rect: CGRect(x: -10, y: -100, width: 20, height: 100))
        midArmL = SKShapeNode(rect: CGRect(x: -10, y: -100, width: 20, height: 100))
        handL = SKShapeNode(circleOfRadius: 25)
        handL.name = movableNodeName
        shoulder = SKShapeNode(circleOfRadius: 5)
        elbow = SKShapeNode(circleOfRadius: 5)
        wrist = SKShapeNode(circleOfRadius: 5)
        
        
        //joints
        let shoulderJointPos = shoulder.position
        let shoulderJoint = SKPhysicsJointPin.joint(withBodyA: body.physicsBody!, bodyB: upperArmL.physicsBody!, anchor: shoulderJointPos)
        scene?.physicsWorld.add(shoulderJoint)
        
        
        background = SKSpriteNode(color: .gray, size: size)
        background.name = "background"
        background.anchorPoint = CGPoint.zero
        addChild(background)
        
        background.addChild(body)
        body.addChild(shoulder)
        shoulder.addChild(upperArmL)
        upperArmL.addChild(elbow)
        elbow.addChild(midArmL)
        midArmL.addChild(wrist)
        wrist.addChild(handL)
        
        shoulder.constraints = [SKConstraint.positionX(SKRange(constantValue: (size.width/2)-35), y: SKRange(constantValue: (size.height/2)))]
        
        let positionConstraint = SKConstraint.positionY(SKRange(constantValue: -100))
        
        elbow.constraints = [positionConstraint]
        wrist.constraints = [positionConstraint]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(Double(degree) / 180.0 * .pi)
    }
    
    func selectNodeForTouch(_ touchLocation: CGPoint) {
        let touchedNode = self.atPoint(touchLocation)
        
        if touchedNode is SKShapeNode {
            if !selectedNode.isEqual(touchedNode) {
                selectedNode.removeAllActions()
                selectedNode.run(SKAction.rotate(toAngle: 0.0, duration: 0.1))
                selectedNode = touchedNode as! SKShapeNode
            }
        }
    }
    
    
    func boundLayerPos(_ aNewPosition: CGPoint) -> CGPoint {
        let winSize = self.size
        var retVal = aNewPosition
        
        retVal.x = CGFloat(min(retVal.x, 0))
        retVal.x = CGFloat(max(retVal.x, -(background.size.width) + winSize.width))
        retVal.y = self.position.y
        
        return retVal
    }
 
    
    func panForTranslation(_ translation: CGPoint) {
        let position = selectedNode.position
        
        if selectedNode.name == movableNodeName {
            //selectedNode.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
            
            let reachAction = SKAction.reach(to: translation, rootNode: shoulder, duration: 0.5)
            handL.run(reachAction)
        } else {
            let aNewPosition = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
            background.position = self.boundLayerPos(aNewPosition)
        }
    }
    
    /*
    func touchesBegan(_ touches: NSSet, with event: UIEvent) {
        let touch = touches.anyObject() as! UITouch
        let positionInScene = touch.location(in: self)
        
        selectNodeForTouch(positionInScene)
    }
    
    func touchesMoved(_ touches: NSSet, with event: UIEvent) {
        let touch = touches.anyObject() as! UITouch
        let positionInScene = touch.location(in: self)
        let previousPosition = touch.previousLocation(in: self)
        let translation = CGPoint(x: positionInScene.x - previousPosition.x, y: positionInScene.y - previousPosition.y)
        
        panForTranslation(translation)
    }
 */
    
    override func didMove(to view: SKView) {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DrillScene.handlePanFrom(recognizer:)))
        self.view!.addGestureRecognizer(gestureRecognizer)
    }
   
    @objc func handlePanFrom(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began {
            var touchLocation = recognizer.location(in: recognizer.view)
            touchLocation = self.convertPoint(fromView: touchLocation)
            self.selectNodeForTouch(touchLocation)
        } else if recognizer.state == .changed {
            var translation = recognizer.translation(in: recognizer.view!)
            translation = CGPoint(x: translation.x, y: -translation.y)
            
            self.panForTranslation(translation)
            
            recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
        } else if recognizer.state == .ended {
            if selectedNode.name != movableNodeName {
                let scrollDuration = 0.2
                let velocity = recognizer.velocity(in: recognizer.view)
                let pos = selectedNode.position
                
                let p = CGPoint(x: velocity.x * CGFloat(scrollDuration), y: velocity.y * CGFloat(scrollDuration))
                
                var newPos = CGPoint(x: pos.x + p.x, y: pos.y + p.y)
                
                newPos = self.boundLayerPos(newPos)
                selectedNode.removeAllActions()
                
                let moveTo = SKAction.move(to: newPos, duration: scrollDuration)
                moveTo.timingMode = .easeOut
                selectedNode.run(moveTo)
            }
        }
    }
}
