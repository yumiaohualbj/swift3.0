//
//  ViewController.swift
//  03使用coredata进行数据持久化
//
//  Created by 于淼华 on 2017/7/14.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    var managedObjectContext:NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //被管理对象上下文
        managedObjectContext = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        //coredata模型的路径
       let path = Bundle.main.path(forResource: "Person", ofType: "momd")
        
        //通过路径加载coredata模型
        let model = NSManagedObjectModel.init(contentsOf: URL.init(fileURLWithPath: path!))!
        let coordinator = NSPersistentStoreCoordinator.init(managedObjectModel: model)
        
        let  sqlPath = NSHomeDirectory()+"/Documents/Person.db"
        
        
        
        print(sqlPath)
        try! coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: URL.init(fileURLWithPath: sqlPath), options: nil)
        // 将协调器设置给上下文, 从此上下文就拥有了权利(增删改查)
        managedObjectContext.persistentStoreCoordinator = coordinator
        
        /***************准备工作完成*************************/
        
        // 构造查询请求, 需要设置在哪个表里查询, 如果不设置查询条件, 默认查询所有
        let request = NSFetchRequest<NSFetchRequestResult>.init(entityName: "User")
        do{
            
        print("查询成功")
        }catch{
            print("查询所有, 失败了")
        }
        
     
       // self.addData()
        
        
        
    }
    
    func addData()  {
        let  newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into:managedObjectContext ) as! User
        
        newUser.password = "12345"
        newUser.userName = "yu"
        
        do {
            try managedObjectContext.save()
            print("保存成功")
        } catch  {
            print("数据保存失败")
        }
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

