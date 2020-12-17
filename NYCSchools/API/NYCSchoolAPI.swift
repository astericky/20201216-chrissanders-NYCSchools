//
//  NYCSchoolAPI.swift
//  NYCSchools
//
//  Created by Chris Sanders on 12/16/20.
//

import Foundation
import Combine

protocol NYCSchoolsFetchable {
    func getHighSchools() -> AnyPublisher<[HighSchool], HighSchoolError>
    func getHighSchoolSATScores() -> AnyPublisher<[HighSchoolSATScore], HighSchoolError>
}

class NYCSchoolsFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension NYCSchoolsFetcher: NYCSchoolsFetchable {
    static let highSchoolListURL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
    static let highSchoolSATScoreURL = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")
    
    func getHighSchools() -> AnyPublisher<[HighSchool], HighSchoolError> {
        guard let url = NYCSchoolsFetcher.highSchoolListURL else {
            let error = HighSchoolError.network(description: "Couldn't create url")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
//            let container = try decoder.singleValueContainer()
//            let dateString = try container.decode(String.self)
//            if let date = ISO8601DateFormatter().date(from: dateString) {
//                return date
//            }
//            throw DateError.error(description: "There was an error decoding the date.")
//        })
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .map(\.data)
            .print()
            .decode(type: [HighSchool].self, decoder: decoder)
            .mapError { .network(description: $0.localizedDescription) }
            .eraseToAnyPublisher()
    }
    
    func getHighSchoolSATScores() -> AnyPublisher<[HighSchoolSATScore], HighSchoolError> {
        guard let url = NYCSchoolsFetcher.highSchoolSATScoreURL else {
            let error = HighSchoolError.network(description: "Couldn't create url")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
//            let container = try decoder.singleValueContainer()
//            let dateString = try container.decode(String.self)
//            if let date = ISO8601DateFormatter().date(from: dateString) {
//                return date
//            }
//            throw DateError.error(description: "There was an error decoding the date.")
//        })
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .map(\.data)
            .print()
            .decode(type: [HighSchoolSATScore].self, decoder: decoder)
            .mapError { .network(description: $0.localizedDescription) }
            .eraseToAnyPublisher()
    }
}
