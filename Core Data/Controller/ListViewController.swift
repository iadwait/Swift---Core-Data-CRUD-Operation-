//
//  ListViewController.swift
//  Core Data
//
//  Created by Adwait Barkale on 18/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

protocol DataPass {
    func data(object: [String:String],index: Int,isEdit:Bool)
}

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var student = [Student]()
    var delegate: DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student = DatabaseHelper.shared.getStudentData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
//        cell.lblName.text = "Name = \(student[indexPath.row].name ?? "N/A")"
//        cell.lblAddress.text = "Address = \(student[indexPath.row].address ?? "N/A")"
//        cell.lblCity.text = "City = \(student[indexPath.row].city ?? "N/A")"
//        cell.lblMobile.text = "Mobile = \(student[indexPath.row].mobile ?? "N/A")"
        cell.student = student[indexPath.row]
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = DatabaseHelper.shared.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        delegate.data(object: dict as! [String : String],index: indexPath.row, isEdit: true)
        self.navigationController?.popViewController(animated: true)
    }
    
}
