//
//  SignupViewController.swift
//  subeye
//
//  Created by 고준혁 on 2021/09/17.
//

import UIKit

class SignupViewController: UIViewController {
    
    let space: CGFloat = 10
    
    let indentifier = "SignupTableViewCell"
    
    let areas = ["배방역","서울역","아산역","천안아산역", "천안역", "신창역","수원역"]
    
    var btatate = 1
    
    static var area = "배방역"
    
    let tapview: UIView = {
        let tapview = UIView()
        tapview.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return tapview
    }()
    
    let backbt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.tintColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        
        bt.setImage(UIImage(systemName: "arrowtriangle.left"), for: .normal)
        bt.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .highlighted)
        
        return bt
    }()
    
    let titleLabel: UIImageView = {
        let label = UIImageView()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.image = UIImage(named: "SUBEYE2")
        
        
        
        return label
    }()
    
    let idtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "사번"
        label.textColor = .black
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let idview : UIView = {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.layer.borderWidth = 2
        subview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        subview.layer.cornerRadius = 15
        
        
        return subview
    }()
    
    let idTF: UITextField = {
        let TF = UITextField()
        TF.translatesAutoresizingMaskIntoConstraints = false
        
        TF.borderStyle = .none
        
        
        TF.placeholder = "사번을 입력하세요."
        
        TF.font = UIFont.systemFont(ofSize: 15)
        TF.textColor = .black
        
        return TF
    }()
    
    
    let idcheckBT: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        
        bt.setBackgroundColor(.systemGray5, for: .highlighted)
        
        
        bt.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        bt.layer.borderWidth = 2
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
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let passview : UIView = {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.layer.borderWidth = 2
        subview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        subview.layer.cornerRadius = 15
        
        
        return subview
    }()
    
    let passTF: UITextField = {
        let TF = UITextField()
        TF.translatesAutoresizingMaskIntoConstraints = false
        
        TF.borderStyle = .none
        TF.isSecureTextEntry = true
        
        
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
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let areaview : UIView = {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.layer.borderWidth = 2
        subview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
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
        bt.tintColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1)
        
        return bt
    }()
    
    let alertTableview : UIView = {
        let tableview = UIView()
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        tableview.layer.borderWidth = 2
        tableview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        tableview.layer.cornerRadius = 15
        
        tableview.isHidden = true
            
        return tableview
    }()
    
    let tableview: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(SignupTableViewCell.self, forCellReuseIdentifier: "SignupTableViewCell")
        
        return table
    }()
    
    let loginbt: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.setTitle("SIGN UP", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        bt.setTitleColor(.black, for: .normal)
        
        bt.layer.cornerRadius = 15
        bt.layer.borderWidth = 2
        bt.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        bt.layer.masksToBounds = true
        
        bt.setBackgroundColor(.systemGray5, for: .highlighted)
        
        
        return bt
    }()
    
    let alertCheckId = UIAlertController(title: "사번 확인", message: "정상적인 사번입니다..", preferredStyle: .alert)
    
    let nametitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "이름"
        label.textColor = .black
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let nameview : UIView = {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.layer.borderWidth = 2
        subview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        subview.layer.cornerRadius = 15
        
        
        return subview
    }()
    
    let nameTF: UITextField = {
        let TF = UITextField()
        TF.translatesAutoresizingMaskIntoConstraints = false
        
        TF.borderStyle = .none
        
        TF.placeholder = "이름을 입력하세요."
        
        TF.font = UIFont.systemFont(ofSize: 15)
        TF.textColor = .black
        
        return TF
    }()
    
    let phonetitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "핸드폰 번호"
        label.textColor = .black
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let phoneview : UIView = {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.layer.borderWidth = 2
        subview.layer.borderColor = UIColor(red: 123/255, green: 180/255, blue: 72/255, alpha: 1).cgColor
        subview.layer.cornerRadius = 15
        
        
        return subview
    }()
    
    let phoneTF: UITextField = {
        let TF = UITextField()
        TF.translatesAutoresizingMaskIntoConstraints = false
        
        TF.borderStyle = .none
        
        TF.placeholder = "핸드폰번호를 입력하세요."
        
        TF.font = UIFont.systemFont(ofSize: 15)
        TF.textColor = .black
        
        return TF
    }()

    
    
    func addviews(){
        
        view.addSubview(tapview)
        
        view.addSubview(loginbt)
        
        view.addSubview(backbt)
        view.addSubview(idview)
        view.addSubview(titleLabel)
        view.addSubview(idTF)
        view.addSubview(idcheckBT)
        view.addSubview(idtitle)
        
        view.addSubview(passview)
        view.addSubview(passTF)
        view.addSubview(passtitle)
        
       
        
        
        view.addSubview(nametitle)
        view.addSubview(nameview)
        view.addSubview(nameTF)
        
        view.addSubview(phonetitle)
        view.addSubview(phoneview)
        view.addSubview(phoneTF)
        
        view.addSubview(areatitle)
        view.addSubview(areaview)
        areaview.addSubview(areaLabel)
        areaview.addSubview(areabt)
        
        
        view.addSubview(alertTableview)
        alertTableview.addSubview(tableview)
        
        
    }
    
    
    
    func IDlayout() {
        NSLayoutConstraint.activate([
            
            tapview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tapview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tapview.topAnchor.constraint(equalTo: view.topAnchor),
            tapview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backbt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backbt.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            backbt.widthAnchor.constraint(equalToConstant: 50),
            backbt.heightAnchor.constraint(equalTo: backbt.widthAnchor),
        
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            idTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            idTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            idTF.widthAnchor.constraint(equalToConstant: 230),
            idTF.heightAnchor.constraint(equalToConstant: 40),
            
            idview.leadingAnchor.constraint(equalTo: idTF.leadingAnchor, constant: -space - 10),
            idview.topAnchor.constraint(equalTo: idTF.topAnchor, constant: -space),
            idview.trailingAnchor.constraint(equalTo: idTF.trailingAnchor, constant: space),
            idview.bottomAnchor.constraint(equalTo: idTF.bottomAnchor, constant: space),
            
            idcheckBT.leadingAnchor.constraint(equalTo: idTF.trailingAnchor, constant: 20),
            idcheckBT.topAnchor.constraint(equalTo: idview.topAnchor),
            idcheckBT.heightAnchor.constraint(equalTo: idview.heightAnchor),
            idcheckBT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            idtitle.leadingAnchor.constraint(equalTo: idTF.leadingAnchor, constant: -5),
            idtitle.bottomAnchor.constraint(equalTo: idview.topAnchor,constant: -5),
            
        ])
    }
    
    func passlayout() {
        NSLayoutConstraint.activate([
        
            passview.leadingAnchor.constraint(equalTo: idview.leadingAnchor),
            passview.trailingAnchor.constraint(equalTo: idcheckBT.trailingAnchor),
            passview.topAnchor.constraint(equalTo: passTF.topAnchor, constant: -space),
            passview.bottomAnchor.constraint(equalTo: passTF.bottomAnchor, constant: space),
            
            passTF.leadingAnchor.constraint(equalTo: idTF.leadingAnchor),
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
            areaview.trailingAnchor.constraint(equalTo: passview.trailingAnchor),
            
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
            alertTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            
            tableview.leadingAnchor.constraint(equalTo: alertTableview.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: alertTableview.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: alertTableview.bottomAnchor),
            tableview.topAnchor.constraint(equalTo: alertTableview.topAnchor, constant: 5),
            
            loginbt.leadingAnchor.constraint(equalTo: areaview.leadingAnchor),
            loginbt.topAnchor.constraint(equalTo: phoneview.bottomAnchor, constant: 50),
            loginbt.widthAnchor.constraint(equalTo: areaview.widthAnchor),
            loginbt.heightAnchor.constraint(equalTo: areaview.heightAnchor)

            
        ])
    }
    
    func namelayout() {
        NSLayoutConstraint.activate([
        
            nameview.leadingAnchor.constraint(equalTo: idview.leadingAnchor),
            nameview.trailingAnchor.constraint(equalTo: idcheckBT.trailingAnchor),
            nameview.topAnchor.constraint(equalTo: nameTF.topAnchor, constant: -space),
            nameview.bottomAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: space),
            
            nameTF.leadingAnchor.constraint(equalTo: passTF.leadingAnchor),
            nameTF.topAnchor.constraint(equalTo: areaview.bottomAnchor, constant: 50),
            nameTF.widthAnchor.constraint(equalToConstant: 250),
            nameTF.heightAnchor.constraint(equalToConstant: 40),
            
            nametitle.leadingAnchor.constraint(equalTo: idtitle.leadingAnchor),
            nametitle.trailingAnchor.constraint(equalTo: idtitle.trailingAnchor),
            nametitle.bottomAnchor.constraint(equalTo: nameview.topAnchor,constant: -5),
        
        ])
    }
    
    
    func phonelayout() {
        NSLayoutConstraint.activate([
        phoneview.leadingAnchor.constraint(equalTo: idview.leadingAnchor),
        phoneview.trailingAnchor.constraint(equalTo: idcheckBT.trailingAnchor),
        phoneview.topAnchor.constraint(equalTo: phoneTF.topAnchor, constant: -space),
        phoneview.bottomAnchor.constraint(equalTo: phoneTF.bottomAnchor, constant: space),
        
        phoneTF.leadingAnchor.constraint(equalTo: passTF.leadingAnchor),
        phoneTF.topAnchor.constraint(equalTo: nameview.bottomAnchor, constant: 50),
        phoneTF.widthAnchor.constraint(equalToConstant: 250),
        phoneTF.heightAnchor.constraint(equalToConstant: 40),
        
        phonetitle.leadingAnchor.constraint(equalTo: idtitle.leadingAnchor),
        phonetitle.trailingAnchor.constraint(equalTo: idtitle.trailingAnchor),
        phonetitle.bottomAnchor.constraint(equalTo: phoneview.topAnchor,constant: -5),
        
        ])
    }
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        addviews()
        IDlayout()
        passlayout()
        arealayout()
        namelayout()
        phonelayout()
        
        tableview.delegate = self
        tableview.dataSource = self
        idTF.delegate = self
        passTF.delegate = self
        nameTF.delegate = self
        phoneTF.delegate = self
        
        
        areabt.addTarget(self, action: #selector(showtableview(_:)), for: .touchUpInside)
        backbt.addTarget(self, action: #selector(backview(_:)), for: .touchUpInside)
        loginbt.addTarget(self, action: #selector(backloginview(_:)), for: .touchUpInside)
        idcheckBT.addTarget(self, action: #selector(showalert(_sender:)), for: .touchUpInside)
        
       
        let OKAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.alertCheckId.dismiss(animated: true, completion: nil)
        }
        
        alertCheckId.addAction(OKAction)
        
        let closeTF = UITapGestureRecognizer(target: self, action: #selector(closeedit(_:)))
        tapview.addGestureRecognizer(closeTF)
        
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
        
        if btatate == 1 {
        areabt.setImage(UIImage(systemName: "arrowtriangle.up"), for: .normal)
        areabt.setImage(UIImage(systemName: "arrowtriangle.up.fill"), for: .highlighted)
        btatate = 2
        } else {
            areabt.setImage(UIImage(systemName: "arrowtriangle.down"), for:.normal )
            areabt.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .highlighted)
            
            alertTableview.isHidden = true
            btatate = 1
        }
        
    }
    
    @objc func backloginview(_ sender: UIButton) {
        
        
        postsignup(e_num: nameTF.text!, user_pw: passTF.text!, user_name: nameTF.text!, phone: phoneTF.text!, region: areaLabel.text!)
        

        
        let alert = UIAlertController(title: "회원가입이 완료되었습니다.", message: nil, preferredStyle: .alert)
        let OKaction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(OKaction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @objc func showalert(_sender: UIButton) {
        
        
        present(alertCheckId, animated: true, completion: nil)
    }
    
    @objc func backview(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @objc func closeedit(_ sender: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
       
        print("tap")
        
    }
    
    func postsignup(e_num: String, user_pw:String, user_name:String, phone:String, region:String) {
        
        let signupuser = signup(e_num: e_num, user_pw: user_pw, user_name: user_name, phone: phone, region: region )
        guard let uploadData = try? JSONEncoder().encode(signupuser) else { return }
        
        let url = URL(string: "https://subeye.herokuapp.com/register")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) {(data, response, error) in
            
            
            if let e = error{
                NSLog("An error")
                return
            }
    
//            let object = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
//
//            guard let jsonObject = object else {return}
//
//            let result = jsonObject["loginSuccess"] as? String
//
//            print(result)
            
        
            

        }
        task.resume()
        
    }
}


extension SignupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignupTableViewCell", for: indexPath) as? SignupTableViewCell else {return UITableViewCell()}
        
        cell.stationname.text = areas[indexPath.row]
        SignupViewController.area = areas[indexPath.row]
        
        return  cell
    }
    
}

extension SignupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        areaLabel.text = areas[indexPath.row]
        areabt.setImage(UIImage(systemName: "arrowtriangle.down"), for:.normal )
        areabt.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .highlighted)
        btatate = 1
        
        alertTableview.isHidden = true
    }

}

extension SignupViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.frame.origin.y  = 0
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == phoneTF {
            
            self.view.frame.origin.y  = -250
            
            return true
            
        }
        return true
    }
    
    
}
