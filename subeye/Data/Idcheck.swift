//
//  Idcheck.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/17.
//

import UIKit

struct idDuplication: Codable {
    
    var isDuplication: Bool
    
}

struct send_enum: Codable {
    
    var e_num: String
    
}

class IdCheck {
    static let shared = IdCheck()
    private init() { }
    
    var summary: idDuplication?
    
    let apiQueue = DispatchQueue(label: "ApiQueue", attributes: .concurrent)
    
    let group = DispatchGroup()
    
    func fetch(completion: @escaping ()-> ()) {
        group.enter()
        apiQueue.async {
            self.sendId() { (result) in
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
    
}

extension IdCheck {
    
    private func fetch<parshingType: Codable>(urlStr: String, e_num:String, completion: @escaping (Result<parshingType,Error>) -> ()) {
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(ApiError.invalidUrl(urlStr)))
            return
        }
        
        let comment = send_enum(e_num: e_num)
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
    
    private func sendId(completion: @escaping (Result<idDuplication,Error>) -> ()) {

        let url = "https://subeye.herokuapp.com/dup"
        
        fetch(urlStr: url, e_num: SignupViewController.idTF.text ?? "",completion: completion)
        
    }
}
