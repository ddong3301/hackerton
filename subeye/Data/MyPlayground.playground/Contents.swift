import UIKit

struct Noticelist: Codable {
    
    struct data: Codable {
        
        var title: String
        var n_seq: Int
          
    }
    
    var data: [data]
   
}

enum ApiError: Error {
    case unowned
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}

let urlString = "https://subeye.herokuapp.com/showNoticeList"

func fetch(urlStr: String, completion: @escaping (Result<Noticelist,Error>) -> ()) {
    
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

fetch(urlStr: urlString) { (result)  in
    switch result {
    case .success(let weather):
        dump(weather)
    case .failure(let error):
        print(error)
    }
}




