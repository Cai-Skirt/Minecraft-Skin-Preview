import SwiftUI
import SceneKit

class mySCNScene : SCNScene{
    var cameraNode = SCNNode()
    
    override init() {
        super.init()
        let emptyPanel = SCNBox(width: 8, height: 8, length: 8, chamferRadius: 0)
        emptyPanel.firstMaterial?.diffuse.contents = UIImage(named: "empty")
        let node = SCNNode(geometry: emptyPanel)
        node.position = SCNVector3(0, -10, 0)
        rootNode.addChildNode(node)
        
        let camera = SCNCamera()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, -10, 40)
        rootNode.addChildNode(cameraNode)
    }
    
    init(sourceUrl: URL) {
        super.init()
        
        background.contents = UIColor.darkGray
        
        let source = SkinParser(sourceUrl: sourceUrl)
        
        let head = PartNode(width: 8, length: 8, height: 8, centerX: 0, centerY: 0, centerZ: 0, sourceBeginX: 0, sourceBeginY: 0, sourceOuterBeginX: 4 * 8, sourceOuterBeginY: 0, source: source)
        rootNode.addChildNode(head)

        let body = PartNode(width: 8, length: 4, height: 12, centerX: 0, centerY: -6 - 4, centerZ: 0, sourceBeginX: 8 * 2, sourceBeginY: 16, sourceOuterBeginX: 8 * 2, sourceOuterBeginY: 8 * 2 + 4 + 12, source: source)
        rootNode.addChildNode(body)
        
        let leftArm = PartNode(width: 3, length: 4, height: 12, centerX: 4 + 1.5, centerY: -6 - 4, centerZ: 0, sourceBeginX: 4 * 8, sourceBeginY: 64 - 12 - 4, sourceOuterBeginX: 4 * 8 + 2 * 7 + 2, sourceOuterBeginY: 64 - 12 - 4, source: source)
        rootNode.addChildNode(leftArm)
        
        let rightArm = PartNode(width: 3, length: 4, height: 12, centerX: -4 - 1.5, centerY: -6 - 4, centerZ: 0, sourceBeginX: 5 * 8, sourceBeginY: 8 * 2, sourceOuterBeginX: 5 * 8, sourceOuterBeginY: 8 * 2 + 4 + 12, source: source)
        rootNode.addChildNode(rightArm)
        
        let leftLeg = PartNode(width: 4, length: 4, height: 12, centerX: 2, centerY: -4 - 12 - 6, centerZ: 0, sourceBeginX: 4 * 4, sourceBeginY: 64 - 12 - 4, sourceOuterBeginX: 0, sourceOuterBeginY: 64 - 12 - 4, source: source)
        rootNode.addChildNode(leftLeg)
        
        let rightLeg = PartNode(width: 4, length: 4, height: 12, centerX: -2, centerY: -4 - 12 - 6, centerZ: 0, sourceBeginX: 0, sourceBeginY: 16, sourceOuterBeginX: 0, sourceOuterBeginY: 16 + 4 + 12, source: source)
        rootNode.addChildNode(rightLeg)
        
        let camera = SCNCamera()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, -10, 40)
        rootNode.addChildNode(cameraNode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
