//
//  Home.swift
//  GlassBackgroundEffect_5
//
//  Created by Omid Shojaeian Zanjani on 19/02/24.
//

import SwiftUI

struct Home: View {
    // view properties
    @State var username:String = ""
    @State var password:String = ""
    
    
    var body: some View {
        VStack{
            VStack(spacing:12){
                Text("Wellcome")
                    .font(.title.bold())
                
                VStack(alignment: .leading,spacing: 8, content: {
                    Text("UserName")
                        .font(.callout.bold())
                    CustomTF(hint: "e.g: omidshz00", value: $username)
                    Text("Password")
                        .font(.callout.bold())
                    CustomTF(hint: "password", value: $password, isPassword: true)
                    
                    Button(action: {
                        print("Logging In in progress ....")
                    },label:{
                        Text("Login")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                    .padding(.top, 30)
                })
                
                HStack(spacing: 12){
                    Button(action: {
                        
                    }, label: {
                        Label("Email", systemImage: "envelope.fill")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                        // adding transparent Blur
                            .background{
                                TransparentBlurView(removeAllFilter: false)
                                    .backgroundStyle(Color.white.opacity(0.2))
                            }
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Label("Apple", systemImage: "applelogo")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background{
                                TransparentBlurView(removeAllFilter: false)
                                    .backgroundStyle(Color.white.opacity(0.2))
                            }
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                }
                .padding(.top, 15)
            }// Vstack
            .foregroundColor(Color.white)
            .padding(.horizontal, 30)
            .padding(.top, 35)
            .padding(.bottom, 25)
            .background{
                TransparentBlurView(removeAllFilter: true)
                    .blur(radius: 9, opaque: true)
                    .background(Color.white.opacity(0.02))
            }
            .clipShape( .rect(cornerRadius: 25, style: .continuous)  )
            .background{
                // light white border
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke( Color.white.opacity(0.3),lineWidth: 1.5)
            }
            // adding shadow
            .shadow(color: .black.opacity(0.2), radius: 10)
            .padding(.horizontal, 40)
            .background{
                ZStack{
                    Circle()
                        .fill(LinearGradient(colors: [Color("Gradient1") ,Color("Gradient2")], startPoint: .top, endPoint: .bottom))
                        .frame(width: 140, height: 140)
                        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topLeading )
                        .offset(x: -25, y: -55)
                    
                    Circle()
                        .fill(LinearGradient(colors: [Color("Gradient3") ,Color("Gradient4")], startPoint: .top, endPoint: .bottom))
                        .frame(width: 140, height: 140)
                        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottomTrailing )
                        .offset(x: 25, y: 55)
                }
                
            }
            
        }
        //.padding(.horizontal, 40)
        // the 395 is only for iPad friendly size
        .frame(maxWidth: 395)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
//            Rectangle()
//                .fill(.BG)
//                .ignoresSafeArea()
            
            Image("newzland")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func CustomTF(hint:String, value:Binding<String>, isPassword:Bool = false) -> some View {
        Group{
            if isPassword {
                SecureField(hint, text: value)
            }else{
                TextField(hint, text: value)
            }
        }
        .environment(\.colorScheme, .dark)
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(.white.opacity(0.12))
        .clipShape(.rect(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    ContentView()
}
