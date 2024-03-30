//
//  GreenityScreen.swift
//  UpCyclization
//
//  Created by Suryasen on 15/01/24.
//MAIN FILE

import SwiftUI


struct GreenityMessage {
    let userPhoto: [Image]
    let userName: [String]
    let date: String
    let messageText: Text
    let actions: [Image]
}

//MAIN VIEW

struct GreenityScreen: View {


    
    @State private var searchText = ""
    
    let messages = [
        GreenityMessage(
            userPhoto: [Image("boy"), Image("girl")],
            userName: ["Suryasen", "Ashi Gupta"],
            date: "30th Jan, 24",
            messageText: Text("Hello Greenites🌳, Welcome to my new app which facilitates to the upcycling of the waste♻️ while also generating income💰 to the artists and entrepreneurs."),
            actions: [Image(systemName: "heart"), Image(systemName: "message"), Image(systemName: "square.and.arrow.up")]
        ),
        // Add more messages here
    ]
    //BODY
    var body: some View {
        NavigationView { // Creates navigation bar for Scan screen
            //ScrollView {
                VStack(spacing: 16) {
        
                    Gauge()
                    HStack {
                        Button(action: {
                            // Navigate to Events screen
                        }) {
                            Text("Events")
                                .font(.headline)
                                .padding()
                                .background(Color(.systemGreen).opacity(0.9))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.trailing, 30)
                        Button(action: {
                            // Navigate to Friends screen
                        }) {
                            Text("Friends")
                                .font(.headline)
                                .padding()
                                .background(Color(.systemGreen).opacity(0.9))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.leading, 30)
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    Text("Messages")
                        //.font(.headline)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                        .padding(.bottom, -16)
                        .font(.system(size: 20))
                    
                    ForEach(messages, id: \.userName) { message in
                        GreenityMessageCard(message: message)
                    }
                    .padding(.top, 16)
                }
                .padding(16)
            //}
            .navigationTitle("Greenity")
            .searchable(text: $searchText)
        }
    }
}

//GAUGE

struct Gauge: View {
    @State private var isPressed = false

    var body: some View {
        Button(action: {
            isPressed = true
            // Navigate to Groovy Coins screen
        }) {
            NavigationLink(destination: MyCoinsScreen()){
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 4)
                    .frame(width: 120, height: 120)
                
                //                    Image(systemName: "person")
                Circle()
                    .trim(from: 0.3, to: 1)
                    .stroke(Color.green, lineWidth: 8)
                    .frame(width: 120, height: 120)
                    
                
                if isPressed {
                    Text("Groovy Coins")
                        .foregroundColor(.white)
                }
                Image("profile")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.green, .gray)
            }
        }
            
            
        }
        
    }
    
}

//MESSAGE CARD

struct GreenityMessageCard: View {
    let message: GreenityMessage

    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    message.userPhoto[0]
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .aspectRatio(contentMode: .fit)
                    Text(message.userName[0])
                        .font(.headline)
                    Spacer()
                    Text(message.date)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .onTapGesture {
                            // Show edit message popup
                        }
                }
                .padding(.horizontal)
                .padding(.top)
                message.messageText
                    .padding(.horizontal)
                    .font(.system(size: 15))
                HStack {
                    message.actions[0]
                        .resizable()
                        .frame(width: 25, height: 25)
                    message.actions[1]
                        .resizable()
                        .frame(width: 25, height: 25)
                    message.actions[2]
                        .resizable()
                        .frame(width: 25, height: 30)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(20)
            //.frame(width: 300, height: 250)
            
            VStack {
                HStack {
                    message.userPhoto[1]
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .aspectRatio(contentMode: .fit)
                    Text(message.userName[1])
                        .font(.headline)
                    Spacer()
                    Text(message.date)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .onTapGesture {
                            // Show edit message popup
                        }
                }
                .padding(.horizontal)
                .padding(.top)
                message.messageText
                    .padding(.horizontal)
                    .font(.system(size: 15))
                HStack {
                    message.actions[0]
                        .resizable()
                        .frame(width: 25, height: 25)
                    message.actions[1]
                        .resizable()
                        .frame(width: 25, height: 25)
                    message.actions[2]
                        .resizable()
                        .frame(width: 25, height: 30)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(20)
            
            //.frame(width: 330, height: 250)
        }
    }
}


#Preview {
    GreenityScreen()
}
