//
//  MarketScreen.swift
//  UpCyclization
//
//  Created by Suryasen on 15/01/24.
//MAIN FILE

import SwiftUI

struct MarketScreen: View {
    @State private var searchText = ""
    @State private var subtitle = "WALL art from Old CD's..."
    let categories = ["Home Decor", "Travel", "Toys", "Gifting"]
    let priceRanges = ["Under 199/-", "Under 299/-", "Under 499/-", "Under 999/-"]
    let featuredShops = [
        ("Reimagine Decor", "reimagine-decor"),
        ("Second Life Crafter", "second-life-crafter"),
        ("UpCycled Artisans", "upcycled-artisans"),
        ("Greener Goods", "greener-goods")
    ]
    let topSellingProducts = [
        (
            "Product 1",
            "product-1",
            "Product 1",
            199
        ),
        (
            "Product 2",
            "product-2",
            "Product 2",
            299
        ),
        (
            "Product 3",
            "product-3",
            "Product 3",
            499
        ),
        (
            "Product 4",
            "product-4",
            "Product 4",
           999
        )
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                    }
                }
                //.padding(.horizontal)
                    
                Text("Price Store")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    //.padding(.horizontal, 16)
                    .padding(.top, 10)
                    

                HStack {
                    ForEach(priceRanges, id: \.self) { priceRange in
                        Text(priceRange)
                            .font(.subheadline)
                            .frame(width: 70, height: 80)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 3)
//                            .padding(.vertical, 8)
                            .background(Color(.systemGreen).opacity(0.1))
                            .cornerRadius(100)
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 3))
                            
                            
                    }
                }
                .padding(.horizontal)
                    
                Text("Featured Shops")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    //.padding(.horizontal, 16)
                    .padding(.top, 10)
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(featuredShops, id: \.0) { shop in
                            ShopCardView(name: shop.0, imageName: shop.1)
                        }
                    }
                }
                //.padding(.horizontal)
                    
                Text("Top Selling Products")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    //.padding(.horizontal, 16)
                    .padding(.top, 10)
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(topSellingProducts, id: \.0) { product in
                            ProductCardView(name: product.0, imageName: product.1, description: product.2, price: product.3)
                        }
                    }
                }
                //.padding(.horizontal)
                }//VSTACK
                .padding(16)
                
            }//SCROLL VIEW
            .navigationTitle("Market")
        }//navigation
        .searchable(text: $searchText)
    }
}

struct ShopCardView: View {
    let name: String
    let imageName: String

    var body: some View {
        VStack {
            Image("store")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.frame(width: 120, height: 120)
                .cornerRadius(8)
                .padding(.top, 5)
            Text(name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .padding(.trailing, 8)
                .padding(.leading, 8)
                .padding(.bottom, 8)
                .frame(width: 100, height: 60)
        }
        .frame(width: 100, height: 140)
        .background(Color(.systemGreen).opacity(0.3))
        .cornerRadius(8)
        //.shadow(color: .gray, radius: 2, x: 0, y: 0)
    }
}

struct ProductCardView: View {
    let name: String
    let imageName: String
    let description: String
    let price: Int

    var body: some View {
        
        VStack {
            Image("bird_feeder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 5)
                //.frame(width: 120, height: 120)
            Text(name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                //.padding(.top, 5)
                .aspectRatio(contentMode: .fit)
            Text("$\(price)")
                .font(.caption)
                .foregroundColor(.black)
            Button(action: {
                print("Buy button tapped for \(name)")
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

#Preview {
    MarketScreen()
}
