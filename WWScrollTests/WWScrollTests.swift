//
//  WWScrollTests.swift
//  WWScrollTests
//
//  Created by Emmanuel Ramirez on 6/6/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import XCTest
@testable import WWScroll

class WWScrollTests: XCTestCase {
    var sut: ItemController?
    
    let itemOne = Item(imageName: "burger", title: "Burger")
    let itemTwo = Item(imageName: "salad", title: "salad")
    
    var scrollApp = [ItemCellViewModel]()
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = ItemController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        sut = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testItemViewModel() {
        let item = Item(imageName: "test", title: "Foodie")
        let itemViewModel = ItemCellViewModel(item: item)
        
        XCTAssertEqual(item.imageName, itemViewModel.imageName)
        XCTAssertEqual(item.title, itemViewModel.title)
    }
    
    func testSectionOneFunctionality() {
        //image and text should be present
        if let tableView = sut?.tableView {
            self.scrollApp.append(ItemCellViewModel(item: itemOne))
            self.scrollApp.append(ItemCellViewModel(item: itemTwo))
            
            sut?.itemViewModels = scrollApp
            
            XCTAssertEqual(tableView.numberOfSections, 3)
            XCTAssertEqual(tableView.numberOfRows(inSection: 0), scrollApp.count)
            XCTAssertTrue(sut?.itemViewModels[0].imageName != nil)
            XCTAssertTrue(sut?.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.textLabel != nil)
            XCTAssertTrue(sut?.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.imageView != nil)
        }
    }
    
    func testSectionTwoFunctionality() {
        //image should not be present
        //only text should show
        if let tableView = sut?.tableView {
            self.scrollApp.append(ItemCellViewModel(item: itemOne))
            self.scrollApp.append(ItemCellViewModel(item: itemTwo))
            
            sut?.itemViewModels = scrollApp
            
            XCTAssertEqual(tableView.numberOfSections, 3)
            XCTAssertEqual(tableView.numberOfRows(inSection: 1), scrollApp.count)
            XCTAssertTrue(sut?.itemViewModels[0].imageName != nil)
            XCTAssertTrue(sut?.tableView.cellForRow(at: IndexPath(row: 1, section: 1))?.textLabel != nil)
            XCTAssertTrue(sut?.tableView.cellForRow(at: IndexPath(row: 1, section: 1))?.imageView?.image == nil)
        }
    }
    
    func testSectionThreeFunctionality() {
        //text should not be present
        //only image should show
        if let tableView = sut?.tableView {
            self.scrollApp.append(ItemCellViewModel(item: itemOne))
            self.scrollApp.append(ItemCellViewModel(item: itemTwo))
            
            sut?.itemViewModels = scrollApp
            
            XCTAssertEqual(tableView.numberOfSections, 3)
            XCTAssertEqual(tableView.numberOfRows(inSection: 2), scrollApp.count)
            XCTAssertTrue(sut?.itemViewModels[0].imageName != nil)
            XCTAssertTrue(sut?.tableView.cellForRow(at: IndexPath(row: 0, section: 2))?.textLabel?.text == nil)
            XCTAssertTrue(sut?.tableView.cellForRow(at: IndexPath(row: 0, section: 2))?.imageView != nil)
        }
    }

}
