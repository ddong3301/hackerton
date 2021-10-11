import UIKit





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

logout()
