//
//  LoginRequest.swift
//  HJJLogin
//
//  Created by haojiajia on 2021/1/18.
//

import Foundation
import Combine

struct LoginRequest {
    
    let username: String
    let password: String
    
    var publisher: AnyPublisher<User,AppError> {
        Future { promise in
            DispatchQueue.global()
                .asyncAfter(deadline: .now() + 2) {
                    if (self.username == "haojj" && self.password == "password") {
                        let user = User(username: username, password: password)
                        promise(.success(user))
                    }else if (self.username != "haojj"){
                        promise(.failure(.userNotExist))
                    }else if (self.password != "password") {
                        promise(.failure(.passwordWrong))
                    }
                }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

struct User: Codable {
    var username: String
    var password: String
}


// MARK: - AppError
enum AppError: Error, Identifiable {
    var id: String { description }
    case userNotExist
    case passwordWrong
}

extension AppError {
    var description: String {
        switch self {
        case .userNotExist: return "用户名不存在"
        case .passwordWrong: return "密码错误"
        }
    }
}

