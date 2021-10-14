//
//  noticelist.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/11.
//

import UIKit

struct Noticelist: Codable {

    struct data: Codable {
        
        var title: String
        var n_seq: Int

    }

    var data: [data]

}

struct noticelist {

    var title: String
    var number: Int

}

enum ApiError: Error {
    case unowned
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}



class Noticetitle {

    static let shared = Noticetitle()
    private init() {}

    var notice = [noticelist]()

    let apiQueue = DispatchQueue(label: "ApiQueue", attributes: .concurrent )

    let group = DispatchGroup()

    let urlString = "https://subeye.herokuapp.com/showNoticeList"

    func fetch(completion: @escaping () -> ()) {
        
        group.enter()
        apiQueue.async {
            self.fetch(urlStr: self.urlString) { (result)  in
                switch result {
                case .success(let list):
                    
                    self.notice = list.data.map {

                        let title = $0.title
                        let number = $0.n_seq



                        return noticelist(title: title, number: number)
                        
                    }
                default:
                    self.notice = []
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

extension Noticetitle {

   private func fetch(urlStr: String, completion: @escaping (Result<Noticelist,Error>) -> ()) {

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
                let data = try decoder.decode(Noticelist.self, from: data)

                completion(.success(data))

            } catch {
                //fatalError(error.localizedDescription)
                completion(.failure(error))
            }


        }
        task.resume()
    }
}
