//
//  Model.swift
//  Realm_NhatKy
//
//  Created by Thien Tung on 4/24/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import Foundation
import RealmSwift

class Work : Object {
    @objc dynamic var name: String? = nil
    @objc dynamic var hour: String? = nil
    @objc dynamic var min: String? = nil
}
