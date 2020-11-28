//
//  FirebaseRef.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 28.11.2020.
//

import Foundation
import FirebaseDatabase

struct FirebaseRef {
    static let ref = Database.database().reference()
}
