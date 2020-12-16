//
//  HighSchoolsViewModel.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import Foundation
import Combine

final class HighSchoolsViewModel: ObservableObject {
    @Published var highSchools = [HighSchool]()
    @Published var highSchoolSATScores = [HighSchoolSATScore]()
    
    private var nycSchoolsFetcher = NYCSchoolsFetcher()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        getHighSchoolSATScores()
        getHighSchools()
    }
    
    func getHighSchools() {
        nycSchoolsFetcher.getHighSchools()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] status in
                    guard let self = self else { return }
                    switch status {
                    case .failure:
                        self.highSchools = [HighSchool]()
                    default:
                        break
                    }
                },
                receiveValue: { [weak self] highSchools in
                    guard let self = self else { return }
                    self.highSchools = highSchools
                })
            .store(in: &subscriptions)
    }
    
    func getHighSchoolSATScores() {
        nycSchoolsFetcher.getHighSchoolSATScores()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] status in
                    guard let self = self else { return }
                    switch status {
                    case .failure:
                        self.highSchoolSATScores = [HighSchoolSATScore]()
                    default:
                        break
                    }
                },
                receiveValue: { [weak self] highSchoolSATScores in
                    guard let self = self else { return }
                    self.highSchoolSATScores = highSchoolSATScores
                })
            .store(in: &subscriptions)
    }
}


