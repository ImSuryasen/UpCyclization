//
//  MyStoreScreen.swift
//  UpCyclization
//
//  Created by Suryasen on 30/01/24.
//

import SwiftUI


struct MyStoreScreen: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Second Life Crafter")
                        .font(.title2)
                        .fontWeight(.bold)
    //                    .padding()

    //                Divider()

                    HStack(spacing: 16) {
                        ForEach(1...4, id: \.self) { index in
                            Button(action: {
                                // Button actions for Home, Messages, Orders, Listings, and Orders
                            }) {
                                VStack {
                                    getImage(for: index)
                                        .padding(.bottom, 5) // Adjust vertical padding
                                    Text(getBtnText(for: index))
                                }
                                .padding(.vertical, 15) // Adjust vertical padding
                                .padding(.horizontal, 4)
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .font(.system(size: 15))
                            }
                        }
                    }
                    .padding(.horizontal, 2)

    //                Divider()

                    Divider()

                    Text("Your Shop Statistics")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom,5)

                    HStack {
                        ForEach(1...4, id: \.self) { index in
                            Button(action: {
                                // Button actions for Today, Last 7 days, This Month, This year, All Time
                            }) {
                                Text("\(getButtonText(for: index))")
                                    .lineLimit(1)
                                    .padding(8)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    //.fontWidth(.standard)
                                    .font(.system(size: 15))
                            }
                        }
                    }

                    .padding(.bottom,8)

                    VStack(spacing: 16) {
                        ForEach(1...5, id: \.self) { index in
                            HStack {
                                VStack {
                                    switch index {
                                    case 1:
                                        HStack{
                                            Text("Views")
                                                .lineLimit(1)
                                            Image(systemName: "arrow.right")
                                            Spacer()
                                            
                                        }
                                        .padding(.top)
                                        HStack{
                                            Text("5789")
                                                .foregroundColor(.black)
                                                .font(.system(size: 26))
                                                .lineLimit(1)
                                            Spacer()
                                        }
                                    case 2:
                                        HStack{
                                            Text("Orders")
                                                .lineLimit(1)
                                            Image(systemName: "arrow.right")
                                            Spacer()
                                        }
                                        HStack{
                                            Text("59")
                                                .foregroundColor(.black)
                                                .font(.system(size: 26))
                                                .lineLimit(1)
                                            Spacer()
                                        }
                                    case 3:
                                        HStack{
                                            Text("Returns")
                                                .lineLimit(1)
                                            Image(systemName: "arrow.right")
                                            Spacer()
                                        }
                                        HStack{
                                            Text("1")
                                                .foregroundColor(.black)
                                                .font(.system(size: 26))
                                                .lineLimit(1)
                                            Spacer()
                                        }
                                    case 4:
                                        HStack{
                                            Text("Visits")
                                                .lineLimit(1)
                                            Image(systemName: "arrow.right")
                                            Spacer()
                                        }
                                        HStack{
                                            Text("57")
                                                .foregroundColor(.black)
                                                .font(.system(size: 26))
                                                .lineLimit(1)
                                            Spacer()
                                        }
                                    case 5:
                                        HStack{
                                            Text("Revenue")
                                                .lineLimit(1)
                                            Image(systemName: "arrow.right")
                                            Spacer()
                                        }
                                        HStack{
                                            Text("$ 6,789")
                                                .foregroundColor(.black)
                                                .font(.system(size: 26))
                                                .lineLimit(1)
                                            Spacer()
                                        }
                                    default:
                                        EmptyView()
                                    }
                                }
                                Spacer()
                                HStack{
                                    Image(systemName: "timer")
                                    
                                    Text("Just now")
                                        .font(.footnote)
                                }
                                .padding(.trailing, 3)
                                .padding(.leading, 3)
                                .padding(.top, 3)
                                .padding(.bottom, 3)
                                .background(Color(.systemGreen).opacity(0.3))
                                .cornerRadius(10)
                                
                            }
                            .padding(.bottom, 3)
                            .padding(.top, 5)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            
                            
                            Divider()
                        }
                    }
                    .background(Color(.systemGreen).opacity(0.1))
                    .cornerRadius(10)
//                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                    //.padding([.leading, .trailing], 16) // Add padding from left and right
                    .padding(.bottom, 1)

                    Text("Most Popular Listings")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom,4)

                    HStack(spacing: 5) {
                        Image("bird_feeder")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Bird Feeder")
                                .font(.headline)
                                .fontWeight(.bold)

                            HStack {
                                VStack {
                                    Text("Views: 4567")
                                    Text("Orders: 34")
                                }

                                Spacer()

                                VStack {
                                    Text("Revenue: $3,456")
                                    Text("Favourites: 10")
                                }
                            }
                        }
                    }
                    .padding(.bottom,1)
                    //.padding([.leading, .trailing], 16)
                    .frame(maxWidth: .infinity)
                    Divider()
                }
                .padding(16)
                .ignoresSafeArea(.all)
            }
            .navigationTitle("My Store")
            
        }
        .searchable(text: $searchText)
    }
}


func getButtonText(for index: Int) -> String {
    switch index {
    case 1:
        return "Today"
    case 2:
        return "Last 7 days"
    case 3:
        return "This Month"
    case 4:
        return "This Year"
//    case 5:
//        return "All Time"
    default:
        return ""
    }
}

// Helper function to get button image based on the index
func getImage(for index: Int) -> Image {
    switch index {
    case 1:
        return Image(systemName: "house")
    case 2:
        return Image(systemName: "message")
    case 3:
        return Image(systemName: "cart")
    case 4:
        return Image(systemName: "rectangle.grid.2x2")
    case 5:
        return Image(systemName: "square.and.arrow.down")
    default:
        return Image(systemName: "questionmark")
    }
}

// Helper function to get button text based on the index
func getBtnText(for index: Int) -> String {
    switch index {
    case 1:
        return "Home"
    case 2:
        return "Messages"
    case 3:
        return "Orders"
    case 4:
        return "Listings"
//    case 5:
//        return "Orders"
    default:
        return "Unknown"
    }
}




#Preview {
    MyStoreScreen()
}
