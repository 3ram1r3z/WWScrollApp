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
    var sut: RecipeListViewController?
    
    let foodOne = ImageTitleStringModel(imageName: "leaf_third", title: "Burger")
    let foodTwo = ImageTitleStringModel(imageName: "salad", title: "salad")
    
    var recipes = [RecipeModel]()
    var viewComtroller = UIViewController()
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        print("test")
        sut = RecipeListViewController()
        viewComtroller.beginAppearanceTransition(true, animated: false)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        sut = nil
        viewComtroller.endAppearanceTransition()
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
        let itemViewModel = RecipeModel(item: item)
        
        XCTAssertEqual(item.imageName, itemViewModel.imageName)
        XCTAssertEqual(item.title, itemViewModel.title)
    }
    
    func testSectionOneHasBothTextAndImage() {
        //image and text should be present
        sut?.loadView()
        sut?.viewDidLoad()
        
        let mockTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480), style: .plain)
        self.recipes.append(RecipeModel(item: foodOne))
        self.recipes.append(RecipeModel(item: foodTwo))
        
        mockTableView.register(RecipeCell.self, forCellReuseIdentifier: String(describing: RecipeCell.self))
        
//        mockTableView.dataSource =
        //The reload is also necessary
        mockTableView.reloadData()
        
        guard let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) else { return XCTFail() }
        
        guard let tableView = sut?.tableView else { return XCTFail() }
        
        
        sut?.recipeViewModel.recipes = recipes
        sut?.state = .populated
        sut?.tableView.reloadData()
        
//        guard let cell = sut?.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? RecipeCell else { return XCTFail() }
        
        XCTAssertEqual(tableView.numberOfSections, 3)
        XCTAssertEqual(sut?.tableView.numberOfRows(inSection: 0), recipes.count)
//        XCTAssertTrue(cell.foodTitle.text != nil)
//        XCTAssertTrue(cell.foodImageView.sd_imageURL != nil)
        
    }
    
    func testSectionTwoNoImageButTextShouldExist() {
        //image should not be present
        //only text should show
        if let tableView = sut?.tableView {
            self.recipes.append(RecipeModel(item: foodOne))
            self.recipes.append(RecipeModel(item: foodTwo))
            
//            sut?.item.foodViewModels = listOfImageTitleStringVM
//            sut?.doneLoading()
            sut?.state = .populated
            sut?.tableView.reloadData()
            
            guard let cell = sut?.tableView.cellForRow(at: IndexPath(row: 1, section: 1)) as? RecipeCell else { return XCTFail() }
            
            
            XCTAssertEqual(tableView.numberOfSections, 3)
            XCTAssertEqual(tableView.numberOfRows(inSection: 1), recipes.count)
            XCTAssertTrue(cell.foodTitle.text != nil)
            XCTAssertTrue(cell.foodImageView.sd_imageURL == nil)
        }
    }
    
    func testSectionThreeNoTextButImageShouldExist() {
        //text should not be present
        //only image should show
        guard let tableView = sut?.tableView else { XCTFail("Expected tableView to be instantiated"); return }
        self.recipes.append(RecipeModel(item: foodOne))
        self.recipes.append(RecipeModel(item: foodTwo))
        
//        sut?.item.foodViewModels = listOfImageTitleStringVM
//        sut?.doneLoading()
        sut?.state = .populated//
        sut?.tableView.reloadData()
        
        //
        
        //guard let cell = sut?.tableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? ItemCell else { XCTFail("Expected cell to be instantiated"); return }
        
        //table view has not loaded cells
        //following tests are not run and evaluated
        guard let cell = sut?.tableView.cellForRow(at: IndexPath(row: 1, section: 3)) as? RecipeCell else { return XCTFail()}
        
        
        XCTAssertEqual(tableView.numberOfSections, 3)
        XCTAssertEqual(tableView.numberOfRows(inSection: 2), recipes.count)
        
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
