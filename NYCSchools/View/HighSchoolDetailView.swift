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
            Text(highSchoolDetailViewModel.highSchool.website)
                .font(.caption)
                .fontWeight(.bold)
        }
    }
    
    var phoneNumber: some View {
        HStack {
            Text("Phone Number:")
                .fontWeight(.bold)
            Spacer()
            Text(highSchoolDetailViewModel.highSchool.phone)
        }
    }
    
    var email: some View {
        HStack {
            Text("Email:")
                .fontWeight(.bold)
            Spacer()
            if let email = highSchoolDetailViewModel.highSchool.email {
                Text(email)
            } else {
                Text("Unavailable")
            }
            
        }
    }

    var numberOfSATTakers: some View {
        HStack {
            Text("Number of SAT Takers:")
                .fontWeight(.bold)
            Spacer()
            if let numberOfSATTakers = highSchoolDetailViewModel.highSchoolSATScore?.numberOfSATTakers {
                Text(numberOfSATTakers)
            } else {
                Text("Unavailable")
            }
        
        }
    }
    
    var avgSATReadingScore: some View {
        HStack {
            Text("Avg. Reading Score:")
                .fontWeight(.bold)
            Spacer()
            if let avgSATReadingScore = highSchoolDetailViewModel.highSchoolSATScore?.avgSATReadingScore {
                Text(avgSATReadingScore)
            } else {
                Text("Unavailable")
            }
        }
    }
    
    var avgSATWritingScore: some View {
        HStack {
            Text("Avg. Writing Score:")
                .fontWeight(.bold)
            Spacer()
            if let avgSATWritingScore = highSchoolDetailViewModel.highSchoolSATScore?.avgSATWritingScore {
                Text(avgSATWritingScore)
            } else {
                Text("Unavailable")
            }
        }
    }
    
    var mathScore: some View {
        HStack {
            Text("Avg. Math Score:")
                .fontWeight(.bold)
            Spacer()
            if let avgSATMathScore = highSchoolDetailViewModel.highSchoolSATScore?.avgSATMathScore {
                Text(avgSATMathScore)
            } else {
                Text("Unavailable")
            }
        }
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
