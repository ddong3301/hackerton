//
//  MailViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/20.
//

import UIKit
import MessageUI

class MailViewController: UIViewController {

    
    let titleview: UILabel = {
        let label = UILabel()
        
        label.text = "고객센터"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        return label
    }()
    
    let mailname: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "제목 :"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        return label
    }()
    
    let mailtitle: UITextField = {
        let tf = UITextField()
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "제목을 입력하세요"
        
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.borderStyle = .none
        
        
        
        
        return tf
    }()
    
    let maillayer: UIView = {
        let title = UIView()
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.layer.borderWidth = 2
        title.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        title.layer.cornerRadius = 15
        title.layer.masksToBounds = true
        
        
        return title
    }()
    
    let mailtext : UITextView = {
        let text = UITextView()
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.layer.borderWidth = 2
        text.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        text.layer.cornerRadius = 15
        text.layer.masksToBounds = true
        text.font = UIFont.systemFont(ofSize: 20)
        text.textColor = .black

        return text
    }()
    
    let sendmail :UIButton =  {
        let bt = UIButton()
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "전송"
        
        bt.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: bt.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: bt.centerXAnchor).isActive = true
        bt.layer.cornerRadius = 15
        bt.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        bt.layer.borderWidth = 2
        bt.layer.masksToBounds = true
        bt.setBackgroundColor(UIColor.systemGray5, for: .highlighted)
        
        
        return bt
    }()
    
    
    func addview() {
        
        view.addSubview(maillayer)
        view.addSubview(mailname)
        view.addSubview(mailtitle)
        
        view.addSubview(mailtext)
        view.addSubview(sendmail)
        
   
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            
            mailname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            mailname.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 50),
            mailname.heightAnchor.constraint(equalTo: mailtitle.heightAnchor),
            mailname.widthAnchor.constraint(equalToConstant: 50),
            
            mailtitle.leadingAnchor.constraint(equalTo: mailname.trailingAnchor, constant: 10),
            mailtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            mailtitle.topAnchor.constraint(equalTo: mailname.topAnchor),
            mailtitle.heightAnchor.constraint(equalToConstant: 50),
            
            maillayer.leadingAnchor.constraint(equalTo: mailname.leadingAnchor, constant: -15),
            maillayer.topAnchor.constraint(equalTo: mailname.topAnchor, constant: -15),
            maillayer.bottomAnchor.constraint(equalTo: mailtitle.bottomAnchor, constant: 15),
            maillayer.trailingAnchor.constraint(equalTo: mailtitle.trailingAnchor, constant: 15),
            
            mailtext.leadingAnchor.constraint(equalTo: maillayer.leadingAnchor),
            mailtext.trailingAnchor.constraint(equalTo: maillayer.trailingAnchor),
            mailtext.topAnchor.constraint(equalTo:  maillayer.bottomAnchor, constant: 30),
            mailtext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            sendmail.leadingAnchor.constraint(equalTo: mailtext.leadingAnchor),
            sendmail.trailingAnchor.constraint(equalTo: maillayer.trailingAnchor),
            sendmail.topAnchor.constraint(equalTo: mailtext.bottomAnchor, constant: 30),
            sendmail.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            
        
        ])
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addview()
        layout()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.titleView = titleview
        
        sendmail.addTarget(self, action: #selector(sendEmailTapped(_:)), for: .touchUpInside)
        
        
        
        

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

extension MailViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        mailtext.resignFirstResponder()
    }
    
}


extension MailViewController: MFMailComposeViewControllerDelegate {
    
    @objc func sendEmailTapped(_ sender: UIButton) {
        
        
        if MFMailComposeViewController.canSendMail() {
            
            let VC = MFMailComposeViewController()
            VC.mailComposeDelegate = self
            VC.setToRecipients(["ssuny303@gmail.com"])
            VC.setSubject(mailtitle.text ?? "")
            VC.setMessageBody(mailtext.text, isHTML: false)
        }
        else {
            let alert = UIAlertController(title: "메일 전송", message: "메일 전송 실패", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "확인", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(alertaction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
}
