//
//  NoticeListViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/10.
//

import UIKit
import DropDown

class NoticeListViewController: UIViewController {
    
    
    let userData: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setTitle("고준혁님", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.setTitleColor(.systemGray4, for: .highlighted)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        
        return bt
    }()

    
    let noticeTableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        tableview.backgroundColor = .white
        tableview.register(noticeTableViewCell.self, forCellReuseIdentifier: noticeTableViewCell.identifier)
        
        tableview.rowHeight = 70
        tableview.separatorColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        tableview.separatorStyle = .singleLine
        
        tableview.layer.borderWidth = 2
        tableview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        tableview.layer.cornerRadius = 15

        
        return tableview
    }()
    
    func addviews() {
        
        view.addSubview(noticeTableview)
        
        
        
    }
    
    
    func autolayout() {
        NSLayoutConstraint.activate([
        
            noticeTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            noticeTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            noticeTableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            noticeTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        
            
            
            
        
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
        
        label.text = "공지사항"
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbt)
        backbt.addTarget(self, action: #selector(presentsidemenu(_:)), for: .touchUpInside)
        userData.addTarget(self, action: #selector(presentdrop(_:)), for: .touchUpInside)
        userData.setTitle(LoginDataSource.shared.summary?.name, for: .normal)
        
        addviews()
        autolayout()
        noticeTableview.dataSource =  self
        noticeTableview.delegate = self
        
        navigationItem.titleView = titleview
        
        Noticetitle.shared.fetch {
            
            self.noticeTableview.reloadData()
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

extension NoticeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Noticetitle.shared.notice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: noticeTableViewCell.identifier, for: indexPath) as? noticeTableViewCell else {return UITableViewCell()}
        
        
        cell.noticenumber.text = String(Noticetitle.shared.notice[indexPath.row].number)
        
        cell.noticetitle.text = Noticetitle.shared.notice[indexPath.row].title
        
        
        
        
        return  cell
    }
}


extension NoticeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let noticeview = noticeViewController()
        noticeview.noticetext.text = Noticetitle.shared.notice[indexPath.row].content
        noticeview.noticetitle.text  = Noticetitle.shared.notice[indexPath.row].title
        
        navigationController?.pushViewController(noticeview, animated: true)
    }
    
    
    
}

extension NoticeListViewController {
    @objc func presentdrop(_ sender: UIButton) {

        dropDown.show()
        dropDown.anchorView = userData
        print("active")

        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
           
            print("선택한 아이템 : \(item)")
            print("인덱스 : \(index)")
            if index ==  0 {
                
                dismiss(animated: true, completion: nil)
                
                
                
            }else if index == 1 {
                
                
                let checkview = CheckUserViewController()
                navigationController?.pushViewController(checkview, animated: true)
            }
        }
    }
    
    @objc func presentsidemenu(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }

}
