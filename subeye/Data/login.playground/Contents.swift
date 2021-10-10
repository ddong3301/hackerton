import UIKit



struct Login: Codable {
    let e_num:String
    let user_pw:String
    
}


let comment = Login(e_num: "20161505", user_pw: "dong1234")
    
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

let Data = try encoder.encode(comment)
    
let url = URL(string: "https://subeye.herokuapp.com/login")

var request = URLRequest(url: url!)

request.httpMethod = "POST"
request.httpBody = Data
let task = URLSession.shared.uploadTask(with: request, from: Data) {(data, response, error) in
    
    if let e = error {
        print(e)
    }

    print("comment post Success")
    print(String(data: Data, encoding: .utf8)!)

}
task.resume()
