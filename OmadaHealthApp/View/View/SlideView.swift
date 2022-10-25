//
//  SlideView.swift
//  OmadaHealthApp
//
//  Created by Sam Greenhill on 10/24/22.
//

import UIKit

class SlideView: UIView {

  lazy var quoteLbl: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.numberOfLines = Values.lblLineNumber
    lbl.font = .boldSystemFont(ofSize: Values.quoteLblFontSize)
    lbl.adjustsFontSizeToFitWidth = true
    lbl.textAlignment = .left
    lbl.textColor = .label
    return lbl
  }()

  lazy var authorLbl: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.font = UIFont.systemFont(ofSize: Values.authorLblFontSize)
    lbl.textColor = .label
    return lbl
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    self.backgroundColor = .systemBackground.withAlphaComponent(Values.backgroundAlpha)
    self.addSubview(quoteLbl)
    self.addSubview(authorLbl)

    NSLayoutConstraint.activate([
      quoteLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: Values.quoteTopAnchor),
      quoteLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      quoteLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Values.widthMultiplier),
      quoteLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Values.quoteHeightMultiplier),
      authorLbl.topAnchor.constraint(equalTo: quoteLbl.bottomAnchor, constant: Values.authorTopAnchor),
      authorLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      authorLbl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Values.widthMultiplier),
      authorLbl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Values.authorHeightMultiplier),
      authorLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Values.authorBottomAnchor)

    ])
  }

  private enum Values {
    static let lblLineNumber = 0
    static let quoteLblFontSize = 30.0
    static let authorLblFontSize = 15.0
    static let backgroundAlpha = 0.8
    static let quoteTopAnchor = 30.0
    static let widthMultiplier = 0.8
    static let quoteHeightMultiplier = 0.5
    static let authorTopAnchor = 30.0
    static let authorHeightMultiplier = 0.2
    static let authorBottomAnchor = -30.0
  }
}
