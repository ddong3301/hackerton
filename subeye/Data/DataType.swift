//
//  DataType.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/11.
//

import Foundation


struct Login: Codable {
    
    let e_num:String
    let user_pw:String
    
}

struct UserData: Codable {
    
    let  loginSuccess: Bool
    let  name: String
    let  region: String
    let phone: String

}


struct signup: Codable {
    
    let e_num:String
    let user_pw:String
    let user_name:String
    let phone:String
    let region:String
    let deviceToken:String
    
}

enum ApiError: Error {
    
    case unowned
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
    
}

struct imgurl: Codable {

    struct data: Codable {

        var filePath: String
        var date: String
        var g_num: Int
        var c_num: Int?
        var f_num: Int
        var u_num: String
    }

    var data: [data]

}

struct sharedimgurl {

    var path: String
    var date: String
    var gate: Int
    var cctv: Int?
    var f_num: Int
    var reason: String

}

struct loadUsers: Codable {
    
    struct data: Codable {
        
        var e_num: String
        var user_name: String
    }
    
    var data: [data]
}

struct unUsers {
    
    var e_num: String
    var user_name: String
    
}


