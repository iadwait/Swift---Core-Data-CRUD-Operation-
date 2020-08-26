//
//  DatabaseHelper.swift
//  Core Data
//
//  Created by Adwait Barkale on 18/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static var shared = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String])
    {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        
        do{
            try context?.save()
        }catch{
            print("Data Not Saved")
        }
    }
    
    func getStudentData() -> [Student]
    {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            student = try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print("Cannot get Data")
        }
        return student
    }
    
    func deleteData(index: Int) -> [Student]
    {
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("Cannot Delete Data")
        }
        return student
    }
    
    func updateData(object:[String:String],i:Int)
    {
        let student = getStudentData()
        student[i].name = object["name"]
        student[i].address = object["address"]
        student[i].city = object["city"]
        student[i].mobile = object["mobile"]
        do{
            try context?.save()
        }catch{
            print("Data Not Updated")
        }
    }
}
