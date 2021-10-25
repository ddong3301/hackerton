//
//  adminViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/20.
//

import UIKit
import DropDown

class adminVIewController: UIViewController {
    
    
    struct sende_num: Codable {
        
        var e_num: String
        
    }
    
    let userData: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setTitle("고준혁님", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.setTitleColor(.systemGray4, for: .highlighted)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        
        return bt
    }()

    
    let adminTableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        tableview.backgroundColor = .white
        tableview.register(adminTableViewCell.self, forCellReuseIdentifier: adminTableViewCell.identifier)
        
        tableview.rowHeight = 70
        tableview.separatorColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        tableview.separatorStyle = .singleLine
        
        tableview.layer.borderWidth = 2
        tableview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        tableview.layer.cornerRadius = 15

        
        return tableview
    }()
    
    func addviews() {
        
        view.addSubview(adminTableview)
        
        
        
    }
    
    
    func autolayout() {
        NSLayoutConstraint.activate([
        
            adminTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            adminTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            adminTableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            adminTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        

        ])
    }
    
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
        
        label.text = "가입 승인"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        return label
    }()
    
    let backbt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        bt.setTitle("홈으로 이동", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.setTitleColor(.systemGray4, for: .highlighted)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        bt.tintColor = .black
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userData)
        userData.addTarget(self, action: #selector(presentdrop(_:)), for: .touchUpInside)
        userData.setTitle(LoginDataSource.shared.summary?.name, for: .normal)
        
        addviews()
        autolayout()
        adminTableview.dataSource =  self
        adminTableview.delegate = self
        
        navigationItem.titleView = titleview
        navigationController?.navigationBar.tintColor = .black
        
        Users.shared.fetch {
            self.adminTableview.reloadData()
        }

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

extension adminVIewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Users.shared.sammery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: adminTableViewCell.identifier, for: indexPath) as? adminTableViewCell else {return UITableViewCell()}
        
        
        cell.adminnumber.text = Users.shared.sammery[indexPath.row].e_num
        cell.admintitle.text = Users.shared.sammery[indexPath.row].user_name
        
        let selectview  = UIView()
        selectview.backgroundColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 0.5)
        
        return  cell
    }
}


extension adminVIewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "로그인 관리", message: "", preferredStyle: .alert)
        let alertaction = UIAlertAction(title: "허락", style: .default) { (action) in
            
            self.changeUserAuth(e_num: Users.shared.sammery[indexPath.row].e_num)
            Users.shared.fetch {
                self.adminTableview.reloadData()
            }
            
        }
        
        let alertcancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(alertcancel)
        alert.addAction(alertaction)
        
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
                        
  
    }
 
}

extension adminVIewController {
    @objc func presentdrop(_ sender: UIButton) {

        dropDown.show()
        dropDown.anchorView = userData
        print("active")

        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
           
            print("선택한 아이템 : \(item)")
            print("인덱스 : \(index)")
            if index ==  0 {
                logout()
                
                LoginDataSource.cookies = []
                
                
            }else if index == 1 {
                
                let checkview = CheckUserViewController()
                navigationController?.pushViewController(checkview, animated: true)
            }
        }
    }
    
    @objc func adminVIewController(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func changeUserAuth(e_num: String) {
            
            guard let url = URL(string: "https://subeye.herokuapp.com/changeUserAuth") else {
                print("nil")
                return
            }
        let comment = sende_num(e_num: e_num)
            print(comment)
            guard let uploadData = try? JSONEncoder().encode(comment) else { return }
            
            var request = URLRequest.init(url: url)
        
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = uploadData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let e = error{
                    NSLog("two error: \(e.localizedDescription)")
                    return
                }
                print(response)
                print("Success sent e_num")
            }
            task.resume()
            
            
        }
    
    func logout() {
        
        
        let logoutalert = UIAlertController(title: "로그아웃", message: "정말 로그아웃 하시겟습니까?", preferredStyle: .alert)
        let Okaction = UIAlertAction(title: "확인", style: .cancel) { (action) in
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
        
        let cancelaction = UIAlertAction(title: "취소", style: .default) { (action) in
            print("logout cancel")
        }
        
        logoutalert.addAction(Okaction)
        logoutalert.addAction(cancelaction)
        
        self.present(logoutalert, animated: true, completion: nil)
        
        

    }

}
