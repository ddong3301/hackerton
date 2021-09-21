//
//  MainViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/13.
//

import UIKit

class MainViewController: UIViewController {

    
    let totalView: UIView = {
        let totalview = UIView()
        totalview.translatesAutoresizingMaskIntoConstraints = false
        
        totalview.layer.borderWidth = 2
        totalview.layer.borderColor = UIColor.black.cgColor
        totalview.layer.cornerRadius = 15
        
        
        
       return totalview
    }()
    
    
    let stationLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "배방역"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        
        
        
       return label
    }()
    
    let btView: UIView = {
        let totalview = UIView()
        totalview.translatesAutoresizingMaskIntoConstraints = false
        
        totalview.layer.borderWidth = 2
        totalview.layer.borderColor = UIColor.black.cgColor
        totalview.layer.cornerRadius = 15
        
        
        
       return totalview
    }()
    
    
    func addView() {
        
        view.addSubview(totalView)
        view.addSubview(stationLabel)
        view.addSubview(btView)
        
        
        
        
    }
    
    
    
    
    
    
    func layout() {
        NSLayoutConstraint.activate([
            
            stationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        
            totalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            totalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            totalView.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 10),
            totalView.heightAnchor.constraint(equalToConstant: 200),
            
            btView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btView.topAnchor.constraint(equalTo: totalView.bottomAnchor, constant: 10),
            btView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        
        ])
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        layout()

        view.backgroundColor = .white
        navigationItem.title = "메인화면"
        
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
