import SwiftUI
import SceneKit

class ColoredPalneNode: SCNNode {
    init(size: CGFloat, x: Int, y: Int, sourceBeginX: Int, sourceBeginY: Int, source: UnsafePointer<UInt8>) {
        super.init()
        
        let newPlane = SCNPlane(width: size, height: size)
        
         let pixelInSkin = (sourceBeginY + y) * 64 + x + sourceBeginX
         let red: CGFloat = CGFloat(source[pixelInSkin * 4]) / CGFloat(255.0)
         let green: CGFloat = CGFloat(source[pixelInSkin * 4 + 1]) / CGFloat(255.0)
         let blue: CGFloat = CGFloat(source[pixelInSkin * 4 + 2]) / CGFloat(255.0)
         let alpha: CGFloat = CGFloat(source[pixelInSkin * 4 + 3]) / CGFloat(255.0)
        
        newPlane.firstMaterial?.diffuse.contents = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        newPlane.firstMaterial?.isDoubleSided = true
        self.geometry = newPlane
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
