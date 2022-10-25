//
//  ViewController.swift
//  OmadaHealthApp
//
//  Created by Sam Greenhill on 10/24/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

  var viewModel = MainViewModel()

  let rootView = MainView()

  override func loadView() {
    view = rootView

    viewModel.fetchQuoteData()
      .combineLatest(viewModel.intPublished)
      .sink { [weak self] (quoteData, arrayInt) in
        let time = (Double(quoteData[arrayInt].delayTime) / Values.delayTimeDiv)

        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { _ in
          UIView.animate(withDuration: 1, animations: {
            self?.rootView.customView.quoteLbl.alpha = Values.disappearAlpha
            self?.rootView.customView.authorLbl.alpha = Values.disappearAlpha
          }) { _ in
            UIView.animate(withDuration: 1) {
              self?.rootView.customView.quoteLbl.alpha = Values.appearAlpha
              self?.rootView.customView.authorLbl.alpha = Values.appearAlpha
              self?.viewModel.fireTimer()
            }
          }
        }
        self?.rootView.customView.quoteLbl.text = quoteData[arrayInt].quote
        self?.rootView.customView.authorLbl.text = quoteData[arrayInt].author
        self?.rootView.backgroundImage.image = UIImage(named: quoteData[arrayInt].author)
      }
      .store(in: &viewModel.cancellable)
  }

  private enum Values {
    static let delayTimeDiv = 1000.0
    static let disappearAlpha = 0.0
    static let appearAlpha = 1.0
  }

}
