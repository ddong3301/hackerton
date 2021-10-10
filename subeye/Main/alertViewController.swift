//
//  alertViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/04.
//

import UIKit

class alertViewController: UIViewController {

    
    let alertview : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        
        
        
        return view
    }()
    
    func addviews() {
        
        view.addSubview(alertview)
        
        
        
    }
    
    func layout() {
        NSLayoutConstraint.activate([
        
            alertview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            alertview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            alertview.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            alertview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        
        
        ])
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black.withAlphaComponent(0.5)
        
        addviews()
        layout()
        
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
