//
//  HighSchoolError.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import Foundation

// high school errors cases
enum HighSchoolError: Error {
    case parsing(description: String)
    case network(description: String)
}

