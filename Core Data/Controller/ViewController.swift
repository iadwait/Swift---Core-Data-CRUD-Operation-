//
//  ViewController.swift
//  Core Data
//
//  Created by Adwait Barkale on 18/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DataPass {
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    
    var curIndex = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTitle.text = "Insert Data"
    }
    
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        let dict = ["name":txtName.text,"address":txtAddress.text,"city":txtCity.text,"mobile":txtMobile.text]
        
        if isUpdate{
            DatabaseHelper.shared.updateData(object: dict as! [String : String], i: curIndex)
        }else{
            DatabaseHelper.shared.save(object: dict as! [String : String])
        }
    }
    
    @IBAction func btnDisplayDataClicked(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(identifier: "ListViewController") as! ListViewController
        nextVC.delegate = self
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func data(object: [String : String],index: Int,isEdit: Bool) {
        txtName.text = object["name"]
        txtAddress.text = object["address"]
        txtCity.text = object["city"]
        txtMobile.text = object["mobile"]
        curIndex = index
        isUpdate = isEdit
        if isUpdate{
            lblTitle.text = "Update Data"
        }else{
            lblTitle.text = "Insert Data"
        }
    }
    
}

