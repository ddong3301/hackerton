//
//  LoginViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    let Simbol:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: "heart")
        
        
        return imgView
    }()

    let Id: UITextField = {
        let TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        
        TextField.placeholder = "ID를 입력하세요"
        TextField.borderStyle = .roundedRect
        
        
        
        return TextField
    }()
    
    let passWord: UITextField = {
        let TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        
        TextField.placeholder = "password를 입력하세요"
        TextField.borderStyle =  .roundedRect
        
        return TextField
    }()
    
    
    
    
    func addView() {
        
        view.addSubview(Simbol)
        view.addSubview(Id)
        view.addSubview(passWord)
        
    }
    
    
    func autolayout() {
        NSLayoutConstraint.activate([
        
            Simbol.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            Simbol.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            Simbol.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            Simbol.heightAnchor.constraint(equalToConstant: 300),
            
            Id.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            Id.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            Id.topAnchor.constraint(equalTo: Simbol.bottomAnchor, constant: 100),
            
            passWord.leadingAnchor.constraint(equalTo: Id.leadingAnchor),
            passWord.trailingAnchor.constraint(equalTo: Id.trailingAnchor),
            passWord.topAnchor.constraint(equalTo: Id.bottomAnchor, constant: 30),
            
            
            
        
        ])
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        autolayout()
        
        
        view.backgroundColor = .white

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
