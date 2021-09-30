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
        
        
        
        return tv
    }()
    
    
    func addviews() {
        
        
        view.addSubview(sidetableView)
        
    }
    
    
    func layout() {
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addviews()
        layout()

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
