//
//  url.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/14.
//

import Foundation




class geturl {

    static let shared = geturl()
    private init() {}

    var imgpath = [sharedimgurl]()
    
    let apiQueue = DispatchQueue(label: "ApiQueue", attributes: .concurrent )

    let group = DispatchGroup()

    let urlString = "https://subeye.herokuapp.com/gallery"

    func fetch(completion: @escaping () -> ()) {
        group.enter()
        apiQueue.async {
            self.fetch(urlStr: self.urlString) { (result)  in
                switch result {
                case .success(let list):
                    self.imgpath = list.data.map {

                        let path = $0.filePath
                        let date = $0.date
                        
                        return sharedimgurl(path: path, date: date)
                    }
                default:
                    self.imgpath = []
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

    

extension geturl {

   private func fetch(urlStr: String, completion: @escaping (Result<imgurl,Error>) -> ()) {

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
                let data = try decoder.decode(imgurl.self, from: data)

                completion(.success(data))

            } catch {
                //fatalError(error.localizedDescription)
                completion(.failure(error))
            }


        }
        task.resume()
    }
}

