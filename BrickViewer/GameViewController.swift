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
		scene.rootNode.addChildNode(cameraNode)
		
		// place the camera
		cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
		
		// create and add a light to the scene
		let lightNode = SCNNode()
		lightNode.light = SCNLight()
		lightNode.light!.type = .omni
		lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
		scene.rootNode.addChildNode(lightNode)
		
		// create and add an ambient light to the scene
		let ambientLightNode = SCNNode()
		ambientLightNode.light = SCNLight()
		ambientLightNode.light!.type = .ambient
		ambientLightNode.light!.color = NSColor.darkGray
		scene.rootNode.addChildNode(ambientLightNode)
		
		// retrieve the ship node
//    let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
		
		// animate the 3d object
//    ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
		
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
      try LDColourManager.shared.load(from: URL(fileURLWithPath: "/Users/swhitehead/Downloads/ldraw/LDConfig.ldr"))
      
      let pathPrefix = URL(fileURLWithPath: "/Users/swhitehead/Downloads/ldraw")
      let partPath = "parts/3005.dat"
      print("Read \(partPath) from \(pathPrefix)")
      
      let part = try Part(pathPrefix: pathPrefix, source: partPath)
      let model = buildModel(from: part)
      scene.rootNode.addChildNode(model)

    } catch let error {
      print(error)
    }
	}
  
  func buildModel(from part: Part) -> SCNNode {
    let parentNode = SCNNode()
    let commands = part.commands
    parentNode.addChildNode(makeNode(from: commands))
    return parentNode
  }
  
  func makeNode(from commands: [Command]) -> SCNNode {
    let parentNode = SCNNode()
    for command in commands {
      guard let node = makeNode(from: command) else {
        continue
      }
      parentNode.addChildNode(node)
    }
    return parentNode
  }
  
  func makeNode(from command: Command) -> SCNNode? {
    if let command = command as? CommentCommand {
      log(debug: "command.bfc = \(command.bfc)")
    } else if let command = command as? LineCommand {
      return SCNNode(geometry: command.geometry)
    } else if let command = command as? TriangleCommand {
      return SCNNode(geometry: command.geometry)
    } else if let command = command as? QuadrilateralCommand {
      return SCNNode(geometry: command.geometry)
    } else if let command = command as? SubFileCommand {
      return makeNode(from: command.commands)
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
