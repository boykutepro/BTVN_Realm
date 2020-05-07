//
//  ViewController.swift
//  NhatKyWithRealm
//
//  Created by Thien Tung on 4/24/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//


import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    } ()
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NHẬT KÝ"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    } ()
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nhập tên"
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 18)
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = .zero
        tf.layer.shadowOpacity = 1
        return tf
    } ()
    let hourTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Giờ"
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 18)
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = .zero
        tf.layer.shadowOpacity = 1
        return tf
    } ()
    let minTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Phút"
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 18)
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = .zero
        tf.layer.shadowOpacity = 1
        return tf
    } ()
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("THÊM", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        return button
    } ()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    var works:[Work] = []
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        //deleteAllData()
        
        setView()
        
        let results = realm.objects(Work.self)
        works = Array(results)

        button.addTarget(self, action: #selector(addObject), for: .touchUpInside)
        
    }
    
    func deleteAllData() {
        try! realm.write {
            realm.delete(realm.objects(Work.self))
        }
    }
    
    @objc func addObject(){
        let work = Work()
        work.name = nameTF.text
        work.hour = hourTF.text
        work.min = minTF.text
        
        addData(work)
        
        
        let alert = UIAlertController(title: "Thông báo", message: "Đã thêm thành công \(String(describing: work.name))", preferredStyle: .alert)
        let done = UIAlertAction(title: "Xong", style: .default) { (_) in
            self.nameTF.text = ""
            self.hourTF.text = ""
            self.minTF.text = ""
        }
        alert.addAction(done)
        present(alert, animated: true, completion: nil)
        
        let results = realm.objects(Work.self)
        works = Array(results)
        self.tableView.reloadData()
        
        
    }
    
    func addData(_ work: Work){
        try! realm.write {
            realm.add(work)
        
        }
        
    }
    
    func setView() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(topLabel)
        topLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        topLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 36).isActive = true
        
        containerView.addSubview(nameTF)
        nameTF.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        nameTF.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20).isActive = true
        nameTF.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 26).isActive = true
        nameTF.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -26).isActive = true
        nameTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.addSubview(hourTF)
        hourTF.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        hourTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 20).isActive = true
        hourTF.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 26).isActive = true
        hourTF.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -26).isActive = true
        hourTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.addSubview(minTF)
        minTF.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        minTF.topAnchor.constraint(equalTo: hourTF.bottomAnchor, constant: 20).isActive = true
        minTF.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 26).isActive = true
        minTF.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -26).isActive = true
        minTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.addSubview(button)
        button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        button.topAnchor.constraint(equalTo: minTF.bottomAnchor, constant: 24).isActive = true
        button.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 26).isActive = true
        button.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -26).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true

    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Work.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        
        cell.nameLabel.text = works[indexPath.row].name
        cell.hourLabel.text = works[indexPath.row].hour! + " giờ"
        cell.minLabel.text = works[indexPath.row].min! + " phút"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
