//
//  PassWordCheck.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/19.
//

import UIKit

struct passDuplication: Codable {
    
    var isDuplication: Bool
    
}

struct send_passnum: Codable {
    
    var user_pw: String
    
}

struct updatepw: Codable {
    
    var UpdateSuccess: Bool
}

class PassCheck {
    static let shared = PassCheck()
    private init() { }
    
    var summary: passDuplication?
    var isupdate: updatepw?
    
    let apiQueue = DispatchQueue(label: "ApiQueue", attributes: .concurrent)
    
    let group = DispatchGroup()
    
    func fetch(completion: @escaping ()-> ()) {
        group.enter()
        apiQueue.async {
            self.sendpass() { (result) in
                switch result {
                case .success(let data):
                    self.summary = data
                    
                default:
                self.summary = nil
                }
                
                self.group.leave()
            }
        }
        group.notify(queue: .main) {
            
            completion()
            
        }
        
    }
    
    func updatefetch(completion: @escaping ()-> ()) {
        group.enter()
        apiQueue.async {
            self.updatepass() { (result) in
                switch result {
                case .success(let data):
                    self.isupdate = data
                    
                default:
                self.isupdate = nil
                }
                
                self.group.leave()
            }
        }
        group.notify(queue: .main) {
            
            completion()
            
        }
        
    }
    
}

extension PassCheck {
    
    private func fetch<parshingType: Codable>(urlStr: String, pass_num:String, completion: @escaping (Result<parshingType,Error>) -> ()) {
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(ApiError.invalidUrl(urlStr)))
            return
        }
        
        let comment = send_passnum(user_pw: pass_num)
        guard let uploadData = try? JSONEncoder().encode(comment) else { return }
        
        var request = URLRequest.init(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = uploadData
        
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            print(response)
            if let error = error {
    //            fatalError(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ApiError.invalidResponse))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(ApiError.failed(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(ApiError.emptyData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(parshingType.self, from: data)
                
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    private func sendpass(completion: @escaping (Result<passDuplication,Error>) -> ()) {

        let url = "https://subeye.herokuapp.com/checkPw"
        
        print("A")
        print(CheckUserViewController.checkpassWordTF.text)
        print("A")
        
        fetch(urlStr: url, pass_num: CheckUserViewController.checkpassWordTF.text ?? "",completion: completion)
        
    }
    
    private func updatepass(completion: @escaping (Result<updatepw,Error>) -> ()) {

        let url = "https://subeye.herokuapp.com/user_update"
        
        
        fetch(urlStr: url, pass_num: updatepassView.checkpassWordTF.text ?? "",completion: completion)
        
        
    }
}
