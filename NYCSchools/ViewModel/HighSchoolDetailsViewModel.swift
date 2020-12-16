//
//  HighSchoolDetailsViewModel.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import Foundation

final class HighSchoolDetailViewModel {
    let highSchool: HighSchool
    var highSchoolSATScore: HighSchoolSATScore?
    
    
    init(highSchool: HighSchool, highSchoolSATScore: HighSchoolSATScore? = nil) {
        self.highSchool = highSchool
        self.highSchoolSATScore = highSchoolSATScore
    }
}
