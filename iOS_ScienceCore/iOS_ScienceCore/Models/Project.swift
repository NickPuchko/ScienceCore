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
    var tags: [String]
    var crue: Int
    var type: ProjectType = .article
    var spreading: Spreading = .regional
    lazy var value: Float = {
        type.rawValue * spreading.rawValue
    }()
    
    init(label: String = "", date: Date = Date(), ref: URL = URL(string: "https://vk.com/oobermensch")!, tags: [String] = [], crue: Int = 1) {
        self.label = label
        self.date = date
        self.ref = ref
        self.tags = tags
        self.crue = crue
    }
}
//
//enum Tag: String, CaseIterable {
//    case economics, math, computerScience, law
//}

enum ProjectType: Float, CaseIterable {
    case article = 1, preprint = 0.8
}

enum Spreading: Float, CaseIterable {
    case worldwide = 100, capital = 60, regional = 30
}
