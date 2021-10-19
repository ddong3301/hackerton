//
//  alertViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/10/04.
//

import UIKit

class alertViewController: UIViewController {

    let dissmissbt: UIButton = {
        let bt = UIButton()
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(systemName: "xmark"), for: .normal)
        bt.tintColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        
        return bt
    }()
    
    let alertview : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        
        
        
        return view
    }()
    
    let titleimg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .gray
    
        return img
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "시간 :"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        
        return label
    }()
    
    let imgdate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "2021.10.21 15:30"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        
        return label
    }()
    
    let gate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "게이트 번호 : "
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        
        return label
    }()
    
    let gateNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "1"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        
        return label
    }()
    
    let cctv: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "cctv 번호 : "
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        
        return label
    }()
    
    let cctvnumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "1"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        
        return label
    }()
    
    let cuase: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "의심 사유 : "
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        
        return label
    }()
    
    let cuaseString: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "어린이표 사용"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .red
        
        
        return label
    }()
    
    
    func addviews() {
        
        view.addSubview(alertview)
        alertview.addSubview(titleimg)
        alertview.addSubview(date)
        alertview.addSubview(imgdate)
        alertview.addSubview(dissmissbt)
        alertview.addSubview(gate)
        alertview.addSubview(gateNumber)
        alertview.addSubview(cuase)
        alertview.addSubview(cuaseString)
        alertview.addSubview(cctv)
        alertview.addSubview(cctvnumber)

    }
    
    func layout() {
        NSLayoutConstraint.activate([
        
            alertview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            alertview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            alertview.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            alertview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            dissmissbt.leadingAnchor.constraint(equalTo: alertview.leadingAnchor, constant: 10),
            dissmissbt.topAnchor.constraint(equalTo: alertview.topAnchor, constant: 10),
            
            titleimg.leadingAnchor.constraint(equalTo: alertview.leadingAnchor, constant: 30),
            titleimg.trailingAnchor.constraint(equalTo: alertview.trailingAnchor, constant: -30),
            titleimg.topAnchor.constraint(equalTo: alertview.topAnchor, constant: 50),
            titleimg.heightAnchor.constraint(equalToConstant: 200),
            
            date.leadingAnchor.constraint(equalTo: titleimg.leadingAnchor, constant: 10),
            date.topAnchor.constraint(equalTo: titleimg.bottomAnchor, constant: 20),
            
            imgdate.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 10),
            imgdate.topAnchor.constraint(equalTo: date.topAnchor),
            
            gate.leadingAnchor.constraint(equalTo: date.leadingAnchor),
            gate.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 10),
            
            gateNumber.leadingAnchor.constraint(equalTo: gate.trailingAnchor ,constant: 10),
            gateNumber.topAnchor.constraint(equalTo: gate.topAnchor),
            
            cctv.leadingAnchor.constraint(equalTo: gate.leadingAnchor),
            cctv.topAnchor.constraint(equalTo: gate.bottomAnchor, constant: 10),
            
            cctvnumber.leadingAnchor.constraint(equalTo: cctv.trailingAnchor, constant: 10),
            cctvnumber.topAnchor.constraint(equalTo: cctv.topAnchor),
            
            cuase.leadingAnchor.constraint(equalTo: gate.leadingAnchor),
            cuase.topAnchor.constraint(equalTo: cctv.bottomAnchor, constant: 10),
            
            cuaseString.leadingAnchor.constraint(equalTo: cuase.trailingAnchor, constant: 10),
            cuaseString.topAnchor.constraint(equalTo: cuase.topAnchor),
            
        
        
        ])
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black.withAlphaComponent(0.5)
        
        let url = URL(string: geturl.shared.imgpath[MainViewController.indexnum].path)
        let data = try? Data(contentsOf: url!)
        titleimg.image = UIImage(data: data!)
        imgdate.text = geturl.shared.imgpath[MainViewController.indexnum].date
        dissmissbt.addTarget(self, action: #selector(dissmissalert(_:)), for: .touchUpInside)
        
        addviews()
        layout()
        
        gateNumber.text = String(geturl.shared.imgpath[MainViewController.indexnum].gate)
        let num = geturl.shared.imgpath[MainViewController.indexnum].cctv ?? 1
        cctvnumber.text = String(num)
        
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

extension alertViewController {
    
    @objc func dissmissalert(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
   
    }
   
}
