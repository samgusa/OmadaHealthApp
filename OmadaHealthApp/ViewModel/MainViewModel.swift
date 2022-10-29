import Foundation
import Combine
import UIKit

struct MainViewModel {

  var arrayNum: Int = 0

  var intPublished = CurrentValueSubject<Int, Never>(0)

  var cancellable = Set<AnyCancellable>()

  // What to do if there are more quotes in the json.
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

extension MainViewModel {

  // How I would do a network call
  mutating func fetchCombine() {
    guard let url = URL(string: "") else { return }
    URLSession
      .shared
      .dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: [QuoteData].self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
      .sink { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print(error)
        }
      } receiveValue: { quoteData in

      }
      .store(in: &cancellable)
  }


}
