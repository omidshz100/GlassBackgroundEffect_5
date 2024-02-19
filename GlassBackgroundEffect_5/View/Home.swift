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
            VStack{
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
                            .background(Color.white.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Label("Apple", systemImage: "applelogo")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.white.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                }
                .padding(.top, 15)
            }
            .padding(.horizontal, 30)
            .padding(.top, 35)
            .padding(.bottom, 25)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Rectangle()
                .fill(.black)
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
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(.white.opacity(0.12))
        .clipShape(.rect(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    ContentView()
}
