//
//  NYCSchoolsApp.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import SwiftUI

@main
struct NYCSchoolsApp: App {
    @StateObject private var highSchoolsViewModel = HighSchoolsViewModel()

    var body: some Scene {
        WindowGroup {
            HighSchoolList(highSchoolsViewModel: highSchoolsViewModel)
        }
    }
}
