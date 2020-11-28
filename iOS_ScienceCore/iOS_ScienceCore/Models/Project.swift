//
//  Project.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 28.11.2020.
//

import Foundation


struct Project {
    var label: String
    var date: Date
    var ref: URL
    var vacations: [User]
    var crue: [User]
}

enum Tag: String {
    case economics, math, computerScience, law
}
