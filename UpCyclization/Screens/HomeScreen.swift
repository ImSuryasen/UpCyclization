//
//  HomeScreen.swift
//  UpCyclization
//
//  Created by Suryasen on 15/01/24.
//MAIN FILE

import SwiftUI


struct HomeScreen: View {
    @State private var searchText = ""
    // Add any necessary state variables or properties here
    
    let featuredGreenites = [
        ("Reimagine Decor", "reimagine-decor"),
        ("Second Life Crafter", "second-life-crafter"),
        ("UpCycled Artisans", "upcycled-artisans"),
        ("Greener Goods", "greener-goods")]

        var body: some View {
            NavigationView {
                ScrollView {
                    VStack(spacing: 16) {
                        ImageSlider()
                            .padding(.top, -15)
                            .shadow(color: .gray, radius: 2, x: 0, y: 0)

                        
                        Text("Most Upcycled Waste")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            //.padding(.horizontal, 16)
                            //.padding(.top, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                MostUpcycledWasteCardView(name: "Bottles", imageName: "bottle")
                                MostUpcycledWasteCardView(name: "Cardboards", imageName: "cardboard")
                                MostUpcycledWasteCardView(name: "Pipes", imageName: "pipe")
                                MostUpcycledWasteCardView(name: "Woods", imageName: "wood")
                            }
                        }
                        //.padding(.horizontal)
                        
                        
                        
                        Text("Featured Greenites")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            //.padding(.horizontal, 16)
                            .padding(.top, 10)
                        
                        FeaturedGreenite(imageNames: ["person", "person", "person", "person"], names: ["Sales Captain"])
                        
                        
                        Text("Popular Products")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            //.padding(.horizontal, 16)
                            .padding(.top, 10)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                PopularProductCardView(imageName: "boy", productName: "Bag", price: "Rs. 500")
                                PopularProductCardView(imageName: "boy", productName: "Shoes", price: "Rs. 1,500")
                                PopularProductCardView(imageName: "boy", productName: "T-Shirt", price: "Rs. 700")
                                PopularProductCardView(imageName: "boy", productName: "Watch", price: "Rs. 2,000")
                            }
                        }
                        //.padding(10)
                    }
                    .navigationTitle("Home")
                    .padding(16)
                }
                .searchable(text: $searchText)
            }
        }
    }

    struct PopularProductCardView: View {
        var imageName: String
        var productName: String
        var price: String

        var body: some View {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.frame(height: 80)
                    .padding(.top, 5)

                Text(productName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    //.padding(.top, 5)
                    .aspectRatio(contentMode: .fit)

                Text(price)
                    .font(.caption)
                    .foregroundColor(.black)

                Button(action: {
                    print("Buy button tapped")
                }) {
                    Text("Buy")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 35)
                        .background(Color(.systemGreen).opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .padding(.bottom, 5)
                }
            }
            .frame(width: 100, height: 140)
            .background(Color(.systemGreen).opacity(0.3))
            .cornerRadius(8)
            .padding(.bottom, 5)
            .padding(.top, 5)
            //.shadow(color: .gray, radius: 2, x: 0, y: 0)
        }
    }

    struct MostUpcycledWasteCardView: View {
        var name: String
        var imageName: String

        var body: some View {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)

                Text(name)
                    .font(.headline)
                    .padding(.top, 5)
            }
            .frame(width: 100, height: 140)
            .background(Color(.systemGreen).opacity(0.3))
            .cornerRadius(8)
            .onTapGesture {
                // Handle the tap event here
            }
        }
    }



struct FeaturedGreenite: View {
//    var title: String
    var imageNames: [String]
    var names: [String]

    var body: some View {
        VStack {
//            Text(title)
//                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<4) { index in
                        VStack {
                            //Image(imageNames[index])
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.green, lineWidth: 4))
                                .padding(5)

                            HStack {
                                ForEach(names, id: \.self) { name in
                                    Text(name)
                                        .font(.subheadline)
                                }
                            }
                            .frame(width: 100)
                        }
                        .frame(width: 100, height: 120)
                        .padding(.horizontal, 8)
                    }
                }
            }
        }
    }
}
    struct ImageSlider: View {
        var body: some View {
            TabView {
                ForEach(0..<5) { index in
                    Image("imageSlider")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        
                }
            }
            .tabViewStyle(PageTabViewStyle())
            //.animation(.default)
            .frame(height: 200)
        }
    }

#Preview {
    HomeScreen()
}
