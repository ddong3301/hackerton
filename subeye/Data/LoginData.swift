//
//  LoginData.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/17.
//

import UIKit



class LoginDataSource {
    static var cookies: [HTTPCookie]?
    static let shared = LoginDataSource()
    private init() { }
    
    var summary: UserData?
    
    let apiQueue = DispatchQueue(label: "ApiQueue", attributes: .concurrent)
    
    let group = DispatchGroup()
    
    func fetch(completion: @escaping ()-> ()) {
        group.enter()
        apiQueue.async {
            self.login() { (result) in
                switch result {
                case .success(let data):
                    self.summary = data
                    
                default:
                print("default")
                self.summary = nil
                }
                
                self.group.leave()
            }
        }
        group.notify(queue: .main) {
            
            completion()
            
        }
        
    }
    
}

extension LoginDataSource {
    
    private func fetch<parshingType: Codable>(urlStr: String, e_num:String, user_pw:String, completion: @escaping (Result<parshingType,Error>) -> ()) {
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(ApiError.invalidUrl(urlStr)))
            return
        }
        
        
        let comment = Login(e_num: e_num, user_pw: user_pw)
        print(comment)
        guard let uploadData = try? JSONEncoder().encode(comment) else { return }
        
        var request = URLRequest.init(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = uploadData
        
        
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
    //            fatalError(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            print(response)
            
            if let httpResponse = response as? HTTPURLResponse, let fields = httpResponse.allHeaderFields as? [String : String] {
                    let cookies: [HTTPCookie] = HTTPCookie.cookies(withResponseHeaderFields: fields, for: response!.url!)
                LoginDataSource.cookies = cookies
            } else {
                LoginDataSource.cookies = []
            }
            print("print cookies: \(LoginDataSource.cookies)")
            
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
    
    private func login(completion: @escaping (Result<UserData,Error>) -> ()) {

        let url = "https://subeye.herokuapp.com/login"
        
        fetch(urlStr: url, e_num: LoginViewController.Id.text ?? "", user_pw: LoginViewController.passWord.text ?? "" ,completion: completion)
        
    }
}
