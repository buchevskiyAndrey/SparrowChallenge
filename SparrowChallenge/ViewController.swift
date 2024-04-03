//
//  ViewController.swift
//  SparrowChallenge
//
//  Created by Бучевский Андрей on 01.04.2024.
//

import UIKit

class ViewController: UIViewController {

    let gradientView: GradientView = {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.widthAnchor.constraint(equalToConstant: 100),
            gradientView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}


final class GradientView: UIView {

    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.red.cgColor,
            UIColor.purple.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.locations = [0, 0.5, 1]
        gradient.cornerRadius = 20
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.addSublayer(gradientLayer)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        layer.shadowRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        gradientLayer.frame = bounds
    }
}
