//
//  UserViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/18.
//

import UIKit

class UserViewController: UIViewController {

    let titleview: UILabel = {
        let label = UILabel()
        
        label.text = "사용자 정보"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        return label
    }()
    
    let IDlabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "사번 : "
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        
        return label
    }()
    
    let userID: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        
        label.backgroundColor = .systemGray5
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        label.layer.masksToBounds = true
        label.textAlignment = .center
        
        return label
    }()
    
    let passWordlabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "비밀번호 : "
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        
        
        return label
    }()
    
    let userPassWord: UIButton = {
        let bt = UIButton()
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.backgroundColor = .systemGray5
        bt.layer.borderWidth = 2
        bt.layer.cornerRadius = 15
        bt.layer.masksToBounds = true
        let label = UILabel()
        
        bt.addSubview(label)
        
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = "비밀번호 변경"
        label.centerXAnchor.constraint(equalTo: bt.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: bt.centerYAnchor).isActive = true
        
        return bt
    }()
    
    let Phonelabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "핸드폰 번호 : "
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        
        return label
    }()
    
    let userPhone: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        label.backgroundColor = .systemGray5
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        label.textAlignment = .center
        
        return label
    }()
    
    let region: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "지역명 : "
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        
        return label
    }()
    
    let userRegion: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        label.backgroundColor = .systemGray5
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        label.layer.masksToBounds = true
        label.textAlignment = .center
        
        return label
    }()
    
    let remove: UIButton = {
        let bt = UIButton()
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.backgroundColor = .systemRed
        bt.layer.borderWidth = 2
        bt.layer.cornerRadius = 15
        bt.layer.masksToBounds = true
        let label = UILabel()
        
        bt.addSubview(label)
        
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = "계정 정보 삭제"
        label.centerXAnchor.constraint(equalTo: bt.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: bt.centerYAnchor).isActive = true
        
        return bt
    }()
    
    
    
    func addview() {
        
        view.addSubview(IDlabel)
        view.addSubview(userID)
        
        view.addSubview(passWordlabel)
        view.addSubview(userPassWord)
        
        view.addSubview(Phonelabel)
        view.addSubview(userPhone)
        
        view.addSubview(region)
        view.addSubview(userRegion)
        
        view.addSubview(remove)
        
        
        
    }
    
    
    func autolayout(){
        
        NSLayoutConstraint.activate([
        
            IDlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            IDlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            
            userID.leadingAnchor.constraint(equalTo: userPhone.leadingAnchor),
            userID.topAnchor.constraint(equalTo: IDlabel.topAnchor),
            userID.heightAnchor.constraint(equalToConstant: 50),
            userID.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            passWordlabel.leadingAnchor.constraint(equalTo: IDlabel.leadingAnchor),
            passWordlabel.topAnchor.constraint(equalTo: IDlabel.bottomAnchor, constant: 30),
            
            userPassWord.leadingAnchor.constraint(equalTo: userPhone.leadingAnchor),
            userPassWord.heightAnchor.constraint(equalToConstant: 50),
            userPassWord.trailingAnchor.constraint(equalTo: userID.trailingAnchor),
            userPassWord.topAnchor.constraint(equalTo: passWordlabel.topAnchor),
            
            Phonelabel.leadingAnchor.constraint(equalTo: IDlabel.leadingAnchor),
            Phonelabel.topAnchor.constraint(equalTo: passWordlabel.bottomAnchor, constant: 30),
            Phonelabel.widthAnchor.constraint(equalToConstant: 170),
            
            userPhone.leadingAnchor.constraint(equalTo: Phonelabel.trailingAnchor, constant: 0),
            userPhone.topAnchor.constraint(equalTo: Phonelabel.topAnchor, constant: 0),
            userPhone.heightAnchor.constraint(equalTo: userID.heightAnchor),
            userPhone.trailingAnchor.constraint(equalTo: userID.trailingAnchor),
            
            region.leadingAnchor.constraint(equalTo: Phonelabel.leadingAnchor),
            region.topAnchor.constraint(equalTo: Phonelabel.bottomAnchor, constant: 30),
            
            userRegion.leadingAnchor.constraint(equalTo: userPhone.leadingAnchor),
            userRegion.topAnchor.constraint(equalTo: region.topAnchor, constant: 0),
            userRegion.heightAnchor.constraint(equalTo: userID.heightAnchor),
            userRegion.trailingAnchor.constraint(equalTo: userID.trailingAnchor),
            
            remove.leadingAnchor.constraint(equalTo: IDlabel.leadingAnchor, constant: 0),
            remove.trailingAnchor.constraint(equalTo: userPhone.trailingAnchor, constant: 0),
            remove.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            remove.heightAnchor.constraint(equalTo: userID.heightAnchor),
        
        ])
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addview()
        autolayout()
        
        
        view.backgroundColor = .white
        navigationItem.titleView = titleview
        
        userID.text = LoginViewController.loginId
        userPhone.text = LoginDataSource.shared.summary?.phone
        userRegion.text = LoginDataSource.shared.summary?.region
        
        
        userPassWord.addTarget(self, action: #selector(presentupdate(_:)), for: .touchUpInside)
        remove.addTarget(self, action: #selector(pressremove(_:)), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
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


extension UserViewController {
    
    @objc func presentupdate(_ sender: UIButton) {
        
        let vc = updatepassView()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        present(vc, animated: true, completion: nil)
        
    }
    
    func removedata() {
        
            let url = URL(string: "https://subeye.herokuapp.com/deleteUser")
            
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let e = error{
                    NSLog("two error: \(e.localizedDescription)")
                    return
                }
                
                print("Success delete")
            }
            task.resume()
            
            self.dismiss(animated: true, completion: nil)
        }
    
    
    @objc func pressremove(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "데이터 삭제", message: "정말 삭제하시겠습니까?", preferredStyle: .alert)
        let removeaction = UIAlertAction(title: "삭제", style: .cancel) { (action) in
            self.removedata()
            self.restartApplication()
        }
        let alertaction = UIAlertAction(title: "취소", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
            
        }
        alert.addAction(removeaction)
        alert.addAction(alertaction)
        
        present(alert, animated: true, completion: nil)
        
        
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
