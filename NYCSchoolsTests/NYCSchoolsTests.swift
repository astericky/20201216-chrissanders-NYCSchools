//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by Chris Sanders on 12/16/20.
//

import XCTest
@testable import NYCSchools

class NYCSchoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHighSchoolParsing() throws {
        let json = """
        [
            {
                "dbn": "02M260",
                "school_name": "Clinton School Writers &amp; Artists, M.S. 260",
                "boro": "M",
                "overview_paragraph": "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform. Our college preparatory curriculum develops writers and has built a tight-knit community. Our school develops students who can think analytically and write creatively. Our arts programming builds on our 25 years of experience in visual, performing arts and music on a middle school level. We partner with New Audience and the Whitney Museum as cultural partners. We are a International Baccalaureate (IB) candidate school that offers opportunities to take college courses at neighboring universities.",
                "school_10th_seats": "1",
                "academicopportunities1": "Free college courses at neighboring universities",
                "academicopportunities2": "International Travel, Special Arts Programs, Music, Internships, College Mentoring English Language Learner Programs: English as a New Language",
                "ell_programs": "English as a New Language",
                "neighborhood": "Chelsea-Union Sq",
                "building_code": "M868",
                "location": "10 East 15th Street, Manhattan NY 10003 (40.736526, -73.992727)",
                "phone_number": "212-524-4360",
                "fax_number": "212-524-4365",
                "school_email": "admissions@theclintonschool.net",
                "website": "www.theclintonschool.net",
                "subway": "1, 2, 3, F, M to 14th St - 6th Ave; 4, 5, L, Q to 14th St-Union Square; 6, N, R to 23rd St",
                "bus": "BM1, BM2, BM3, BM4, BxM10, BxM6, BxM7, BxM8, BxM9, M1, M101, M102, M103, M14A, M14D, M15, M15-SBS, M2, M20, M23, M3, M5, M7, M8, QM21, X1, X10, X10B, X12, X14, X17, X2, X27, X28, X37, X38, X42, X5, X63, X64, X68, X7, X9",
                "grades2018": "6-11",
                "finalgrades": "6-12",
                "total_students": "376",
                "extracurricular_activities": "CUNY College Now, Technology, Model UN, Student Government, School Leadership Team, Music, School Musical, National Honor Society, The Clinton Post (School Newspaper), Clinton Soup (Literary Magazine), GLSEN, Glee",
                "school_sports": "Cross Country, Track and Field, Soccer, Flag Football, Basketball",
                "attendance_rate": "0.970000029",
                "pct_stu_enough_variety": "0.899999976",
                "pct_stu_safe": "0.970000029",
                "school_accessibility_description": "1",
                "directions1": "See theclintonschool.net for more information.",
                "requirement1_1": "Course Grades: English (87-100), Math (83-100), Social Studies (90-100), Science (88-100)",
                "requirement2_1": "Standardized Test Scores: English Language Arts (2.8-4.5), Math (2.8-4.5)",
                "requirement3_1": "Attendance and Punctuality",
                "requirement4_1": "Writing Exercise",
                "requirement5_1": "Group Interview (On-Site)",
                "offer_rate1": "Â—57% of offers went to this group",
                "program1": "M.S. 260 Clinton School Writers &amp; Artists",
                "code1": "M64A",
                "interest1": "Humanities &amp; Interdisciplinary",
                "method1": "Screened",
                "seats9ge1": "80",
                "grade9gefilledflag1": "Y",
                "grade9geapplicants1": "1515",
                "seats9swd1": "16",
                "grade9swdfilledflag1": "Y",
                "grade9swdapplicants1": "138",
                "seats101": "YesÂ–9",
                "admissionspriority11": "Priority to continuing 8th graders",
                "admissionspriority21": "Then to Manhattan students or residents",
                "admissionspriority31": "Then to New York City residents",
                "grade9geapplicantsperseat1": "19",
                "grade9swdapplicantsperseat1": "9",
                "primary_address_line_1": "10 East 15th Street",
                "city": "Manhattan",
                "zip": "10003",
                "state_code": "NY",
                "latitude": "40.73653",
                "longitude": "-73.9927",
                "community_board": "5",
                "council_district": "2",
                "census_tract": "52",
                "bin": "1089902",
                "bbl": "1008420034",
                "nta": "Hudson Yards-Chelsea-Flatiron-Union Square                                 ",
                "borough": "MANHATTAN"
            }
        ]
        """.data(using: .utf8)!
        
        let highSchools = try! JSONDecoder().decode([HighSchool].self, from: json)
        
        XCTAssertNotNil(highSchools)
        XCTAssertEqual(highSchools.first?.id, "02M260")
    }
    
    func testHighSchoolSATScoreParsing() throws {
        let json = """
        [
            {
                "dbn": "01M292",
                "school_name": "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES",
                "num_of_sat_test_takers": "29",
                "sat_critical_reading_avg_score": "355",
                "sat_math_avg_score": "404",
                "sat_writing_avg_score": "363"
            }
        ]
        """.data(using: .utf8)!
        
        let highSchoolSATScores = try! JSONDecoder().decode([HighSchoolSATScore].self, from: json)
        
        XCTAssertNotNil(highSchoolSATScores)
        XCTAssertEqual(highSchoolSATScores.first?.id, "01M292")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
