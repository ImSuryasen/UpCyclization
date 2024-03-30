//
//  ScanScreen.swift
//  UpCyclization
//
//  Created by Suryasen on 15/01/24.
//MAIN FILE


import SwiftUI
import CoreML

struct UpcycleScreen: View {
    @State private var searchText = ""
    @State private var isCameraPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 75) {
                    
                    //Text View
                    Text("Plastic takes 1000 years to decompose...")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                    
                    Image("plastic-recycling")
                        .resizable()
                        .frame(width: 150, height: 155)
                        .shadow(radius: 5)
                        .padding(.top,20)
                        .padding(.bottom,20)
                    
                    VStack{
                        Button(action: {
                            isCameraPresented.toggle()
                        }) {
                            NavigationLink(destination: ObjectDetectionModel().navigationBarBackButtonHidden()){
                                Text("Photo Library")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, minHeight: 44)
                                    .foregroundColor(.white)
                                    .background(Color(.systemGreen).opacity(0.9))
                                    .cornerRadius(8)
                                    .padding(.horizontal, 16)
                                    .padding(.top, 16)
                            }
                        }
                        
                        
                        // Scan Button
                        Button(action: {
                            isCameraPresented.toggle()
                        }) {
                            Text("Camera")
                                .font(.headline)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .foregroundColor(.white)
                                .background(Color(.systemGreen).opacity(0.9))
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                                .padding(.top, 16)
                        }
                        .sheet(isPresented: $isCameraPresented) {
                            ImageSelector(isImagePickerPresented: $isCameraPresented, sourceType: .camera)
                        }
                    }
                    
                    
                }//VSTACK
                .padding(16)
            }//SCROLL VIEW
            .navigationTitle("UpCycle")
            .background(Color(.systemGreen).opacity(0.05))
        }//navigation
        .searchable(text: $searchText)
    }
}


//IMAGE PICKER UI CONTROLLER
struct ImageSelector: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var isImagePickerPresented: Bool

        init(isImagePickerPresented: Binding<Bool>) {
            _isImagePickerPresented = isImagePickerPresented
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            isImagePickerPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isImagePickerPresented = false
        }
    }

    @Binding var isImagePickerPresented: Bool
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(isImagePickerPresented: $isImagePickerPresented)
    }
}



struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController

    @Binding var selectedImage: UIImage?
    @Binding var resultText: String

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var selectedImage: UIImage?
        @Binding var resultText: String

        init(selectedImage: Binding<UIImage?>, resultText: Binding<String>) {
            _selectedImage = selectedImage
            _resultText = resultText
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)

            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                return
            }

            selectedImage = image
            resultText = "Analyzing..."

            // Notify the change to the ContentView
            NotificationCenter.default.post(name: NSNotification.Name("SelectedImageChanged"), object: nil, userInfo: ["newImage": image])
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(selectedImage: $selectedImage, resultText: $resultText)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // Update if needed
    }
}




struct ScanScreen_Previews: PreviewProvider {
    static var previews: some View {
        UpcycleScreen()
    }
}

