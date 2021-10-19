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
        let label = UIButton()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.backgroundColor = .systemGray5
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 15

        return label
    }()
    
    
    
    
    
    
    
    func addview() {
        
        view.addSubview(IDlabel)
        view.addSubview(userID)
        view.addSubview(passWordlabel)
        view.addSubview(userPassWord)
        
        
        
    }
    
    
    func autolayout(){
        
        NSLayoutConstraint.activate([
        
            IDlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            IDlabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            userID.leadingAnchor.constraint(equalTo: IDlabel.trailingAnchor, constant: 50),
            userID.heightAnchor.constraint(equalToConstant: 40),
            
            passWordlabel.leadingAnchor.constraint(equalTo: IDlabel.leadingAnchor),
            passWordlabel.topAnchor.constraint(equalTo: IDlabel.bottomAnchor, constant: 30),
            
            userPassWord.leadingAnchor.constraint(equalTo: passWordlabel.leadingAnchor, constant: 30),
            userPassWord.heightAnchor.constraint(equalToConstant: 50),
        
        
        ])
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addview()
        autolayout()
        
        
        view.backgroundColor = .white
        navigationItem.titleView = titleview
        
        
        
        
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
