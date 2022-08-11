//
//  hungrTests.swift
//  hungrTests
//
//  Created by Spencer Hurd on 8/11/22.
//

import XCTest
@testable import hungr

class hungrTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    let searchVM = SearchVM()
    /**
     func getDestinationVM(at index: Int) -> MealDetailsVM {
         mealList[index]
     }
     */
    func testgetDestinationVM() throws {
        let result = MealDetailsVM(
            Meal(
                id: "52866",
                name: "Squash linguine",
                instructions: "Heat oven to 200C/180C fan/gas 6. Put the squash and garlic on a baking tray and drizzle with the olive oil. Roast for 35-40 mins until soft. Season.\r\nCook the pasta according to pack instructions. Drain, reserving the water. Use a stick blender to whizz the squash with 400ml cooking water. Heat some oil in a frying pan, fry the sage until crisp, then drain on kitchen paper. Tip the pasta and sauce into the pan and warm through. Scatter with sage.",
                imageURL: "https://www.themealdb.com/images/media/meals/wxswxy1511452625.jpg",
                ingredients: [
//                    Ingredient(name: "Butternut Squash", amount: "350g"),
//                    Ingredient(name: "Garlic", amount: "3 parts "),
//                    Ingredient(name: "Olive Oil", amount: "3 tbs"),
//                    Ingredient(name: "Linguine Pasta", amount: "350g"),
//                    Ingredient(name: "Sage", amount: "Small bunch")
                ]
            )
        )
        XCTAssertNotNil(result, "\n Value found for MealDetailsVM = \(result)")
    }

}
