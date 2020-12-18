//
//  HighSchoolDataRow.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/18/20.
//

import SwiftUI

struct HighSchoolDataRow: View {
    var label: String
    var data: String?
    
    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.bold)
            Spacer()
            if let data = data {
                Text(data)
            } else {
                Text("Unavailable")
            }
        }
    }
}

struct HighSchoolDataRow_Previews: PreviewProvider {
    static var previews: some View {
        HighSchoolDataRow(label: "Average Data:", data: "123")
            .previewLayout(.fixed(width: 320, height: 50))
    }
}
