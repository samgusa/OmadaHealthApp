import Foundation

struct QuoteData: Decodable {

  let quote: String
  let author: String
  let delayTime: Int

  enum CodingKeys: String, CodingKey {
    case delayTime = "slideTransitionDelay"
    case quote, author
  }
}
