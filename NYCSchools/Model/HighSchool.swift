//
//  HighSchoolResponse.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import Foundation

struct HighSchool: Codable {
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case name = "school_name"
    }
}


