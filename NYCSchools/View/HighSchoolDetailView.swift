//
//  HighSchoolDetailView.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import SwiftUI

struct HighSchoolDetailView: View {
    private var highSchoolDetailViewModel: HighSchoolDetailViewModel
    var body: some View {
        VStack(alignment: .leading) {
            highSchoolName
            mathScore
        }
        Spacer()
    }
    
    init(highSchool: HighSchool, highSchoolSATScores: [HighSchoolSATScore]) {
        let filteredHighSchoolSATScores = highSchoolSATScores.filter { $0.id == highSchool.id }
        if !filteredHighSchoolSATScores.isEmpty {
            highSchoolDetailViewModel = HighSchoolDetailViewModel(highSchool: highSchool, highSchoolSATScore: filteredHighSchoolSATScores[0])
        } else {
            highSchoolDetailViewModel = HighSchoolDetailViewModel(highSchool: highSchool)
        }
        
    }
}

extension HighSchoolDetailView {
    var highSchoolName: some View {
        HStack {
            Text(highSchoolDetailViewModel.highSchool.name)
        }
    }
    var mathScore: some View {
        if let avgMathScore = highSchoolDetailViewModel.highSchoolSATScore?.avgSATMathScore {
            return VStack {
                Text("Avg. Math Score: \(avgMathScore)")
            }
        }
        return VStack {
            Text("Avg. Math Score: Unavailable")
        }
    }
}

struct HighSchoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let highSchoolViewModel = HighSchoolsViewModel()
        return HighSchoolDetailView(
            highSchool: highSchoolViewModel.highSchools[0],
            highSchoolSATScores: highSchoolViewModel.highSchoolSATScores
        )
    }
}
