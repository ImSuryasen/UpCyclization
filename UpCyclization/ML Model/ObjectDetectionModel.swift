//
//  ObjectDetectionModel.swift
//  UpCyclization
//
//  Created by Suryasen on 30/01/24.
//

import SwiftUI
import CoreML

struct ObjectDetectionModel: View {
    @State private var selectedImage: UIImage?
    @State private var resultText: String = "Select Image"

    var body: some View {
        VStack {
            Image(uiImage: selectedImage ?? UIImage(systemName: "photo")!)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .onTapGesture
                {
                    self.didTapImage()
                }

            Text(resultText)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("SelectedImageChanged"), object: nil, queue: .main) { notification in
                if let newImage = notification.userInfo?["newImage"] as? UIImage {
                    analyzeImage(image: newImage)
                }
            }
        }
        .sheet(isPresented: .constant(true)) {
            ImagePicker(selectedImage: self.$selectedImage, resultText: self.$resultText)
        }

//        .onAppear {
//            // Additional setup if needed
//        }
//        .sheet(isPresented: .constant(true)) {
//            ImagePicker(selectedImage: self.$selectedImage, resultText: self.$resultText)
//        }
        .onChange(of: selectedImage) { newImage in
            analyzeImage(image: newImage)
        }

    }

    private func analyzeImage(image: UIImage?) {
        guard let buffer = image?.resize(size: CGSize(width: 224, height: 224))?
                .getCVPixelBuffer() else {
            return
        }

        do {
            let config = MLModelConfiguration()
            let model = try Resnet50(configuration: config)
            let input = Resnet50Input(image: buffer)

            let output = try model.prediction(input: input)
            let text = output.classLabel
            resultText = text
        } catch {
            print(error.localizedDescription)
        }
    }

    private func didTapImage() {
        // Open image picker
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ObjectDetectionModel()
//    }
//}

#Preview {
    ObjectDetectionModel()
}
