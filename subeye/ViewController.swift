//
//  ViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/08.
//

import UIKit

class ViewController: UIViewController {

    @objc func pushloginView(_ sender: UIButton) {
        
        navigationController?.pushViewController(LoginViewController(), animated: true)
        
    }
    
    let loginBt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setTitle("Login", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        
        
        return bt
    }()
    
    
    func addView() {
        
        view.addSubview(loginBt)
        
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
            
            loginBt.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBt.centerYAnchor.constraint(equalTo: view.centerYAnchor),

        ])
   
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addView()
        autolayout()
        
        loginBt.addTarget(self, action: #selector(pushloginView(_:)), for: .touchUpInside)

        
        view.backgroundColor = .white
    }


}

