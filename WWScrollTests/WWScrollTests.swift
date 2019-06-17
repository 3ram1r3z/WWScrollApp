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
    var sut: FoodViewController?
    
    let itemOne = ImageTitleStringModel(imageName: "leaf_third", title: "Burger")
    let itemTwo = ImageTitleStringModel(imageName: "salad", title: "salad")
    
    var scrollApp = [ImageTitleStringViewModel]()
    
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = FoodViewController()
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
        let item = ImageTitleStringModel(imageName: "test", title: "Foodie")
        let itemViewModel = ImageTitleStringViewModel(item: item)
        
        XCTAssertEqual(item.imageName, itemViewModel.imageName)
        XCTAssertEqual(item.title, itemViewModel.title)
    }
    
    func testSectionOneHasBothTextAndImage() {
        //image and text should be present
        guard let tableView = sut?.tableView else { return }
        self.scrollApp.append(ImageTitleStringViewModel(item: itemOne))
        self.scrollApp.append(ImageTitleStringViewModel(item: itemTwo))
        
        sut?.item.foodViewModels = scrollApp
        sut?.doneLoading()
        sut?.state = .populated
        sut?.tableView.reloadData()
        
        guard let cell = sut?.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FoodCell else { return XCTFail() }
        
        XCTAssertEqual(tableView.numberOfSections, 3)
        XCTAssertEqual(sut?.tableView.numberOfRows(inSection: 0), scrollApp.count)
        XCTAssertTrue(cell.foodTitle.text != nil)
        XCTAssertTrue(cell.foodImageView.sd_imageURL != nil)
        
    }
    
    func testSectionTwoNoImageButTextShouldExist() {
        //image should not be present
        //only text should show
        if let tableView = sut?.tableView {
            self.scrollApp.append(ImageTitleStringViewModel(item: itemOne))
            self.scrollApp.append(ImageTitleStringViewModel(item: itemTwo))
            
            sut?.item.foodViewModels = scrollApp
            sut?.doneLoading()
            sut?.state = .populated
            sut?.tableView.reloadData()
            
            guard let cell = sut?.tableView.cellForRow(at: IndexPath(row: 1, section: 1)) as? FoodCell else { return XCTFail() }
            
            
            XCTAssertEqual(tableView.numberOfSections, 3)
            XCTAssertEqual(tableView.numberOfRows(inSection: 1), scrollApp.count)
            XCTAssertTrue(cell.foodTitle.text != nil)
            XCTAssertTrue(cell.foodImageView.sd_imageURL == nil)
        }
    }
    
    func testSectionThreeNoTextButImageShouldExist() {
        //text should not be present
        //only image should show
        guard let tableView = sut?.tableView else { XCTFail("Expected tableView to be instantiated"); return }
        self.scrollApp.append(ImageTitleStringViewModel(item: itemOne))
        self.scrollApp.append(ImageTitleStringViewModel(item: itemTwo))
        
        sut?.item.foodViewModels = scrollApp
        sut?.doneLoading()
        sut?.state = .populated//
        sut?.tableView.reloadData()
        
        //
        
        //guard let cell = sut?.tableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? ItemCell else { XCTFail("Expected cell to be instantiated"); return }
        
        //table view has not loaded cells
        //following tests are not run and evaluated
        guard let cell = sut?.tableView.cellForRow(at: IndexPath(row: 1, section: 3)) as? FoodCell else { return XCTFail()}
        
        
        XCTAssertEqual(tableView.numberOfSections, 3)
        XCTAssertEqual(tableView.numberOfRows(inSection: 2), scrollApp.count)
        
        XCTAssertTrue(cell.foodTitle.text != nil, "Expected food title to be nil")
        XCTAssertTrue(cell.foodImageView.sd_imageURL != nil)
        //            XCTAssertEqual(cell.foodImageView., <#T##expression2: Equatable##Equatable#>)
    }
    
    //    func testMockURLFunctionality() {
    //        let session = MockURLSession()
    //        let test = DataView()
    //        test.loadData(session: session)
    //
    //        print(test.itemViewModels)
    //        test.loadData(session: session)
    //        let data = Data(bytes: [0,1,0,1])
    //        session.data = data
    
    //assert that the data is not empty
    //    }
    
}
