import Foundation
import Combine
import UIKit

struct MainViewModel {

  var arrayNum: Int = 0

  var intPublished = CurrentValueSubject<Int, Never>(0)

  var cancellable = Set<AnyCancellable>()

  private var arr = 0

  mutating func fireTimer() {
    if arrayNum < (arr - 1) {
      arrayNum += 1
    } else {
      arrayNum = 0
    }
    intPublished.send(arrayNum)
  }

  mutating func fetchQuoteData() -> Future<[QuoteData], Never> {
    let bundleInfo: [QuoteData] = Bundle.main.decode([QuoteData].self, from: "Omada.json")
    arr = bundleInfo.count
    return Future { promise in
      promise(.success(bundleInfo))
    }
  }
}

