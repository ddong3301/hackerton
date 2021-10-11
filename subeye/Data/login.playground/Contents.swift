import UIKit



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

func postComment(e_num: String,user_pw: String) {
    
    let comment = Login(e_num: e_num, user_pw: user_pw)
    guard let uploadData = try? JSONEncoder().encode(comment) else { return }
    
    let url = URL(string: "https://subeye.herokuapp.com/login")
    
    
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.uploadTask(with: request, from: uploadData) {(data, response, error) in
        
        
        if let e = error{
            NSLog("An error")
            return
        }
    
        print("success")

    }
    task.resume()

}

func postsignup(e_num: String, user_pw:String, user_name:String, phone:String, region:String) {
    
    let signup = signup(e_num: e_num, user_pw: user_pw, user_name: user_name, phone: phone, region: region )
    guard let uploadData = try? JSONEncoder().encode(signup) else { return }
    
    let url = URL(string: "https://subeye.herokuapp.com/register")
    
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.uploadTask(with: request, from: uploadData) {(data, response, error) in
        
        
        if let e = error{
            NSLog("An error")
            return
        }
    
        print("success")

    }
    task.resume()
    
}

postsignup(e_num: "20161467", user_pw: "jun1234", user_name: "고준혁", phone: "01022813856", region: "배방역")



func logout() {
    
    let url = URL(string: "https://subeye.herokuapp.com/logout")
    
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let e = error{
            NSLog("two error")
            return
        }
        
        print("Success 2")
    }
    task.resume()

}


