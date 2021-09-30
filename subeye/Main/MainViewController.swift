//
//  MainViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/13.
//

import UIKit
import Lottie


class MainViewController: UIViewController {
    
    let datas = imageset.generateData()
    
    let animationView: AnimationView = {
        let train = AnimationView(name: "34593-train-animation")
        train.translatesAutoresizingMaskIntoConstraints = false
        
        train.contentMode = .scaleAspectFit
        train.layer.masksToBounds  = true
        train.animationSpeed = 0.5
        train.play()
        train.loopMode = .loop
        
        
        return train
    }()
    
    
    
    let totalView: UIButton = {
        let totalview = UIButton()
        totalview.translatesAutoresizingMaskIntoConstraints = false
        
        
        totalview.setBackgroundColor(UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 0.5), for: .highlighted)
        
        totalview.layer.borderWidth = 2
        totalview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        totalview.layer.cornerRadius = 15
        totalview.layer.masksToBounds =  true
        totalview.backgroundColor = .white
        
        
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
        
        label.text = "선택 이미지"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize:  20)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        
        return label
    }()
    
    let imgtime: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "시간 :"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        
        
        
        return label
    }()
    
    
    
    
    let timelabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "09-24 19:53"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        
        
        
        return label
    }()
    
    let outNum: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "출구 번호 :"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        
        
        
        return label
    }()
    
    
    
    
    let userOutNum: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        
        
        
        return label
    }()
    
    
    
    
    let imgTableview: UITableView = {
        let totalview = UITableView()
        totalview.translatesAutoresizingMaskIntoConstraints = false
        
        totalview.layer.borderWidth = 2
        totalview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        totalview.layer.cornerRadius = 15
        
        totalview.separatorStyle = .none
        totalview.rowHeight = 80
        
        
        totalview.register(ImgTableViewCell.self, forCellReuseIdentifier: ImgTableViewCell.identifer)
        
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
    
    let developer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "This app develop by Didimdol project hackerton"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .gray
        
        
        return label
    }()
    
    let Suspicion: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "의심 확률 :"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        
        
        return label
    }()
    
    let imgSuspicion: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "어린이가 아님"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        
        
        return label
    }()
    
    
    func addView() {
        view.addSubview(animationView)
        view.addSubview(totalView)
        view.addSubview(imgTableview)
        view.addSubview(developer)
        
        totalView.addSubview(recentimg)
        totalView.addSubview(imgtime)
        totalView.addSubview(timelabel)
        totalView.addSubview(outNum)
        totalView.addSubview(userOutNum)
        totalView.addSubview(Suspicion)
        totalView.addSubview(imgSuspicion)
        
        view.addSubview(recenttitle)
        
    }
    
    
    
    func layout() {
        NSLayoutConstraint.activate([

            animationView.topAnchor.constraint(equalTo: view.topAnchor, constant: (navigationController?.navigationBar.frame.height)! + 50),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            
            totalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            totalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            totalView.topAnchor.constraint(equalTo: animationView.bottomAnchor , constant: -120),
            totalView.heightAnchor.constraint(equalToConstant: 200),
            
            imgTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imgTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imgTableview.topAnchor.constraint(equalTo: totalView.bottomAnchor, constant: 10),
            imgTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            developer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            developer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
        
        ])
    }
    
    func recentlayout() {
        
        NSLayoutConstraint.activate([
        
            recenttitle.centerXAnchor.constraint(equalTo: totalView.centerXAnchor),
            recenttitle.topAnchor.constraint(equalTo: totalView.topAnchor, constant: 15),
            recenttitle.widthAnchor.constraint(equalToConstant: 130),
        
            recentimg.leadingAnchor.constraint(equalTo: totalView.leadingAnchor, constant: 20),
            recentimg.centerYAnchor.constraint(equalTo: totalView.centerYAnchor),
            recentimg.topAnchor.constraint(equalTo: recenttitle.topAnchor, constant: 40),
            recentimg.bottomAnchor.constraint(equalTo: totalView.bottomAnchor, constant: -40),
            recentimg.widthAnchor.constraint(equalTo: recentimg.heightAnchor, constant: 30),
            
            imgtime.leadingAnchor.constraint(equalTo: recentimg.trailingAnchor, constant: 20),
            imgtime.topAnchor.constraint(equalTo: recentimg.topAnchor),
            
            timelabel.leadingAnchor.constraint(equalTo: imgtime.trailingAnchor, constant: 10),
            timelabel.topAnchor.constraint(equalTo: imgtime.topAnchor, constant: 0),
            
            outNum.leadingAnchor.constraint(equalTo: imgtime.leadingAnchor),
            outNum.topAnchor.constraint(equalTo: imgtime.bottomAnchor, constant: 20),
            
            userOutNum.leadingAnchor.constraint(equalTo: outNum.trailingAnchor, constant: 10),
            userOutNum.topAnchor.constraint(equalTo: outNum.topAnchor),
            
            Suspicion.leadingAnchor.constraint(equalTo: imgtime.leadingAnchor),
            Suspicion.topAnchor.constraint(equalTo: outNum.bottomAnchor, constant: 20),
            
            imgSuspicion.leadingAnchor.constraint(equalTo: Suspicion.trailingAnchor, constant: 10),
            imgSuspicion.topAnchor.constraint(equalTo: Suspicion.topAnchor),
            
        
        ])
    }
    
    func menulayout() {
        
        
        
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        layout()
        recentlayout()
        menulayout()

        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        
        navigationItem.titleView = titleview
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userData)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoutbt)
        logoutbt.addTarget(self, action: #selector(backLoginview(_:)), for: .touchUpInside)
        totalView.addTarget(self, action: #selector(touchtotalview(_:)), for: .touchUpInside)
        imgTableview.dataSource =  self
        imgTableview.delegate = self
        
        timelabel.text = datas[0].imagetime
        userOutNum.text = String(datas[0].outNumber)
        imgSuspicion.text = String(datas[0].suspicion)
        
        
        
        
        
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
    
    @objc func touchtotalview(_ sender: UIButton) {
        
        print("touch")
        
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImgTableViewCell.identifer, for: indexPath) as? ImgTableViewCell else {return UITableViewCell()}
        
        cell.timelabel.text = datas[indexPath.row + 1].imagetime
        let selectview  = UIView()
        selectview.backgroundColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 0.5)
        cell.selectedBackgroundView = selectview
        
        return  cell
    }
}
    
extension MainViewController: UITableViewDelegate {
    
 
    
        
        
        
        
        
        
        
}
    
    


