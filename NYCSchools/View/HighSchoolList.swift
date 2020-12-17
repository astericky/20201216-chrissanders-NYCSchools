//
//  ContentView.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import SwiftUI

struct HighSchoolList: View {
    @ObservedObject var highSchoolsViewModel: HighSchoolsViewModel

    var body: some View {
        NavigationView {
            List(highSchoolsViewModel.highSchools) { highSchool in
                HighSchoolRow(highSchool: highSchool, highSchoolsViewModel: highSchoolsViewModel)
            }.navigationTitle("NYC Schools")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HighSchoolList(highSchoolsViewModel: HighSchoolsViewModel())
    }
}
