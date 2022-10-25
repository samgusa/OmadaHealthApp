import Foundation
import Combine
import UIKit

struct MainViewModel {

  var arrayNum: Int = 0

  var intPublished = CurrentValueSubject<Int, Never>(0)

  var cancellable = Set<AnyCancellable>()

  mutating func fireTimer() {
    if arrayNum < 3 {
      arrayNum += 1
    } else {
      arrayNum = 0
    }
    intPublished.send(arrayNum)
  }

  func fetchQuoteData() -> Future<[QuoteData], Never> {
    return Future { promise in
      let bundleInfo: [QuoteData] = Bundle.main.decode([QuoteData].self, from: "Omada.json")
      promise(.success(bundleInfo))
    }
  }
}

