import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

extension Image {
    func getDominantColor(completion: @escaping (Color) -> Void) {
        guard let uiImage = self.asUIImage() else {
            completion(.gray)
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let ciImage = CIImage(image: uiImage)
            let filter = CIFilter(name: "CIAreaAverage")!
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            let extent = ciImage!.extent
            filter.setValue(CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height), forKey: kCIInputExtentKey)
            
            let outputImage = filter.outputImage!
            var bitmap = [UInt8](repeating: 0, count: 4)
            let context = CIContext(options: [.workingColorSpace: kCFNull!])
            context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
            
            let red = Double(bitmap[0]) / 255.0
            let green = Double(bitmap[1]) / 255.0
            let blue = Double(bitmap[2]) / 255.0
            
            DispatchQueue.main.async {
                completion(Color(red: red, green: green, blue: blue))
            }
        }
    }
    
    // Helper function to convert SwiftUI Image to UIImage
    func asUIImage() -> UIImage? {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

extension Color {
    func isLight() -> Bool {
        let components = self.cgColor?.components ?? [0, 0, 0]
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return brightness > 0.5
    }
    
    func contrastingColor() -> Color {
        return self.isLight() ? .black : .white
    }
    
    func darker(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: -1 * abs(percentage))
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> Color {
        guard let components = self.cgColor?.components else { return self }
        let red = components[0] * 255
        let green = components[1] * 255
        let blue = components[2] * 255
        return Color(
            red: Double(min(red + percentage, 255.0)) / 255.0,
            green: Double(min(green + percentage, 255.0)) / 255.0,
            blue: Double(min(blue + percentage, 255.0)) / 255.0
        )
    }
}
