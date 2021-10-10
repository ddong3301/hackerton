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
        
        tableview.backgroundColor = .white
        
        
        
        return tableview
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
