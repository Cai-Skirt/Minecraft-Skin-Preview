import SwiftUI
import SceneKit

struct ControlView: View {
    @Binding var cemareNode: SCNNode
    var body: some View {
        HStack{
            Spacer()
            VStack{
                HStack{
                    Text("前后")
                    Slider(value: $cemareNode.position.z, in: -40...40)
                }
                HStack{
                    Text("左右")
                    Slider(value: $cemareNode.position.x, in: -20...20)
                }
                HStack{
                    Text("上下")
                    Slider(value: $cemareNode.position.y, in: -40...15)
                }
            }
            Spacer()
            VStack{
                HStack{
                    Text("抬头")
                    Slider(value: $cemareNode.eulerAngles.x, in: -Float.pi...Float.pi)
                }
                HStack{
                    Text("摇头")
                    Slider(value: $cemareNode.eulerAngles.y, in: -Float.pi...Float.pi)
                }
            }
            Spacer()
        }
    }
}
