//
//  LoadUsers.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/20.
//

import Foundation

class Users {

    static let shared = Users()
    private init() {}

    var sammery = [unUsers]()
    
    let apiQueue = DispatchQueue(label: "ApiQueue", attributes: .concurrent )

    let group = DispatchGroup()

    let urlString = "https://subeye.herokuapp.com/getUser"

    func fetch(completion: @escaping () -> ()) {
        group.enter()
        apiQueue.async {
            self.fetch(urlStr: self.urlString) { (result)  in
                switch result {
                case .success(let list):
                    self.sammery = list.data.map {

                        let num = $0.e_num
                        let name = $0.user_name

                        
                        return unUsers(e_num: num, user_name: name)
                    }
                default:
                    self.sammery = []
                    print("default")
                }
                self.group.leave()
            }
        }

        group.notify(queue: .main) {

            completion()
        }


    }




}

    

extension Users {

   private func fetch(urlStr: String, completion: @escaping (Result<loadUsers,Error>) -> ()) {

        guard let url = URL(string: urlStr) else {

            completion(.failure(ApiError.invalidUrl(urlStr)))
            return
        }
        var request = URLRequest.init(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
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
               // fatalError("empty data")
                completion(.failure(ApiError.emptyData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(loadUsers.self, from: data)

                completion(.success(data))

            } catch {
                //fatalError(error.localizedDescription)
                completion(.failure(error))
            }


        }
        task.resume()
    }
}
