//
//  OmadaHealthAppTests.swift
//  OmadaHealthAppTests
//
//  Created by Sam Greenhill on 10/24/22.
//

import XCTest
@testable import OmadaHealthApp

final class OmadaHealthAppTests: XCTestCase {

  var quoteArr: [QuoteData]!

  var sut: MainViewModel!

    override func setUpWithError() throws {
      try super.setUpWithError()
      sut = MainViewModel()
      sut.fetchQuoteData()
        .sink { [weak self] quoteData in
          self?.quoteArr = quoteData
        }
        .store(in: &sut.cancellable)

    }

    override func tearDownWithError() throws {
        sut = nil
      try super.tearDownWithError()
      quoteArr = []
    }

  func test_FetchData_FirstQuote_Works_Return_True() {
    let fetchedQuoteOne = quoteArr[0].quote

    XCTAssertTrue(fetchedQuoteOne == "Help me, Obi-Wan Kenobi. You’re my only hope.")
  }

  func test_FetchData_secondAuthor_Return_True() {

    let fetchedAuthorOne = quoteArr[1].author

    XCTAssertTrue(fetchedAuthorOne == "Obi-Wan Kenobi")
  }


  func test_FetchData_ThirdDelay_Return_True() {
    let fetchedDelayOne = quoteArr[2].delayTime

    XCTAssertTrue(fetchedDelayOne == 6000)
  }

}
