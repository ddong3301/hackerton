//
//  CheckUserViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/19.
//

import UIKit

class CheckUserViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "사용자 확인을 위해 비밀번호를 재입력 해주세요."
        
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
        
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
        label.text = "  Pass Word  "
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
        label.text = "확인"
        
        bt.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: bt.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: bt.centerXAnchor).isActive = true
        bt.layer.cornerRadius = 15
        bt.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        bt.layer.borderWidth = 2
        
        
        return bt
    }()
    
    let titleview: UILabel = {
        let label = UILabel()
        
        label.text = "비밀번호 확인"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        return label
    }()
    
    
    
    func addviews() {
        
        view.addSubview(passview)
        view.addSubview(CheckUserViewController.checkpassWordTF)
        view.addSubview(titleLabel)
        view.addSubview(checkbt)
        view.addSubview(passtitle)
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
        
            CheckUserViewController.checkpassWordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            CheckUserViewController.checkpassWordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            CheckUserViewController.checkpassWordTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            
            checkbt.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            checkbt.widthAnchor.constraint(equalTo: passview.widthAnchor, constant: 0),
            checkbt.heightAnchor.constraint(equalTo: passview.heightAnchor),
            checkbt.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passview.leadingAnchor.constraint(equalTo: CheckUserViewController.checkpassWordTF.leadingAnchor, constant: -15),
            passview.trailingAnchor.constraint(equalTo: CheckUserViewController.checkpassWordTF.trailingAnchor, constant: 15),
            passview.topAnchor.constraint(equalTo: CheckUserViewController.checkpassWordTF.topAnchor, constant: -15),
            passview.bottomAnchor.constraint(equalTo: CheckUserViewController.checkpassWordTF.bottomAnchor, constant: 15),
            
            passtitle.centerYAnchor.constraint(equalTo: passview.topAnchor),
            passtitle.leadingAnchor.constraint(equalTo: passview.leadingAnchor, constant: 30),
            
        ])
   
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addviews()
        autolayout()
        checkbt.addTarget(self, action: #selector(checkpass(_:)), for: .touchUpInside)
        
        CheckUserViewController.checkpassWordTF.delegate = self
        navigationController?.navigationBar.tintColor = .black
        navigationItem.titleView = titleview
        
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
           tapGesture.delegate = self
                
           self.view.addGestureRecognizer(tapGesture)
        
        
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

extension CheckUserViewController {
    
    @objc func checkpass(_ sender: UIButton) {
        
        PassCheck.shared.fetch {
            guard let check = PassCheck.shared.summary?.isDuplication else {
                print("isNULL")
                return }
            
            print(check)
            
            if check == true {
                let alert = UIAlertController(title: "", message: "확인되었습니다.", preferredStyle: .alert)
                let alertaction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
                    CheckUserViewController.checkpassWordTF.text = ""
                    let VC = UserViewController()
                    self.navigationController?.pushViewController(VC, animated: true)
                })
                alert.addAction(alertaction)
                self.present(alert, animated: true, completion: nil)
                
                
            } else {
                
                let alert = UIAlertController(title: "오류", message: "비밀번호가 다릅니다.", preferredStyle: .alert)
                let alertaction = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(alertaction)
                self.present(alert, animated: true, completion: nil)
                
            }
    }
    
    
}
}

extension CheckUserViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        checkpass(checkbt)
        
       return  true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}



