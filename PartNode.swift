import SwiftUI
import SceneKit

class PartNode: SCNNode {
    init(width: Int, length: Int, height: Int, centerX: CGFloat, centerY: CGFloat, centerZ:  CGFloat, sourceBeginX: Int, sourceBeginY: Int, sourceOuterBeginX: Int, sourceOuterBeginY: Int, source: UnsafePointer<UInt8>) {
        super.init()
        
        let Node = CubeNode(width: width, length: length, height: height, size: 1, centerX: centerX, centerY: centerY, centerZ: centerZ, sourceBeginX: sourceBeginX, sourceBeginY: sourceBeginY, source: source)
        addChildNode(Node)
        
        let OuterNode = CubeNode(width: width, length: length, height: height, size: 1.2, centerX: centerX, centerY: centerY, centerZ: centerZ, sourceBeginX: sourceOuterBeginX, sourceBeginY: sourceOuterBeginY, source: source)
        addChildNode(OuterNode)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
