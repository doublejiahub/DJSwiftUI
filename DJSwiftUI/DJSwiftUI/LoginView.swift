//
//  LoginView.swift
//  DJSwiftUI
//
//  Created by zhihu on 2021/6/21.
//

import SwiftUI

struct LoginView: View {
   
    @State private var username: String = "15830509027"
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            HStack {
                //JJTODO: - 关闭按钮
                Button(action: {
                    
                }, label: {
                    Text("X")
                        .foregroundColor(.secondary)
                        .font(Font.system(size: 16, weight: .semibold, design: .default))
                        .padding(.leading, 12)
                })
               
                padding()
                
                Button(action: {
                    
                }, label: {
                    Text("帮助")
                        .foregroundColor(.secondary)
                        .font(Font.system(size: 16, weight: .semibold, design: .default))
                        .padding(.trailing, 12)
                })
            }
            
            Text("密码登录")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            TextField("用户名", text: $username)
            SecureField("密码", text: $password)
            
            Button(action: {
                
            }, label: {
                Text("登录")
                    .frame(height: 60)
                    .background(Color(hex: 0xf5f7fD))
                    .foregroundColor(.primary)
                    .font(Font.system(size: 16, weight: .semibold, design: .default))
                    .cornerRadius(9.0)
            })
        }
        .padding(EdgeInsets(top: 10, leading: 18, bottom: 0, trailing: 18))
    }
        
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
