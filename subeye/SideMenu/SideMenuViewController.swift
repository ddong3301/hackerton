//
//  SideMenuViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/30.
//

import UIKit

class SideMenuViewController: UIViewController {

    
    
    let simbol: UIImageView  = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return imgview
    }()
    
    let sidetableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        tv.rowHeight = 80
        
        
        return tv
    }()
    
    
    func addviews() {
        
        
        view.addSubview(sidetableView)
        
    }
    
    
    func layout() {
        NSLayoutConstraint.activate([
            
            sidetableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sidetableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:  -20),
            sidetableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            sidetableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addviews()
        layout()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)

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
