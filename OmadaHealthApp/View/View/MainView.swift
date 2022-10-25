import Foundation
import UIKit

final class MainView: UIView {

  lazy var customView: SlideView = {
    var view = SlideView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
    view.layer.cornerRadius = Values.slideViewCornerRadius
    return view
  }()

  lazy var backgroundImage: UIImageView = {
    var view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    view.alpha = Values.backgroundImgAlpha
    return view
  }()

  init() {
    super.init(frame: .zero)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupView() {
    self.backgroundColor = .systemBackground
    self.addSubview(backgroundImage)
    self.addSubview(customView)

    NSLayoutConstraint.activate([
      backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
      backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      customView.centerXAnchor.constraint(equalTo: self.backgroundImage.centerXAnchor),
      customView.centerYAnchor.constraint(equalTo: self.backgroundImage.centerYAnchor),
      customView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Values.widthMultiplier),
    ])
  }

  private enum Values {
    static let slideViewCornerRadius = 10.0
    static let backgroundImgAlpha = 0.5
    static let widthMultiplier = 0.8
  }
}


