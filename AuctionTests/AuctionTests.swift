//
//  AuctionTests.swift
//  AuctionTests
//
//  Created by jobzella on 04/01/2023.
//

import XCTest
@testable import Auction

class AuctionTests: XCTestCase {

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
    func testGetProperty(){
        let sut =  ViewModel()
       let property = sut.getPropertyDataFrom(dict: ["cars":[SubCategory(id: 0, name: "sell", description: nil, slug: nil, options: nil)]])
        let textFieldPlaceholder = property.name
        XCTAssertEqual(textFieldPlaceholder, "cars", "placeholder is correct")
    }
    func testgetOptionsCountFromProperty(){
        let sut =  ViewModel()
       let options = sut.getSelectedPropertyOptionsFrom(properties: [SubCategory(id: 0, name: "sell", description: nil, slug: nil, options: [Option(id: 0, name: nil, description: nil, slug: nil, parent: nil, child: nil)])], selectedOption: DropDownModel(name: "sell", id: 0))
        
        let optionCount = options!.count
        XCTAssertEqual(optionCount, 1, "options count is correct")
    }
    func testGetOptionsNames(){
        let sut =  ViewModel()
        let dropDownModel = DropDownModel(name: "sell", id: 0)
       let options = sut.getSelectedPropertyOptionsFrom(properties: [SubCategory(id: 0, name:nil, description: nil, slug: nil, options: [Option(id: 0, name: nil, description: nil, slug: nil, parent: nil, child: nil)])], selectedOption:dropDownModel )
        
        let name = options?[0].name
        XCTAssertTrue(name != dropDownModel.name,"names is not optained")
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
