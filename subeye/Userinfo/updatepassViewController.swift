//
//  updatepassViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/20.
//

import UIKit

class updatepassView: UIViewController {
    


    let dissmissbt: UIButton = {
        let bt = UIButton()
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(systemName: "xmark"), for: .normal)
        bt.tintColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        
        return bt
    }()
    
    let alertview : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        
        
        
        return view
    }()
    
     static let checkpassWordTF: UITextField = {
        let TF = UITextField()
        
        TF.translatesAutoresizingMaskIntoConstraints = false
        
        TF.isSecureTextEntry = true
        TF.font = UIFont.boldSystemFont(ofSize: 15)
        TF.textColor = .black
        TF.placeholder = "**********"
        
        TF.borderStyle = .none
        
   
        return TF
    }()
    
    let passview: UIView = {
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        
        v.layer.cornerRadius = 15
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        
        return v
    }()
    
    let passtitle: UIView = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = " new password "
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = .white
        
    
        return label
    }()
    
    let checkbt :UIButton =  {
        let bt = UIButton()
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "변경"
        
        bt.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: bt.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: bt.centerXAnchor).isActive = true
        bt.layer.cornerRadius = 15
        bt.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        bt.layer.borderWidth = 2
        
        
        return bt
    }()
    
    
    
    func addviews() {
        
        view.addSubview(alertview)
        alertview.addSubview(dissmissbt)
        alertview.addSubview(passview)
        alertview.addSubview(passtitle)
        alertview.addSubview(updatepassView.checkpassWordTF)
        alertview.addSubview(checkbt)

    }
    
    func layout() {
        NSLayoutConstraint.activate([
        
            
            alertview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertview.widthAnchor.constraint(equalToConstant: 300),
            alertview.heightAnchor.constraint(equalToConstant: 300),
            
            dissmissbt.leadingAnchor.constraint(equalTo: alertview.leadingAnchor, constant: 10),
            dissmissbt.topAnchor.constraint(equalTo: alertview.topAnchor, constant: 10),
            
            updatepassView.checkpassWordTF.leadingAnchor.constraint(equalTo: alertview.leadingAnchor, constant: 30),
            updatepassView.checkpassWordTF.trailingAnchor.constraint(equalTo: alertview.trailingAnchor, constant: -30),
            updatepassView.checkpassWordTF.topAnchor.constraint(equalTo: alertview.topAnchor, constant: 150),

            
            passview.leadingAnchor.constraint(equalTo: updatepassView.checkpassWordTF.leadingAnchor, constant: -15),
            passview.trailingAnchor.constraint(equalTo: updatepassView.checkpassWordTF.trailingAnchor, constant: 15),
            passview.topAnchor.constraint(equalTo: updatepassView.checkpassWordTF.topAnchor, constant: -15),
            passview.bottomAnchor.constraint(equalTo: updatepassView.checkpassWordTF.bottomAnchor, constant: 15),
            
            passtitle.centerYAnchor.constraint(equalTo: passview.topAnchor),
            passtitle.leadingAnchor.constraint(equalTo: passview.leadingAnchor, constant: 30),
            
            checkbt.leadingAnchor.constraint(equalTo: passview.leadingAnchor),
            checkbt.trailingAnchor.constraint(equalTo: passview.trailingAnchor),
            checkbt.topAnchor.constraint(equalTo: passview.bottomAnchor, constant: 50),
            checkbt.heightAnchor.constraint(equalTo: passview.heightAnchor),
        
        ])
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black.withAlphaComponent(0.5)
        
        addviews()
        layout()

        dissmissbt.addTarget(self, action: #selector(dissmissalert(_:)), for: .touchUpInside)
        checkbt.addTarget(self, action: #selector(updatepass(_:)), for: .touchUpInside)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension updatepassView {
    
    @objc func dissmissalert(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
   
    }
    
    @objc func updatepass(_ sender: UIButton) {
        
        if updatepassView.checkpassWordTF.text == "" {
            return
        }
        
        
        
        PassCheck.shared.updatefetch {
            let check:Bool = ((PassCheck.shared.isupdate?.UpdateSuccess) != nil)
            print(check)
            if check == true {
                let alert = UIAlertController(title: "비밀번호 변경", message: "비밀번호 변경에 성공하였습니다.", preferredStyle: .alert)
                let alertaction = UIAlertAction(title: "확인", style:.default) { (action) in
                    //self.logout()
                    self.logout()
                    self.restartApplication()
                }
                alert.addAction(alertaction)
                
                self.present(alert, animated: true, completion: nil)
                
            } else {
                let alert = UIAlertController(title: "비밀번호 변경", message: "비밀번호 변경에 실패하였습니다.", preferredStyle: .alert)
                let alertaction = UIAlertAction(title: "확인", style:.default) { (action) in
                }
                alert.addAction(alertaction)
                
                self.present(alert, animated: true, completion: nil)
                          
            }
  
        }
        
    }
    
    func logout() {
        
            let url = URL(string: "https://subeye.herokuapp.com/logout")
            
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let e = error{
                    NSLog("two error: \(e.localizedDescription)")
                    return
                }
                
                print("Success 2")
            }
            task.resume()
            
            self.dismiss(animated: true, completion: nil)
        }
        
    func restartApplication () {
        
        let navCtrl = UINavigationController(rootViewController: LoginViewController())

        guard
                let window = UIApplication.shared.keyWindow,
                let rootViewController = window.rootViewController
                else {
            return
        }

        navCtrl.view.frame = rootViewController.view.frame
        navCtrl.view.layoutIfNeeded()

        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navCtrl
        })

    }
}
