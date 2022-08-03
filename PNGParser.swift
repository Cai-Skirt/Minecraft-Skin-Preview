import SwiftUI

func SkinParser(sourceUrl: URL) -> UnsafePointer<UInt8> {
    var skin = UIImage(named: "download")
    
    do {
        skin = try UIImage(data: Data(contentsOf: sourceUrl))
    } catch{
        
    }
    let pixels = CFDataGetBytePtr(skin!.cgImage!.dataProvider!.data! as CFData)
    return pixels!
}
