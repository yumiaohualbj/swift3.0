//
//  User+CoreDataProperties.swift
//  03使用coredata进行数据持久化
//
//  Created by 于淼华 on 2017/7/14.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userName: String?
    @NSManaged public var password: String?

}
