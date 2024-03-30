//
//  MyCoinsScreen.swift
//  UpCyclization
//
//  Created by Suryasen on 30/01/24.
//

import SwiftUI

struct MyCoinsScreen: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Bronze")
                            .font(.largeTitle)
                            .padding(.bottom,5)
                        Text("Earning 5 points per 100rs")
                            .font(.subheadline)
                            .padding(.bottom,3)
                        
                        YourView(progressValue: 0.6)
                            
                        HStack {
                            Text("234 points to silver")
                                .font(.subheadline)
                            Image(systemName: "info.circle")
                                .foregroundColor(.black)
                                .padding(.top, 3)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack {
                        Image("bronze-medal") // Replace "bronze_medal" with your actual image name
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding(.trailing,30)
                    }
                }
                
                VStack {
                    Divider()
                }
                ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Special Earn Rates")
                                .font(.system(size: 30, weight: .bold))
                            Spacer()
                            Image(systemName: "info.circle")
                                .foregroundColor(.black)
                        }
                        Text("The highest earn rate will be applied.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.leading, 1)
                        
                        // Additional VStack
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image("birdfeeder") // Replace with your actual image name
                                    .resizable()
                                    .cornerRadius(10)
                                    .frame(width: 80, height: 80)
                                    .padding()
                                    
                                VStack{
                                    Text("Earn 5 points per 75rs")
                                        .font(.subheadline)
                                    Text("Bird Feeder Decorator")
                                        .font(.subheadline)
                                    Text("Ends on Feb 10")
                                        .font(.subheadline)
                                }
                                .padding(.leading, 1)
                                
                                Spacer(minLength: 20) // Add spacing
                                
                                VStack {
                                    Image("reward") // Replace with your actual image name
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    Text("3/5rs")
                                        .font(.subheadline)
                                }
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image("VerticalPlanters") // Replace with your actual image name
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 80, height: 80)
                                        .padding()
                                    VStack{
                                        Text("Earn 5 points per 75rs")
                                            .font(.subheadline)
                                        Text("Vertical Planters")
                                            .font(.subheadline)
                                        Text("Ends on Feb 8")
                                            .font(.subheadline)
                                    }
                                    .padding(.leading,1)
                                    
                                    Spacer(minLength: 20) // Add spacing
                                    
                                    VStack {
                                        Image("reward") // Replace with your actual image name
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text("3/5rs")
                                            .font(.subheadline)
                                    }
                                }
                            }
                        }
                        
                    }
//                    .padding()
                }
 //Scroll view after the divider
                .padding()
            }
            .navigationTitle("My Points")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .padding(.top, 20)
        
    }
    
}

struct YourView: View {
    @State private var progressValue: Double
    
    init(progressValue: Double) {
        self._progressValue = State(initialValue: progressValue)
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            ProgressBar(value: progressValue)
                .frame(width: 200, height: 10)
                .padding(.bottom, 6)
            
            Spacer()
        }
    }
}

struct ProgressBar: View {
    var value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width, height: 10)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: 10)
                    .foregroundColor(Color.green)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 0.3)) {
                            // Animation duration is set to 0.3 seconds, adjust as needed
                        }
                    }
            }
        }
    }
}



#Preview {
    MyCoinsScreen()
}
