import SwiftUI
import SceneKit

class CubeNode: SCNNode {
    func setUpFrontPlane(width: Int, height: Int, size: CGFloat, BeginX: CGFloat, BeginY: CGFloat, Z:  CGFloat, sourceBeginX: Int, sourceBeginY: Int, source: UnsafePointer<UInt8>){
        for x in 0...width - 1 {
            for y in 0...height - 1 {
                let newNode = ColoredPalneNode(size: size, x: x, y: y, sourceBeginX: sourceBeginX, sourceBeginY: sourceBeginY, source: source)
                
                newNode.position.x = Float(BeginX + Double(x) * size + size / 2)
                newNode.position.y = Float(BeginY - Double(y) * size - size / 2)
                newNode.position.z = Float(Z)
                
                self.addChildNode(newNode)
            }
        }
    }
    
    func setUpBackPlane(width: Int, height: Int, size: CGFloat, BeginX: CGFloat, BeginY: CGFloat, Z:  CGFloat, sourceBeginX: Int, sourceBeginY: Int, source: UnsafePointer<UInt8>){
        for x in 0...width - 1 {
            for y in 0...height - 1 {
                let newNode = ColoredPalneNode(size: size, x: x, y: y, sourceBeginX: sourceBeginX, sourceBeginY: sourceBeginY, source: source)
                
                newNode.position.x = Float(BeginX - Double(x) * size - size / 2) 
                newNode.position.y = Float(BeginY - Double(y) * size - size / 2)
                newNode.position.z = Float(Z)
                
                newNode.eulerAngles.x = Float.pi
                self.addChildNode(newNode)
            }
        }
    }
    
    func setUpRightPlane(length: Int, height: Int, size: CGFloat,X: CGFloat, BeginY: CGFloat, BeginZ:  CGFloat, sourceBeginX: Int, sourceBeginY: Int, source: UnsafePointer<UInt8>){
        for x in 0...length - 1 {
            for y in 0...height - 1 {
                let newNode = ColoredPalneNode(size: size, x: x, y: y, sourceBeginX: sourceBeginX, sourceBeginY: sourceBeginY, source: source)
                
                newNode.position.x = Float(X)
                newNode.position.y = Float(BeginY - Double(y) * size - size / 2)
                newNode.position.z = Float(BeginZ + Double(x) * size + size / 2)
                
                newNode.eulerAngles.y = -Float.pi / 2
                self.addChildNode(newNode)
            }
        }
    }
    
    func setUpLeftPlane(length: Int, height: Int, size: CGFloat,X: CGFloat, BeginY: CGFloat, BeginZ:  CGFloat, sourceBeginX: Int, sourceBeginY: Int, source: UnsafePointer<UInt8>){
        for x in 0...length - 1 {
            for y in 0...height - 1 {
                let newNode = ColoredPalneNode(size: size, x: x, y: y, sourceBeginX: sourceBeginX, sourceBeginY: sourceBeginY, source: source)
                
                newNode.position.x = Float(X)
                newNode.position.y = Float(BeginY - Double(y) * size - size / 2)
                newNode.position.z = Float(BeginZ - Double(x) * size - size / 2)
                
                newNode.eulerAngles.y = Float.pi / 2
                self.addChildNode(newNode)
            }
        }
    }
    
    func setUpTopPlane(width: Int, length: Int, size: CGFloat, BeginX: CGFloat, Y: CGFloat, BeginZ:  CGFloat, sourceBeginX: Int, sourceBeginY: Int, source: UnsafePointer<UInt8>){
        for x in 0...width - 1 {
            for y in 0...length - 1 {
                let newNode = ColoredPalneNode(size: size, x: x, y: y, sourceBeginX: sourceBeginX, sourceBeginY: sourceBeginY, source: source)
                
                newNode.position.x = Float(BeginX + Double(x) * size + size / 2)
                newNode.position.y = Float(Y)
                newNode.position.z = Float(BeginZ + Double(y) * size + size / 2)
                
                newNode.eulerAngles.x = -Float.pi / 2
                
                self.addChildNode(newNode)
            }
        }
    }
    
    func setUpBottomPlane(width: Int, length: Int, size: CGFloat, BeginX: CGFloat, Y: CGFloat, BeginZ:  CGFloat, sourceBeginX: Int, sourceBeginY: Int, source: UnsafePointer<UInt8>){
        for x in 0...width - 1 {
            for y in 0...length - 1 {
                let newNode = ColoredPalneNode(size: size, x: x, y: y, sourceBeginX: sourceBeginX, sourceBeginY: sourceBeginY, source: source)
                
                newNode.position.x = Float(BeginX - Double(x) * size - size / 2)
                newNode.position.y = Float(Y)
                newNode.position.z = Float(BeginZ + Double(y) * size + size / 2)
                
                newNode.eulerAngles.x = Float.pi / 2
                
                self.addChildNode(newNode)
            }
        }
    }
    
    init(width: Int, length: Int, height: Int, size: CGFloat, centerX: CGFloat, centerY: CGFloat, centerZ:  CGFloat, sourceBeginX: Int, sourceBeginY: Int, source: UnsafePointer<UInt8>) {
        super.init()
        
        setUpFrontPlane(width: width, height: height, size: size, BeginX: centerX - Double(width) * size / 2, BeginY: centerY + Double(height) * size / 2, Z: centerZ + Double(length) * size / 2, sourceBeginX: sourceBeginX + length, sourceBeginY: sourceBeginY + length, source: source)
        
        setUpBackPlane(width: width, height: height, size: size, BeginX: centerX + Double(width) * size / 2, BeginY: centerY + Double(height) * size / 2, Z: centerZ - Double(length) * size / 2, sourceBeginX: sourceBeginX + length + width + length, sourceBeginY: sourceBeginY + length, source: source)
        
        setUpRightPlane(length: length, height: height, size: size, X: centerX - Double(width) * size / 2, BeginY: centerY + Double(height) * size / 2, BeginZ: centerZ - Double(length) * size / 2, sourceBeginX: sourceBeginX, sourceBeginY: sourceBeginY + length, source: source)
        
        setUpLeftPlane(length: length, height: height, size: size, X: centerX + Double(width) * size / 2, BeginY: centerY + Double(height) * size / 2, BeginZ: centerZ + Double(length) * size / 2, sourceBeginX: sourceBeginX + length + width, sourceBeginY: sourceBeginY + length, source: source)
        
        setUpTopPlane(width: width, length: length, size: size, BeginX: centerX - Double(width) * size / 2, Y: centerY + Double(height) * size / 2, BeginZ: centerZ - Double(length) * size / 2, sourceBeginX: sourceBeginX + length, sourceBeginY: sourceBeginY, source: source)
        
        setUpBottomPlane(width: width, length: length, size: size, BeginX: centerX + Double(width) * size / 2, Y:centerY + -Double(height) * size / 2, BeginZ: centerZ - Double(length) * size / 2, sourceBeginX: sourceBeginX + length + width, sourceBeginY: sourceBeginY, source: source)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
