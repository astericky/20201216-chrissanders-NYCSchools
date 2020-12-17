//
//  HighSchoolResponse.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import Foundation

struct HighSchool: Codable, Identifiable {
    let id: String
    let name: String
    let location: String
    let phone: String
    let email: String?
    let website: String

    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case name = "school_name"
        case location = "location"
        case phone = "phone_number"
        case email = "school_email"
        case website = "website"
    }
}


