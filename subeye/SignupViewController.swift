//
//  SignupViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/17.
//

import UIKit

class SignupViewController: UIViewController, UITableViewDelegate {
    
    let space: CGFloat = 5
    
    let areas = ["배방역","서울역","아산역","천안아산역"]
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "SubEye"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 70)
        
        return label
    }()
    
    let idtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이디"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let idview : UIView = {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.layer.borderWidth = 3
        subview.layer.borderColor = UIColor.black.cgColor
        subview.layer.cornerRadius = 15
        
        
        return subview
    }()
    
    let idTF: UITextField = {
        let TF = UITextField()
        TF.translatesAutoresizingMaskIntoConstraints = false
        
        TF.borderStyle = .none
        
        
        TF.placeholder = "아이디를 입력하세요."
        
        TF.font = UIFont.systemFont(ofSize: 15)
        TF.textColor = .black
        
        return TF
    }()
    
    
    let idcheckBT: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        
        bt.setBackgroundColor(.lightGray, for: .highlighted)
        
        
        bt.layer.borderColor = UIColor.black.cgColor
        bt.layer.borderWidth = 3
        bt.layer.cornerRadius = 15
        bt.layer.masksToBounds = true
        
        
        
        bt.setTitle("중복 체크", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 15)
       
    
        
        return bt
    }()

    let passtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "비밀번호"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let passview : UIView = {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.layer.borderWidth = 3
        subview.layer.borderColor = UIColor.black.cgColor
        subview.layer.cornerRadius = 15
        
        
        return subview
    }()
    
    let passTF: UITextField = {
        let TF = UITextField()
        TF.translatesAutoresizingMaskIntoConstraints = false
        
        TF.borderStyle = .none
        
        
        TF.placeholder = "비밀번호를 입력하세요."
        
        TF.font = UIFont.systemFont(ofSize: 15)
        TF.textColor = .black
        
        return TF
    }()
    
    let areatitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "지역"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let areaview : UIView = {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.layer.borderWidth = 3
        subview.layer.borderColor = UIColor.black.cgColor
        subview.layer.cornerRadius = 15
        
        
        return subview
    }()
    
    let areaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "지역을 선택해주세요"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        
        return label
    }()
    
    let areabt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setImage(UIImage(systemName: "arrowtriangle.down"), for:.normal )
        bt.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .highlighted)
        bt.tintColor = .black
        
        
        return bt
    }()
    
    let alertTableview : UIView = {
        let tableview = UIView()
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        tableview.layer.borderWidth = 2
        tableview.layer.borderColor = UIColor.black.cgColor
        tableview.layer.cornerRadius = 15
        
        tableview.isHidden = true
            
        return tableview
    }()
    
    let tableview: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(areacell.self, forCellReuseIdentifier: "areacellidentifier")
        return table
    }()
    
    
    
    
    func addviews(){
        
        view.addSubview(idview)
        view.addSubview(titleLabel)
        view.addSubview(idTF)
        view.addSubview(idcheckBT)
        view.addSubview(idtitle)
        
        view.addSubview(passview)
        view.addSubview(passTF)
        view.addSubview(passtitle)
        
        view.addSubview(areatitle)
        view.addSubview(areaview)
        view.addSubview(alertTableview)
        areaview.addSubview(areaLabel)
        areaview.addSubview(areabt)
        
        alertTableview.addSubview(tableview)
        
        
    }
    
    
    
    func IDlayout() {
        NSLayoutConstraint.activate([
            
        
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            idTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            idTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            idTF.widthAnchor.constraint(equalToConstant: 250),
            idTF.heightAnchor.constraint(equalToConstant: 40),
            
            idview.leadingAnchor.constraint(equalTo: idTF.leadingAnchor, constant: -space - 5),
            idview.topAnchor.constraint(equalTo: idTF.topAnchor, constant: -space),
            idview.trailingAnchor.constraint(equalTo: idTF.trailingAnchor, constant: space),
            idview.bottomAnchor.constraint(equalTo: idTF.bottomAnchor, constant: space),
            
            idcheckBT.leadingAnchor.constraint(equalTo: idTF.trailingAnchor, constant: 30),
            idcheckBT.topAnchor.constraint(equalTo: idview.topAnchor),
            idcheckBT.heightAnchor.constraint(equalTo: idview.heightAnchor),
            idcheckBT.widthAnchor.constraint(equalToConstant: 70),
            
            idtitle.leadingAnchor.constraint(equalTo: idTF.leadingAnchor,constant:  5),
            idtitle.bottomAnchor.constraint(equalTo: idview.topAnchor,constant: -5),
            
        ])
    }
    
    func passlayout() {
        NSLayoutConstraint.activate([
        
            passview.leadingAnchor.constraint(equalTo: idview.leadingAnchor),
            passview.trailingAnchor.constraint(equalTo: idview.trailingAnchor),
            passview.topAnchor.constraint(equalTo: passTF.topAnchor, constant: -space),
            passview.bottomAnchor.constraint(equalTo: passTF.bottomAnchor, constant: space),
            
            passTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passTF.topAnchor.constraint(equalTo: idview.bottomAnchor, constant: 50),
            passTF.widthAnchor.constraint(equalToConstant: 250),
            passTF.heightAnchor.constraint(equalToConstant: 40),
            
            passtitle.leadingAnchor.constraint(equalTo: idtitle.leadingAnchor),
            passtitle.trailingAnchor.constraint(equalTo: idtitle.trailingAnchor),
            passtitle.bottomAnchor.constraint(equalTo: passview.topAnchor,constant: -5),
        
        ])
    }
    
    func arealayout() {
        NSLayoutConstraint.activate([
        
            areatitle.leadingAnchor.constraint(equalTo: idtitle.leadingAnchor),
            areatitle.trailingAnchor.constraint(equalTo: idtitle.trailingAnchor),
            areatitle.topAnchor.constraint(equalTo: passview.bottomAnchor, constant: 20),
            
            areaview.leadingAnchor.constraint(equalTo: idview.leadingAnchor),
            areaview.trailingAnchor.constraint(equalTo: idview.trailingAnchor),
            areaview.widthAnchor.constraint(equalTo: idview.widthAnchor),
            areaview.heightAnchor.constraint(equalTo: idview.heightAnchor),
            areaview.topAnchor.constraint(equalTo: areatitle.bottomAnchor, constant: 5),
            
            areaLabel.leadingAnchor.constraint(equalTo: areaview.leadingAnchor, constant: 10),
            areaLabel.trailingAnchor.constraint(equalTo: areaview.trailingAnchor, constant: -20),
            areaLabel.centerYAnchor.constraint(equalTo: areaview.centerYAnchor),
            
            areabt.centerYAnchor.constraint(equalTo: areaview.centerYAnchor),
            areabt.trailingAnchor.constraint(equalTo: areaview.trailingAnchor, constant: -20),
            
            alertTableview.leadingAnchor.constraint(equalTo: areaview.leadingAnchor),
            alertTableview.trailingAnchor.constraint(equalTo: areaview.trailingAnchor),
            alertTableview.topAnchor.constraint(equalTo: areaview.bottomAnchor, constant: 10),
            alertTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),

            
        ])
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        addviews()
        IDlayout()
        passlayout()
        arealayout()
        
        areabt.addTarget(self, action: #selector(showtableview(_:)), for: .touchDown)

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



extension SignupViewController {
    
    @objc func showtableview(_ sender: UIButton) {
        
        alertTableview.isHidden = false

    }
}


extension SignupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}


class areacell: UITableViewCell {
    
    let cellkey = "areacellidentifier"
    
    
    
    
    
    
}
