import SwiftUI
import SceneKit
import SpriteKit

struct ContentView: View {
    @State var filePicker = false
    @State var sourceUrl: URL = URL(fileURLWithPath: "")
    @State var skinScene: mySCNScene = mySCNScene()
    @State var got = false
    var body: some View {
        HStack{
            SceneView(scene:skinScene)
            VStack{
                Button("Select Skin") {
                    filePicker.toggle()
                }
                .fileImporter(isPresented: $filePicker, allowedContentTypes: [.png]) { result in
                    do{
                        sourceUrl = try result.get()
                        skinScene = mySCNScene(sourceUrl: sourceUrl)
                        got.toggle()
                    } catch{
                        
                    }
                }
                SpriteView(scene: PreviewScene(size: CGSize(width: 64, height: 64), sourceUrl: sourceUrl))
                    .aspectRatio(contentMode: .fit)
                ControlView(cemareNode: $skinScene.cameraNode)
            }
        }

    }
}
