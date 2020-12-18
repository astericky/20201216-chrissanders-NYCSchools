//
//  LoadingIndicator.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/18/20.
//

import SwiftUI

struct LoadingIndicator: View {
    var title: String?
    var navigationTitle: String?
    
    var body: some View {
        VStack {
            ProgressView(title ?? "Loading...")
                .padding(.top, 60)
            Spacer()
        }
        .navigationTitle(navigationTitle ?? "")
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
