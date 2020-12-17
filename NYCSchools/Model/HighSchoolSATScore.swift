//
//  HighSchoolResponse.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import Foundation

struct HighSchoolSATScore: Codable, Identifiable {
    let id: String
    let numberOfSATTakers: String
    let avgSATReadingScore: String
    let avgSATMathScore: String
    let avgSATWritingScore: String
    
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case numberOfSATTakers = "num_of_sat_test_takers"
        case avgSATReadingScore = "sat_critical_reading_avg_score"
        case avgSATMathScore = "sat_math_avg_score"
        case avgSATWritingScore = "sat_writing_avg_score"
    }
}
