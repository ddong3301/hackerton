//
//  NoticeListViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/10.
//

import UIKit

class NoticeListViewController: UIViewController {
    
    
    
    
    let noticelist: UITableView = {
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
        
        view.addSubview(noticelist)
        
        
        
    }
    
    
    func autolayout() {
        NSLayoutConstraint.activate([
        
            noticelist.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            noticelist.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            noticelist.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            noticelist.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        
            
            
            
        
        ])
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addviews()
        autolayout()
        noticelist.dataSource =  self
        noticelist.delegate = self
        
        navigationItem.title = "공지사항"
        
        Noticetitle.shared.fetch {
            
            self.noticelist.reloadData()
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
        <#code#>
    }
    
    
    
}
