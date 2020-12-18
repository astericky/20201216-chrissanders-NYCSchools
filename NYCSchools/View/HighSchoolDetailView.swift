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
        VStack(alignment: .center, spacing: 16) {
            HStack {
                VStack(alignment: .center) {
                    highSchoolName
                    
                    List {
                        Section(header: Text("Location")) {
                            schoolAddress
                        }
                        
                        Section(header: Text("Website")) {
                            website
                        }
                        
                        Section(header: Text("Contact")) {
                            phoneNumber
                            email
                        }
                        
                        Section(header: Text("SAT Results")) {
                            numberOfSATTakers
                            avgSATReadingScore
                            avgSATWritingScore
                            mathScore
                        }
                    }.listStyle(GroupedListStyle())
                }
            }
            Spacer()
        }
        .navigationBarTitle("High School Details")
        .navigationBarTitleDisplayMode(.inline)
            
    }
    
    init(highSchool: HighSchool, highSchoolSATScores: [HighSchoolSATScore]) {
        // get SAT scores for this high school
        let filteredHighSchoolSATScores = highSchoolSATScores.filter { $0.id == highSchool.id }
        // if there are SAT Scores for this high school
        if !filteredHighSchoolSATScores.isEmpty {
            // initialize the view model with the high school SAT scores
            highSchoolDetailViewModel = HighSchoolDetailViewModel(highSchool: highSchool, highSchoolSATScore: filteredHighSchoolSATScores[0])
        } else {
            // initialize the view model without the high school SAT scores
            highSchoolDetailViewModel = HighSchoolDetailViewModel(highSchool: highSchool)
        }
    }
}

extension HighSchoolDetailView {
    var highSchoolName: some View {
        VStack {
            Text(highSchoolDetailViewModel.highSchool.name)
                .font(.callout)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
    }
    
    var schoolAddress: some View {
        VStack {
            Text(highSchoolDetailViewModel.highSchool.location)
                .font(.callout)
        }
    }
    
    var website: some View {
        HStack {
            Link(highSchoolDetailViewModel.highSchool.website,
                 destination: URL(string: highSchoolDetailViewModel.highSchool.website)!)                
        }
    }
    
    var phoneNumber: some View {
        HighSchoolDataRow(label: "Phone Number:",
                          data: highSchoolDetailViewModel.highSchool.phone)
    }
    
    var email: some View {
        HighSchoolDataRow(label: "Email:",
                          data: highSchoolDetailViewModel.highSchool.email)
    }

    var numberOfSATTakers: some View {
        HighSchoolDataRow(label: "Avg. Reading Score:",
                          data: highSchoolDetailViewModel.highSchoolSATScore?.numberOfSATTakers)
    }
    
    var avgSATReadingScore: some View {
        HighSchoolDataRow(label: "Avg. Reading Score:",
                          data: highSchoolDetailViewModel.highSchoolSATScore?.avgSATReadingScore)
    }
    
    var avgSATWritingScore: some View {
        HighSchoolDataRow(label: "Avg. Writing Score:",
                          data: highSchoolDetailViewModel.highSchoolSATScore?.avgSATWritingScore)
    }
    
    var mathScore: some View {
        HighSchoolDataRow(label: "Avg. Math Score:",
                          data: highSchoolDetailViewModel.highSchoolSATScore?.avgSATMathScore)
    }
}


struct HighSchoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let highSchoolViewModel = HighSchoolsViewModel()
        let highSchool = HighSchool(id: "123",
                                    name: "Chris' High School Plus Business School",
                                    location: "10 East 15th Street, Manhattan NY 10003 (40.736526, -73.992727)",
                                    phone: "212-524-4360",
                                    email: "admissions@theclintonschool.net",
                                    website: "www.theclintonschool.net")
        return HighSchoolDetailView(
            highSchool: highSchool,
            highSchoolSATScores: highSchoolViewModel.highSchoolSATScores
        )
    }
}
