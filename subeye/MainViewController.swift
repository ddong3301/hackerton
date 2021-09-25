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
        totalview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        totalview.layer.cornerRadius = 15
        
        
        
       return totalview
    }()
    
    let titleview: UILabel = {
        let label = UILabel()
        
        label.text = "배방역"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        return label
    }()
    
    let recentimg: UIImageView = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        imgview.backgroundColor = .systemGray5
        
        
        return imgview
    }()
    
    let recenttitle: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "최근 이미지"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize:  20)
        label.backgroundColor = .white
        label.textAlignment = .center
        
        
        return label
    }()
    
    let imgtime: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "시간"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        
        
        
        return label
    }()
    
    let timelabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "2021-09-24 19:53"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        
        
        
        return label
    }()
    
    
    
    
    
    let btView: UIView = {
        let totalview = UIView()
        totalview.translatesAutoresizingMaskIntoConstraints = false
        
        totalview.layer.borderWidth = 2
        totalview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        totalview.layer.cornerRadius = 15
        
        
        
       return totalview
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
    
    let logoutbt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setTitle("Logout", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.setTitleColor(.systemGray4, for: .highlighted)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return bt
    }()
    
    
    
    func addView() {
        
        view.addSubview(totalView)
        view.addSubview(btView)
        
        totalView.addSubview(recentimg)
        totalView.addSubview(imgtime)
        totalView.addSubview(timelabel)
        
        view.addSubview(recenttitle)
        
    }
    
    
    
    func layout() {
        NSLayoutConstraint.activate([

        
            totalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            totalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            totalView.topAnchor.constraint(equalTo: view.topAnchor , constant: 130),
            totalView.heightAnchor.constraint(equalToConstant: 200),
            
            btView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btView.topAnchor.constraint(equalTo: totalView.bottomAnchor, constant: 10),
            btView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            
            
        
        ])
    }
    
    func recentlayout() {
        
        NSLayoutConstraint.activate([
        
            recenttitle.centerXAnchor.constraint(equalTo: totalView.centerXAnchor),
            recenttitle.topAnchor.constraint(equalTo: totalView.topAnchor, constant: -10),
            recenttitle.widthAnchor.constraint(equalToConstant: 130),
        
            recentimg.leadingAnchor.constraint(equalTo: totalView.leadingAnchor, constant: 20),
            recentimg.centerYAnchor.constraint(equalTo: totalView.centerYAnchor),
            recentimg.topAnchor.constraint(equalTo: recenttitle.topAnchor, constant: 40),
            recentimg.bottomAnchor.constraint(equalTo: totalView.bottomAnchor, constant: -40),
            recentimg.widthAnchor.constraint(equalTo: recentimg.heightAnchor, constant: 30),
            
            imgtime.leadingAnchor.constraint(equalTo: recentimg.trailingAnchor, constant: 20),
            imgtime.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
            imgtime.topAnchor.constraint(equalTo: recentimg.topAnchor),
            
            timelabel.leadingAnchor.constraint(equalTo: imgtime.leadingAnchor),
            timelabel.trailingAnchor.constraint(equalTo: totalView.trailingAnchor, constant: -10),
            timelabel.topAnchor.constraint(equalTo: imgtime.bottomAnchor, constant: 10),
    
        
        ])
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        layout()
        recentlayout()

        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        
        navigationItem.titleView = titleview
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userData)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoutbt)
        logoutbt.addTarget(self, action: #selector(backLoginview(_:)), for: .touchUpInside)
        let touch = UITapGestureRecognizer(target: self, action: #selector(touchtotalview(_:)))
        self.totalView.addGestureRecognizer(touch)

        
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

extension MainViewController {
    @objc func backLoginview(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    @objc func touchtotalview(_ sender: UIGestureRecognizer) {
        
        print("touch")
        
        
    }
}
