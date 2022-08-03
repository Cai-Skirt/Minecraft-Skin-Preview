import SwiftUI
import SpriteKit

class PreviewScene: SKScene {
    init(size: CGSize, sourceUrl: URL) {
        super.init(size: size)
        scaleMode = .aspectFit
        backgroundColor = UIColor.darkGray
        var skinTexture = SKTexture(imageNamed: "empty")
        do {
            skinTexture = try SKTexture(image: UIImage(data: Data(contentsOf: sourceUrl))!)
        } catch{
            
        }
        skinTexture.filteringMode = .nearest
        let skin = SKSpriteNode(texture: skinTexture)
        skin.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(skin)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
