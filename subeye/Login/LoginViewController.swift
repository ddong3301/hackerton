//
//  LoginViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    static var loginId:String? = "1111"
    
    
    let loading = UIActivityIndicatorView()
    
    let extraview: UIView = {
        let extra = UIView()
        extra.translatesAutoresizingMaskIntoConstraints = false
        
        extra.backgroundColor = .white
        
        
        return extra
    }()
    
    
    class View1: UIView {
//        override func draw(_ rect: CGRect) {
//            let path = UIBezierPath()
//            UIColor.systemRed.set()
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: 30, y: 100))
//            path.addLine(to: CGPoint(x: 40, y: 50))
//            path.close()
//            path.lineWidth = 5
//            path.stroke()
//        }
    }
    
    
    
    
    let drawview: UIView = {
        let test = View1()
        test.translatesAutoresizingMaskIntoConstraints = false
        test.backgroundColor = .clear
        
       return test
    }()
    
    let gradeintLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        let colors: [CGColor] = [
            .init(red: 0, green: 0.9810667634, blue: 0.5636914277, alpha: 1),
            .init(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1),
            .init(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        ]
        
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
    
       return gradientLayer
    }()
    
    let Simbol:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "SUBEYEvec")
        imgView.tintColor = .black
        
        return imgView
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "ID"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    
    

    static let Id: UITextField = {
        let TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        
        TextField.placeholder = "SubEye"
        TextField.borderStyle = .none

        return TextField
    }()
    
    
    let idview: UIView = {
        let idview = UIView()
        
        idview.translatesAutoresizingMaskIntoConstraints = false
        idview.backgroundColor = .white
        idview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        idview.layer.borderWidth = 2
        idview.layer.cornerRadius = 15
        
        
        return idview
    }()
    
    let passWordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "PassWord"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .white
        label.textAlignment = .center
        
        return label
    }()

    
    
    static let passWord: UITextField = {
        let TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        
        TextField.placeholder = "*******"
        TextField.borderStyle =  .none
        TextField.isSecureTextEntry = true
        
        return TextField
    }()
    
    let Passwordview: UIView = {
        let idview = UIView()
        
        idview.translatesAutoresizingMaskIntoConstraints = false
        idview.backgroundColor = .white
        idview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        idview.layer.borderWidth = 2
        idview.layer.cornerRadius = 15
        
        return idview
    }()
     
    
    let Loginbt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.backgroundColor = .white
        bt.setTitle("Login", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.setTitleColor(.lightGray, for: .highlighted)
        bt.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        
        
        
        return bt
    }()
    
    let signbt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.backgroundColor = .white
        bt.setTitle("Sign up", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.setTitleColor(.lightGray, for: .highlighted)
        bt.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        return bt
    }()
    
    let line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        //view.backgroundColor = .black
        
        return view
    }()
    
    let forget: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이디 비밀번호 찾기"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        
        
        
        return label
    }()
    
    
    
    
    

    func addView() {
        view.layer.addSublayer(gradeintLayer)
        view.addSubview(Simbol)
        
        view.addSubview(idview)
        view.addSubview(LoginViewController.Id)
        view.addSubview(idLabel)
        
        view.addSubview(Passwordview)
        view.addSubview(LoginViewController.passWord)
        view.addSubview(passWordLabel)
        
        view.addSubview(Loginbt)
        view.addSubview(signbt)
        view.addSubview(line)
        
        view.addSubview(forget)
        view.addSubview(extraview)
        
        view.addSubview(loading)
    }
    
    
    func autolayout() {
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            extraview.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            extraview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            extraview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            extraview.heightAnchor.constraint(equalToConstant:  view.frame.height),
            
            Simbol.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            Simbol.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            Simbol.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            Simbol.heightAnchor.constraint(equalToConstant: 250),
            
            idLabel.leadingAnchor.constraint(equalTo: LoginViewController.Id.leadingAnchor, constant: 5),
            idLabel.centerYAnchor.constraint(equalTo: LoginViewController.Id.topAnchor, constant: -5),
            idLabel.widthAnchor.constraint(equalToConstant: 50),
            idLabel.heightAnchor.constraint(equalToConstant: 30),
            
            LoginViewController.Id.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            LoginViewController.Id.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            LoginViewController.Id.topAnchor.constraint(equalTo: Simbol.bottomAnchor, constant: 110),
            LoginViewController.Id.heightAnchor.constraint(equalToConstant: 50),
            
            idview.leadingAnchor.constraint(equalTo: LoginViewController.Id.leadingAnchor, constant: -20),
            idview.trailingAnchor.constraint(equalTo: LoginViewController.Id.trailingAnchor, constant: 20),
            idview.topAnchor.constraint(equalTo: LoginViewController.Id.topAnchor, constant: -5),
            idview.bottomAnchor.constraint(equalTo: LoginViewController.Id.bottomAnchor, constant: 5),
            
            passWordLabel.leadingAnchor.constraint(equalTo: LoginViewController.Id.leadingAnchor, constant: 5),
            passWordLabel.centerYAnchor.constraint(equalTo: Passwordview.topAnchor, constant: 0),
            passWordLabel.widthAnchor.constraint(equalToConstant: 120),
            passWordLabel.heightAnchor.constraint(equalToConstant: 30),
        
            LoginViewController.passWord.leadingAnchor.constraint(equalTo: LoginViewController.Id.leadingAnchor),
            LoginViewController.passWord.trailingAnchor.constraint(equalTo: LoginViewController.Id.trailingAnchor),
            LoginViewController.passWord.topAnchor.constraint(equalTo: LoginViewController.Id.bottomAnchor, constant: 50),
            LoginViewController.passWord.heightAnchor.constraint(equalToConstant: 50),
            
            Passwordview.leadingAnchor.constraint(equalTo: LoginViewController.passWord.leadingAnchor, constant: -20),
            Passwordview.trailingAnchor.constraint(equalTo: LoginViewController.passWord.trailingAnchor, constant: 20),
            Passwordview.topAnchor.constraint(equalTo: LoginViewController.passWord.topAnchor, constant: -5),
            Passwordview.bottomAnchor.constraint(equalTo: LoginViewController.passWord.bottomAnchor, constant: 5),
            
        
            Loginbt.leadingAnchor.constraint(equalTo: Passwordview.leadingAnchor,constant:  10),
            Loginbt.trailingAnchor.constraint(equalTo: Passwordview.centerXAnchor, constant: -10),
            Loginbt.topAnchor.constraint(equalTo: Passwordview.bottomAnchor, constant: 10),
            
            signbt.leadingAnchor.constraint(equalTo: Passwordview.centerXAnchor, constant: 10),
            signbt.trailingAnchor.constraint(equalTo: Passwordview.trailingAnchor, constant: -10),
            signbt.topAnchor.constraint(equalTo: Loginbt.topAnchor),
            
            line.centerXAnchor.constraint(equalTo: Passwordview.centerXAnchor),
            line.centerYAnchor.constraint(equalTo: Loginbt.centerYAnchor),
            line.heightAnchor.constraint(equalTo: Loginbt.heightAnchor),
            line.widthAnchor.constraint(equalToConstant: 2),
            
            forget.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forget.bottomAnchor.constraint(equalTo: signbt.bottomAnchor, constant: 50)
        ])
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if ((LoginDataSource.cookies?.count  ?? 0) > 0) {
            print(LoginDataSource.cookies?.count)
            print("isnull")
            let mainViewController = UINavigationController(rootViewController: MainViewController())
            LoginViewController.passWord.text = ""
            mainViewController.modalPresentationStyle = .fullScreen
            mainViewController.modalTransitionStyle = .crossDissolve


            self.present(mainViewController, animated: true, completion: nil)
            
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("A")
        print(LoginDataSource.cookies)
       
        loading.isHidden = true
        loading.startAnimating()
        
        //gradeintLayer.frame = view.bounds
        addView()
        autolayout()
        addkeyboardNotification()

        view.backgroundColor = .white
        
        LoginViewController.Id.delegate = self
        LoginViewController.passWord.delegate = self
        
        Loginbt.addTarget(self, action: #selector(pressloginbt(_:)), for: .touchUpInside)
        signbt.addTarget(self, action: #selector(pushsignup(_:)), for: .touchUpInside)
        
        
        let closeTF = UITapGestureRecognizer(target: self, action: #selector(closeedit(_:)))
        view.addGestureRecognizer(closeTF)
        
        

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


extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}


extension LoginViewController: UITextFieldDelegate {
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == LoginViewController.Id {
            LoginViewController.passWord.becomeFirstResponder()
            
            return true
        } else if textField == LoginViewController.passWord {
            
            LoginViewController.passWord.resignFirstResponder()
            pressloginbt(Loginbt)
            
            return true
        } else {
            return true
        }
    }
    

    
}

extension LoginViewController {
    
    @objc func pressloginbt(_ sender: UIButton) {
        
        print("pressLogin bt")
        loading.isHidden = false
        sender.isUserInteractionEnabled = false
        
        LoginDataSource.shared.fetch {
            print(LoginDataSource.shared.summary?.loginSuccess)
            sender.isUserInteractionEnabled = true
            if LoginDataSource.shared.summary?.loginSuccess == true {
                print("loginsuccess")
                LoginViewController.loginId = LoginViewController.Id.text
                self.loading.isHidden = true
                
                let loginalert = UIAlertController(title: "로그인 성공", message: "로그인되었습니다.", preferredStyle: .alert)
                let loginaction = UIAlertAction(title: "확인", style: .default) { (action) in
                    let mainViewController = UINavigationController(rootViewController: MainViewController())
                    LoginViewController.passWord.text = ""
                    mainViewController.modalPresentationStyle = .fullScreen
                    mainViewController.modalTransitionStyle = .crossDissolve


                    self.present(mainViewController, animated: true, completion: nil)
                }

                loginalert.addAction(loginaction)

                self.present(loginalert, animated: true, completion: nil)
                
                
                
            }
            else {
                
                print("failed")

                let loginfailedalert = UIAlertController(title: "로그인 실패", message: "사번 또는 비밀번호를 확인하세요", preferredStyle: .alert)
                let okaction = UIAlertAction(title: "확인", style: .default) { (Action) in
                    LoginViewController.passWord.text = ""
                }

                loginfailedalert.addAction(okaction)

                self.present(loginfailedalert, animated: true, completion: nil)
                
            }
        }
        
        
        
        
        
        
    }
    
    @objc private func keyboardwillShow( _ notification: Notification) {
        
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            if self.view.frame.origin.y == 0 {
                
                self.view.frame.origin.y -= (keyboardHeight + 50)
                
            }
            
            
            
            Simbol.isHidden = true
            
            print(keyboardHeight)
          }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {

        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            self.view.frame.origin.y  = 0
        Simbol.isHidden = false
      }
    }
    
    @objc private func pushsignup(_ sender: UIButton) {
        
        let SingupView = SignupViewController()
        
        SingupView.modalTransitionStyle = .crossDissolve
        SingupView.modalPresentationStyle = .fullScreen
        LoginViewController.passWord.text = ""
        present(SingupView, animated: true, completion: nil)
        
        
        
    }
    
    @objc func closeedit(_ sender: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
       
        
        
    }
    
    private func addkeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    }
    



extension LoginViewController {
    
    
        


}

