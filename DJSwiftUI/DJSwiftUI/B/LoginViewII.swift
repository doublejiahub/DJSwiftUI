//
//  LoginViewI.swift
//  DJSwiftUI
//
//  Created by zhihu on 2021/6/21.
//

import SwiftUI

/// 基础 view
struct LoginViewII: View {
       
    private var userBinding: Binding<User> {
        $store.appState.user
    }
    
    @EnvironmentObject var store: Store
    private var appState: AppState {
        store.appState
    }

    var body: some View {
        VStack {
            HStack {
                Text("密码登录")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Spacer()
            }
            .padding(.top, 30)
            
            TextField("手机号或邮箱", text: userBinding.username)
                .frame(height: 46)
                .padding(.top, 15)
                 //.textFieldStyle(RoundedBorderTextFieldStyle())
            Rectangle()
                .frame(height: 1.0, alignment: .bottom)
                .foregroundColor(Color(.systemGray4))

            SecureField("密码", text: userBinding.password)
                .frame(height: 46)
            Rectangle()
                .frame(height: 1.0, alignment: .bottom)
                .foregroundColor(Color(.systemGray4))
            
            Button {
                self.store.executeAction(action: .login(username: appState.user.username, password: appState.user.password))

            } label: {
                Text("登录")
                    .frame(width: UIScreen.main.bounds.size.width - 60, height: 40, alignment: .center)
                    .background( isLoginEnabled ? Color(.systemBlue) : Color(.systemBlue).opacity(0.3))
                    .foregroundColor(Color(.systemBackground))
                    .font(Font.system(size: 16, weight: .semibold, design: .default))
                    .cornerRadius(6.0)
                    .padding(.top, 30)
            }
            .disabled(!isLoginEnabled)
            .fullScreenCover(isPresented: $store.appState.loggedOn) {
                VideoViewI()
            }

        }
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
        .alert(item: $store.appState.loginError) { error in
            Alert(title: Text(error.description))
        }
    }
    
    var isLoginEnabled: Bool {
        return !appState.user.username.isEmpty && !appState.user.password.isEmpty
    }
        
}

struct LoginViewII_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewII()
    }
}
