//
//  DateExtensionTests.swift
//  RelayanceTests
//
//  Created by Julien Choromanski on 25/07/2025.
//

import XCTest
@testable import Relayance

final class DateExtensionTests: XCTestCase {
    
    func test_dateFromString_GivenAString_WhenAskingForDate_ThenReturnCorrectDate() {
        // Given
        let string = "2025-07-25T08:30:00Z"
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 2025,
                                            month: 7,
                                            day: 25)
        
        guard let date = calendar.date(from: dateComponents) else {
            XCTFail("Failed to create date")
            return
        }
        
        // When
        let dateFromString = Date.dateFromString(string)

        // Then
        XCTAssertEqual(date, dateFromString)
    }
    
    func test_stringFromDate_GivenADate_WhenAskingForString_ThenReturnCorrectString() {
        // Given
        guard let date = Date.dateFromString("2025-07-25T08:30:00Z") else { return
            XCTFail("impossible to convert date to string") }
        // When
        let stringDate = Date.stringFromDate(date)

        // Then
        XCTAssertEqual(stringDate, "25-07-2025")
    }
    
    func test_getDay_GivenADate_WhenAskingForDay_ThenShouldreturnCorrectDay() {
        // Given
        let date = Date.dateFromString("2025-07-25T08:30:00Z")
        // When
        let day = date?.getDay()
        // Then
        XCTAssertEqual(day, 25)
    }
    
    func test_getMonth_GivenADate_WhenAskingForMonth_ThenShouldReturnCorrectMonth() {
        let date = Date.dateFromString("2025-07-25T08:30:00Z")
        // When
        let month = date?.getMonth()
        // Then
        XCTAssertEqual(month, 7)
    }
    
    func test_getYear_GivenADate_WhenAskingForYear_ThenShouldReturnCorrectYear() {
        let date = Date.dateFromString("2025-07-25T08:30:00Z")
        
        // When
        let year = date?.getYear()
        
        // Then
        XCTAssertEqual(year, 2025)
    }
    
    
    
}

//    func test_Given_When_Then() {
//        // Given
//
//        // When
//
//        // Then
//
//    }
