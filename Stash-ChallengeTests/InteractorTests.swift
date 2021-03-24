//
//  InteractorTests.swift
//  Stash-ChallengeTests
//
//  Created by Benjamin Staffan on 3/23/21.
//

@testable import Stash_Challenge
import XCTest

class InteractorTests: XCTestCase {

    var interactor:SmartInvestingInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = SmartInvestingInteractor()
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func test_import_file_valid(){
        interactor.fakeBackendCall()
        XCTAssertNotNil(interactor.returnedData, "File Read data was Nil")
    }
    
    func test_backend_return_success(){
        interactor.fakeBackendCall()
        XCTAssertTrue(interactor.returnedData.success ?? false, "Call Response Success was False")
    }
    
    func test_achievment_levels_greater_than_zero(){
        interactor.fakeBackendCall()
        XCTAssertGreaterThan(interactor.returnedData.achievements?.count ?? 0, 0)
    }
}
