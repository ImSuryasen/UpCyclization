//
//  ProfileScreen.swift
//  UpCyclization
//
//  Created by Suryasen on 15/01/24.
//MAIN FILE

import SwiftUI

struct ProfileScreen: View {
    @State private var isPressed = false
    @State private var navigateToScreen = false
    
    let profileOptions = ["Edit Profile", "Change Password", "Privacy Settings", "Notifications", "Account Settings"]
    
    
    var body: some View {
        NavigationView { // Creates navigation bar for Scan screen
            ScrollView {
                VStack(spacing: 16) {
                    Button(action: {
                        navigateToScreen = true
                    }) {
                        Image("profile")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color.green, lineWidth: 4))
                            .shadow(radius: 10)
                        
                    }
                        
                            

                    Text("Hii Lara!")
                        .bold()
                        .font(.system(size: 25))

                    VStack(spacing: 16){
                        HStack(spacing: 16) {
                            Button(action: {
                                // Action for the first button in the first row
                            }) {
                                Text("My Orders")
                                    .frame(width: 85, height: 25)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 25)
                                    .background(Color(.systemGreen).opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.bottom, 5)
                                    .padding(.horizontal)
                            }
                            
                            Button(action: {
                                // Action for the second button in the first row
                            }) {
                                NavigationLink(destination: MyStoreScreen()){
                                    Text("My Store")
                                        .frame(width: 85, height: 25)
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 25)
                                        .background(Color(.systemGreen).opacity(0.9))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .padding(.bottom, 5)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        
                        HStack(spacing: 16) {
                            Button(action: {
                                // Action for the first button in the second row
                            }) {
                                Text("Wishlist")
                                    .frame(width: 85, height: 25)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 25)
                                    .background(Color(.systemGreen).opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.bottom, 5)
                                    .padding(.horizontal)
                            }
                            
                            Button(action: {
                                // Action for the second button in the second row
                            }) {
                                Text("Support")
                                    .frame(width: 85, height: 25)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 25)
                                    .background(Color(.systemGreen).opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.bottom, 5)
                                    .padding(.horizontal)
                            }
                        }
                    }

                    Divider()

                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(height: CGFloat(profileOptions.count) * 50)
                        .overlay(
                                VStack(alignment:.leading, spacing: 0) {
                                ForEach(profileOptions, id: \.self) { option in
                                   HStack {
                                    Text(option)
                                     .foregroundColor(.primary)

                                    Spacer()

                                    Image(systemName:
                                            "chevron.right.circle")
                                        .foregroundColor(.blue)
                                  }
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 15)
                                    Divider()// Adjusted vertical padding
                                }
                            }
                        )
                    Button(action: {
                        // Action for the second button in the second row
                    }) {
                        Text("Log Out")
//                                .font(.caption)
//                                .fontWeight(.bold)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 25)
                            .background(Color(.systemGreen).opacity(0.9))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.bottom, 5)
                            .padding(.top, 15)
                            .padding(.horizontal)
                    }
                }
                .padding(16)
                .ignoresSafeArea()
            }
            .navigationTitle("Profile")
            .background(Color(.systemGreen).opacity(0.2))
            .sheet(isPresented: $navigateToScreen){
                MyCoinsScreen()
            }
        }
    }
}


#Preview {
    ProfileScreen()
}
