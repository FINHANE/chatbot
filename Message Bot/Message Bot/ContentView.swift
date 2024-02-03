//
//  ContentView.swift
//  Message Bot
//
//  Created by Dnhane on 2023/8/27.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State private var messages: [String] = ["Tell Us how we may help you"]
    var body: some View {
        VStack{
            HStack{
                Text("iHelpU")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.right.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.green)
            }
            
            ScrollView{
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack{
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.8))
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    }else{
                        HStack{
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.8))
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                                .cornerRadius(15)
                            Spacer()
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.accentColor.opacity(0.1))
            
            HStack{
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button{
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 30))
                .foregroundColor(.accentColor)
                .padding(.horizontal, 16)
            }
            .padding()
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            messages.append(getBotResponse(message: message))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
