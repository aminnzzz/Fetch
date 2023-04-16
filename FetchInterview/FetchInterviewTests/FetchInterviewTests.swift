//
//  FetchInterviewTests.swift
//  FetchInterviewTests
//
//  Created by amin nazemzadeh on 4/16/23.
//

import XCTest
@testable import FetchInterview

final class FetchInterviewTests: XCTestCase {
    private var meals: [Meal] = []
    private var mealDetails: [MealDetails]? = nil

    func testDessertFetch() throws {
        // since we are testing an async function, we use expectation
        let fillExp = expectation(description: "fill")
        fetchDessertMeals { meals in
            if let meals = meals {
                self.meals = meals
            } else {
                print("could not get the desserts")
            }
            fillExp.fulfill()
        }
        wait(for: [fillExp], timeout: 10)
        XCTAssertTrue(self.meals.count != 0)
    }
    
    func testIdFetch() throws {
        // random ids for testing purposes, could add more to make the test more robust
        if let randomID = ["53049", "52893", "52768", "52776", "53007"].randomElement() {
            let fillExp = expectation(description: "fill")
            fetchMealDetails(mealId: randomID) {
                mealDetails in
                if let mealDetails = mealDetails {
                    self.mealDetails = mealDetails
                } else {
                    print("could not get the desserts")
                }
                fillExp.fulfill()
            }
            wait(for: [fillExp], timeout: 10)
            XCTAssertTrue(self.mealDetails?.count != 0)
        } else {
            XCTFail("failed")
        }
    }


}
