//
//  GameViewController.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 29/1/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import SceneKit
import QuartzCore
import LDrawKit
import LogWrapperKit

class GameViewController: NSViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
    
		// create a new scene
    let scene = SCNScene()
//      SCNScene(named: "art.scnassets/ship.scn")!
		
		// create and add a camera to the scene
		let cameraNode = SCNNode()
		cameraNode.camera = SCNCamera()
//		cameraNode.scale = SCNVector3(1, -1, 1)
		scene.rootNode.addChildNode(cameraNode)
		
		
		// place the camera
		cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
		
		// create and add a light to the scene
		let lightNode = SCNNode()
		lightNode.light = SCNLight()
		lightNode.light!.type = .omni
		lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
//		scene.rootNode.addChildNode(lightNode)

		let spotLight = SCNNode()
		spotLight.light = SCNLight()
		spotLight.light!.type = .spot
		spotLight.light!.spotInnerAngle = 0;
		spotLight.light!.spotOuterAngle = 45;
		spotLight.light!.shadowRadius = 10.0;
		spotLight.light!.zFar = 10000;
		spotLight.light!.color = CGColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
		spotLight.light!.shadowColor = CGColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
		spotLight.light!.castsShadow = true;
		spotLight.position = SCNVector3(x: 5, y: 5, z: -5);
		scene.rootNode.addChildNode(spotLight)
		
		// create and add an ambient light to the scene
		let ambientLightNode = SCNNode()
		ambientLightNode.light = SCNLight()
		ambientLightNode.light!.type = .ambient
		ambientLightNode.light!.color = NSColor.darkGray
		scene.rootNode.addChildNode(ambientLightNode)
		
//		// retrieve the ship node
//    let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
//
//		// animate the 3d object
//    ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
//
		// retrieve the SCNView
		let scnView = self.view as! SCNView
		
		// set the scene to the view
		scnView.scene = scene
		
		// allows the user to manipulate the camera
		scnView.allowsCameraControl = true
		
		// show statistics such as fps and timing information
		scnView.showsStatistics = true
		
		// configure the view
		scnView.backgroundColor = NSColor.black
		
		// Add a click gesture recognizer
		let clickGesture = NSClickGestureRecognizer(target: self, action: #selector(handleClick(_:)))
		var gestureRecognizers = scnView.gestureRecognizers
		gestureRecognizers.insert(clickGesture, at: 0)
		scnView.gestureRecognizers = gestureRecognizers
		
		
//    let line = SCNGeometry.lineFrom(vector: SCNVector3Make(0, 0, 0), toVector: SCNVector3Make(10, 10, 10))
//    let node = SCNNode(geometry: line)
//    scene.rootNode.addChildNode(node)

    do {
      try LDColourManager.shared.load()
//
      let partPath = "parts/3005.dat"
//			let partPath = "box5.dat"
//			let partPath = "stud.dat"
//			let partPath = "4-4disc.dat"
//
//			let partPath = "box.dat"
			var part = try PartParser(partName: partPath).parse()

//			let part = SimplePart()
//			part.commands.append(
//				DefaultQuadrilateralCommand(text: "text", colour: basicColor, points: [
//					DefaultPoint3D(x: 1, y: 1, z: 1),
//					DefaultPoint3D(x: 1, y: 1, z: -1),
//					DefaultPoint3D(x: -1, y: 1, z: -1),
//					DefaultPoint3D(x: -1, y: 1, z: 1),
//					]))
//
//			part.commands.append(
//				DefaultQuadrilateralCommand(text: "text", colour: basicColor, points: [
//					DefaultPoint3D(x: -1, y: -1, z: -1),
//					DefaultPoint3D(x: 1, y: -1, z: -1),
//					DefaultPoint3D(x: 1, y: -1, z: 1),
//					DefaultPoint3D(x: -1, y: -1, z: 1),
//					]))
//
//			part.commands.append(
//				DefaultQuadrilateralCommand(text: "text", colour: basicColor, points: [
//					DefaultPoint3D(x: -1, y: -1, z: 1),
//					DefaultPoint3D(x: 1, y: -1, z: 1),
//					DefaultPoint3D(x: 1, y: 1, z: 1),
//					DefaultPoint3D(x: -1, y: 1, z: 1),
//					]))
//
//			part.commands.append(
//				DefaultQuadrilateralCommand(text: "text", colour: basicColor, points: [
//					DefaultPoint3D(x: -1, y: -1, z: -1),
//					DefaultPoint3D(x: -1, y: -1, z: 1),
//					DefaultPoint3D(x: -1, y: 1, z: 1),
//					DefaultPoint3D(x: -1, y: 1, z: -1),
//					]))
//
//			part.commands.append(
//				DefaultQuadrilateralCommand(text: "text", colour: basicColor, points: [
//					DefaultPoint3D(x: 1, y: -1, z: -1),
//					DefaultPoint3D(x: -1, y: -1, z: -1),
//					DefaultPoint3D(x: -1, y: 1, z: -1),
//					DefaultPoint3D(x: 1, y: 1, z: -1),
//					]))
//
//			part.commands.append(
//				DefaultQuadrilateralCommand(text: "text", colour: basicColor, points: [
//					DefaultPoint3D(x: 1, y: -1, z: 1),
//					DefaultPoint3D(x: 1, y: -1, z: -1),
//					DefaultPoint3D(x: 1, y: 1, z: -1),
//					DefaultPoint3D(x: 1, y: 1, z: 1),
//					]))
			
//			let inverted = part.inverted()

//			dump(part: part)
//			dump(part: inverted)
      let model = buildModel(from: part)
			
			model.rotation = SCNVector4Make(0, 0, 0.5, CGFloat(180.0).degreesToRadians)
			
			scene.rootNode.castsShadow = true
      scene.rootNode.addChildNode(model)
			
			spotLight.constraints = [SCNLookAtConstraint(target: model)]
			
			
			let plane = SCNBox(width: 100, height: 1, length: 40, chamferRadius: 10)
			plane.firstMaterial?.diffuse.contents = CGColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
			let planeNode = SCNNode(geometry: plane)
			planeNode.position = SCNVector3(x: 0, y: -10,  z: 0);
			planeNode.castsShadow = true;
			scene.rootNode.addChildNode(planeNode);
    } catch let error {
      print(error)
    }
	}
	
