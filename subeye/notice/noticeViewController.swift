//
//  noticeViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/03.
//

import UIKit
import DropDown

class noticeViewController: UIViewController {
    
    let noticetitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .black
        label.text = "10월 4일 공지"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        
        
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        label.layer.cornerRadius = 15
        
        
        
        return label
    }()
    
    let noticetext: UITextView =  {
        let text = UITextView()
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 20)
        text.text = "10월 4일 업데이트 입니다. 공지사항이 추가되었고 side menu가 완성되었습니다."
        text.backgroundColor = .systemGray6
        text.isEditable = false
        
        text.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        text.layer.borderWidth = 2
        text.layer.cornerRadius = 15
        
        return text
    }()
    
    
    let dropDown: DropDown = {
        let dropDown = DropDown()

        dropDown.textFont = UIFont.boldSystemFont(ofSize: 20)
        dropDown.bottomOffset = CGPoint(x: 0, y: 40)
        dropDown.direction = .bottom
        dropDown.dataSource = ["Logout","사용자 정보"]
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 15
        
        
       return dropDown
    }()
    
    let titleview: UILabel = {
        let label = UILabel()
        
        label.text = "공지사항"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        return label
    }()
    
    let userData: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setTitle("고준혁님", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.setTitleColor(.systemGray4, for: .highlighted)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        
        return bt
    }()
    
    let backbt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setTitle("Home ", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.setTitleColor(.systemGray4, for: .highlighted)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return bt
    }()
    
    
    
    
    func addview() {
        
        view.addSubview(noticetitle)
        view.addSubview(noticetext)
        
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
        
            noticetitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            noticetitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            noticetitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            noticetitle.heightAnchor.constraint(equalToConstant: 70),
            
            noticetext.leadingAnchor.constraint(equalTo: noticetitle.leadingAnchor, constant: -20),
            noticetext.trailingAnchor.constraint(equalTo: noticetitle.trailingAnchor, constant: 20),
            noticetext.topAnchor.constraint(equalTo: noticetitle.bottomAnchor, constant: 30),
            noticetext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
        
        
        
        
        ])
 
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        addview()
        autolayout()
        navigationController?.navigationBar.barTintColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        
        navigationItem.titleView = titleview
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userData)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbt)
        
        backbt.addTarget(self, action: #selector(presentsidemenu(_:)), for: .touchUpInside)
        userData.addTarget(self, action: #selector(presentdrop(_:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    

    

}

extension noticeViewController {
    
    
    @objc func presentdrop(_ sender: UIButton) {

        dropDown.show()
        dropDown.anchorView = userData
        print("active")

        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
           
            print("선택한 아이템 : \(item)")
            print("인덱스 : \(index)")
            if index ==  0 {
                
                dismiss(animated: true, completion: nil)
                
                
                
            }
        }
    }
    @objc func presentsidemenu(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
