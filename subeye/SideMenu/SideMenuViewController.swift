//
//  SideMenuViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/30.
//

import UIKit

class SideMenuViewController: UIViewController {

    let sidemenuLabels = ["Home","공지사항","고객센터", "앱 설명"]
    
    let icons = [UIImage(named: "22.png"), UIImage(named: "26.png"), UIImage(named: "24.png"), UIImage(named: "23.png")]
    
    let simbol: UIImageView  = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        
        imgview.image = UIImage(named: "SUBEYE2")
        imgview.contentMode = .scaleAspectFit
        
        
        return imgview
    }()
    
    let sidetableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        tv.rowHeight = 80
        tv.register(SideViewTableViewCell.self, forCellReuseIdentifier: SideViewTableViewCell.identifer)
        tv.separatorStyle = .none
        tv.isScrollEnabled = false
        
        
        return tv
    }()
    
    
    func addviews() {
        
        
        view.addSubview(sidetableView)
        view.addSubview(simbol)
        
    }
    
    
    func layout() {
        NSLayoutConstraint.activate([
            
            sidetableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sidetableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:  -20),
            sidetableView.topAnchor.constraint(equalTo: simbol.bottomAnchor, constant: 30),
            sidetableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            simbol.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            simbol.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            simbol.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        
        ])
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addviews()
        layout()
        sidetableView.dataSource = self
        sidetableView.delegate = self
        
        view.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 100/255, alpha: 1).cgColor
        view.layer.borderWidth = 2
        
    
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(red: 123/255, green: 180/255, blue: 100/255, alpha: 1)

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

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sidemenuLabels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideViewTableViewCell.identifer, for: indexPath) as? SideViewTableViewCell else { return UITableViewCell() }
        
        let backgroundcolor = UIView()
        backgroundcolor.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundcolor
        cell.menuLabel.text = sidemenuLabels[indexPath.row]
        cell.menuicons.image = icons[indexPath.row]
        return cell
    }



}

extension SideMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.row {
            case 0:
                dismiss(animated: true, completion: nil)
            case 1:
                print("present 공지사항")
                
                let notice = NoticeListViewController()
                
                notice.modalTransitionStyle = .crossDissolve
                notice.modalPresentationStyle = .fullScreen
                
                dismiss(animated: false, completion: nil)
                navigationController?.pushViewController(notice, animated: true)
                
                
               
                
                
                
            case 2:
                print("present 통계")
            case 3:
                print("present 고객센터")
            default:
                return
        }
    }
    
        
}
