//
//  HighSchoolRow.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import SwiftUI

struct HighSchoolRow: View {
    var highSchool: HighSchool
    var highSchoolsViewModel: HighSchoolsViewModel
    @State var isHighSchoolDetailViewPresented = false
    
    var body: some View {
        NavigationLink(destination: HighSchoolDetailView(highSchool: highSchool,
                                                         highSchoolSATScores: highSchoolsViewModel.highSchoolSATScores)) {
            VStack {
                Text(highSchool.name)
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
        }
    }
}

struct HighSchoolRow_Previews: PreviewProvider {
    static var previews: some View {
        let highSchoolViewModel = HighSchoolsViewModel()
        return HighSchoolRow(highSchool: highSchoolViewModel.highSchools[0], highSchoolsViewModel: highSchoolViewModel)
    }
}
