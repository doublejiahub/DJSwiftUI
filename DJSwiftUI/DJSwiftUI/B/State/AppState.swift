//
//  AppState.swift
//  DJSwiftUI
//
//  Created by zhihu on 2021/6/24.
//

import Foundation
import Combine

enum AppAction {
    case login(username:String, password: String)
    case loginComplete(result: Result<User,AppError>)
    case logout
}

struct AppState {
    var isLogging = false
    var loggedOn = false
    var loginError: AppError?
    var user: User = User(username: "", password: "")
}

