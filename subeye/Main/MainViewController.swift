//
//  MainViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/13.
//

import UIKit
import Lottie
import DropDown
import SideMenu


class MainViewController: UIViewController {
    
    let datas = imageset.generateData()
    
    
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
        
        label.text = "최근 이미지"
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
        
        bt.setImage(UIImage(named: "11.png"), for: .normal)
        
        
//        bt.setTitle("MENU", for: .normal)
//        bt.setTitleColor(.black, for: .normal)
//        bt.setTitleColor(.systemGray4, for: .highlighted)
//        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
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
        
        
        logoutbt.addTarget(self, action: #selector(presentsidemenu(_:)), for: .touchUpInside)
        totalView.addTarget(self, action: #selector(touchtotalview(_:)), for: .touchUpInside)
        userData.addTarget(self, action: #selector(presentdrop(_:)), for: .touchUpInside)
        
        imgTableview.dataSource =  self
        imgTableview.delegate = self
        
        userOutNum.text = String(datas[0].outNumber)
        imgSuspicion.text = String(datas[0].suspicion)
        
        animationView.play()
        
        
        geturl.shared.fetch {
            print(geturl.shared.imgpath.count)
            print(geturl.shared.imgpath)
            
            self.view.reloadInputViews()
            
            let url = URL(string: "https://subeye.herokuapp.com/\(geturl.shared.imgpath[0].path)")
            let data = try? Data(contentsOf: url!)
            //self.recentimg.image = UIImage(data: data!)
            self.timelabel.text = geturl.shared.imgpath[0].date
            
            
        }
        
        
        

        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        animationView.play()
        print("apear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        print("disapear")
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
        
        let alertview = alertViewController()
        
        alertview.modalPresentationStyle = .overFullScreen
        alertview.modalTransitionStyle = .crossDissolve
        present(alertview, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    @objc func presentdrop(_ sender: UIButton) {

        dropDown.show()
        dropDown.anchorView = userData
        print("active")

        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
           
            print("선택한 아이템 : \(item)")
            print("인덱스 : \(index)")
            if index ==  0 {
                
                logout()
                
                
                
                
            }
        }
    }
    @objc func presentsidemenu(_ sender: UIButton) {
        
        let menu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        
        menu.leftSide = true
        menu.presentationStyle = .menuSlideIn
        menu.menuWidth = view.frame.width/3 * 2
        
        
        
        
        present(menu, animated: true, completion: nil)
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return geturl.shared.imgpath.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImgTableViewCell.identifer, for: indexPath) as? ImgTableViewCell else {return UITableViewCell()}
        
        cell.timelabel.text = datas[indexPath.row + 1].imagetime
        
        let url = URL(string: "https://subeye.herokuapp.com/\(geturl.shared.imgpath[indexPath.row + 1])")
        let data = try? Data(contentsOf: url!)
        cell.images.image = UIImage(data: data!)
        cell.imgTime.text = geturl.shared.imgpath[indexPath.row + 1].date
        
        
        let selectview  = UIView()
        selectview.backgroundColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 0.5)
        cell.selectedBackgroundView = selectview
        
        return  cell
    }
}
    
extension MainViewController: UITableViewDelegate {
    
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
    
    


