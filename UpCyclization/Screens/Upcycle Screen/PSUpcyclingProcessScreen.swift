//
//  PHUpcyclingProcessScreen.swift
//  UpCyclization
//
//  Created by Suryasen on 25/03/24.
//



import SwiftUI
import WebKit
struct PSUpcyclingProcessScreen: View {
    @State var showingAlert : Bool = false
    @State private var shouldNavigate = false
    let instructions = [
        Text(" Clean and Dry: ").bold() + Text("Thoroughly wash and dry the plastic bottle\n"),
        Text(" Cut Feeding Ports: ").bold() + Text("Mark two or three openings\n"),
        Text(" Create Perches: ").bold() + Text("Cut two small holes, opposite each other\n"),
        Text(" Decoration: ").bold() + Text("Decorate the bottle with paint, markers, or decorative tape.\n"),
        Text(" Hanging Mechanism: ").bold() + Text("Make two small holes near the top of the bottle, opposite each other. Thread a length of twine, wire, or string through the holes and tie a knot to create a loop for hanging.\n"),
        Text(" Fill with Birdseed: ").bold() + Text("Remove the bottle cap and fill the bottle with birdseed suitable for the birds in your area. Replace the cap to prevent spillage.\n"),
        Text(" Hang the Feeder: ").bold() + Text("Find a suitable location to hang the feeder, such as a tree branch, porch overhang, or balcony railing. Ensure the feeder is secure and out of reach of predators.\n"),
        Text(" Enjoy the Birds: ").bold() + Text("Observe the birds as they visit your feeder, and keep it replenished with fresh birdseed regularly.")
    ]

    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
                        HStack {
                            VStack {
                                Image("upcyclebottle")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                                
                                Text("Plastic Bottle")
                                    .bold()
                                    .font(.system(size: 20))
                                    .padding(10)
                                    .multilineTextAlignment(.center)
                            }
                            .background(Color(.systemGreen).opacity(0.09))
                            .cornerRadius(50)
                            .frame(width: 100, height: 180)
                            .shadow(radius: 2)
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 30))
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .frame(width: 80, height: 10)
                            
                            VStack {
                                Image("UPS_Pen_Stand")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                                
                                Text("Pen Holder")
                                    .bold()
                                    .font(.system(size: 20))
                                    .padding(10)
                                    .multilineTextAlignment(.center)
                            }
                            .background(Color(.systemGreen).opacity(0.09))
                            .cornerRadius(50)
                            .frame(width: 100, height: 180)
                            .shadow(radius: 2)
                        }
                        
                        VStack {
                            Text("Step-by-Step DIY Tutorial")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                                .padding(.top, 10)
                            
                            PSEmbedFrameView()
                        }
                        
                        VStack {
                            HStack{
                                Text("Instructions:")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding(.leading, 30)
                                    .padding(.top)
                                
                                Spacer()
                            }
                            ScrollView {
                                VStack(alignment: .leading, spacing: 0) {
                                    ForEach(0..<instructions.count, id: \.self) { index in
                                        Text("\(index + 1). \(instructions[index])")
                                    }
//                                    ForEach(0..<instructions.count, id: \.self) { index in
//                                        Text("\(Text("\(index + 1).").bold()) \(instructions[index])")
//                                    }
                                }
                                .background(Color(.systemGreen).opacity(0.05))
                            }
                            .frame(width: 350, height: 230)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                        }
                    }
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: AddProductListing().navigationBarBackButtonHidden()) {
                            Text("Publish on Store")
                                .padding(.vertical, 15)
                                .padding(.horizontal, 25)
                                .background(Color(.systemGreen).opacity(0.9))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.bottom, 20)
                                .padding(.top, 15)
                        }
                    }
                }
            }
            .navigationTitle("Upcycling Process")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGreen).opacity(0.05))
        }
    }
}


struct PSEmbedView : UIViewRepresentable {
    
    let videoID : String
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")else{ return }
        uiView.scrollView.isScrollEnabled = false
                uiView.load(URLRequest(url: youtubeURL))
    }
}
struct PSEmbedFrameView: View {
    var body: some View{
        VStack{
//            Text("Welcome to our Video")
//                .frame(width: 300,height: 50, alignment: .leading)
            
            HStack{
                VStack{
                    PSEmbedView(videoID: "wZjEz9E6dqs")
                        .frame(width: 300, height: 150, alignment: .leading)
                        .cornerRadius(15)
                    
                }
            }.frame(width: 320, height: 170)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black,lineWidth: 4)
                    )
                .background(Color.white)
                .cornerRadius(15)
        }
        .background(
            LinearGradient(gradient: .init(colors:  [Color("F6E0BB"), Color("E5E5E5"), Color("E5E5E5")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    PSUpcyclingProcessScreen()
}
