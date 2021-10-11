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

struct signup: Codable {
    
    let e_num:String
    let user_pw:String
    let user_name:String
    let phone:String
    let region:String
}