//	func dump(part: Part) {
//		log(debug: "----------")
//		dump(commands: part.commands)
//	}
//
//	func dump(commands: [Command]) {
//		for command in commands {
//			//			if let command = command as? MultiPointCommand {
//			log(debug: "\(command)")
////			if let command = command as? SubFileCommand {
//				dump(commands: command.commands);
//			}
//			//			}
//		}
//	}
	
  func buildModel(from part: Part) -> SCNNode {
    let parentNode = SCNNode()
    let commands = part.commands
    parentNode.addChildNode(makeNode(from: commands))
		parentNode.castsShadow = true
    return parentNode
  }
  
  func makeNode(from commands: [Command]) -> SCNNode {
    let parentNode = SCNNode()
    for command in commands {
      guard let node = makeNode(from: command) else {
        continue
      }
			node.castsShadow = true
      parentNode.addChildNode(node)
    }
    return parentNode
  }
	
	var invertNext: Bool = false
	
  func makeNode(from command: Command) -> SCNNode? {
    if let command = command as? CommentCommand {
			log(debug: "command.bfc = \(String(describing: command.bfc))")
			guard let bfc = command.bfc else {
				return nil
			}
			invertNext = bfc == .invertNext
			return nil
		}
		if let command = command as? LineCommand {
			let geo = command.geometry(invertNext: invertNext)
			invertNext = false
      return SCNNode(geometry: geo)
    } else if let command = command as? TriangleCommand {
			let geo = command.geometry(invertNext: invertNext)
			invertNext = false
			return SCNNode(geometry: geo)
    } else if let command = command as? QuadrilateralCommand {
			let geo = command.geometry(invertNext: invertNext)
			invertNext = false
			return SCNNode(geometry: geo)
    } else if let command = command as? SubFileCommand {
			let commands = invertNext ? command.inverted().commands : command.commands
			let node: SCNNode = makeNode(from: commands)
			invertNext = false
			node.transform = command.transformation
			node.position = command.vector3(from: command.location)
			return node
    }
    return nil
  }
	
	@objc
	func handleClick(_ gestureRecognizer: NSGestureRecognizer) {
		// retrieve the SCNView
		let scnView = self.view as! SCNView
		
		// check what nodes are clicked
		let p = gestureRecognizer.location(in: scnView)
		let hitResults = scnView.hitTest(p, options: [:])
		// check that we clicked on at least one object
		if hitResults.count > 0 {
			// retrieved the first clicked object
			let result = hitResults[0]
			
			// get its material
			let material = result.node.geometry!.firstMaterial!
			
			// highlight it
			SCNTransaction.begin()
			SCNTransaction.animationDuration = 0.5
			
			// on completion - unhighlight
			SCNTransaction.completionBlock = {
				SCNTransaction.begin()
				SCNTransaction.animationDuration = 0.5
				
				material.emission.contents = NSColor.black
				
				SCNTransaction.commit()
			}
			
			material.emission.contents = NSColor.red
			
			SCNTransaction.commit()
		}
	}
}
