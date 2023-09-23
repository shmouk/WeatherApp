//
//  UserInterface.swift
//  MyProject
//
//  Created by Марк on 13.06.23.
//

import UIKit

class UserInterfaceBuilder: UIViewController {
    
    func refreshControl() -> UIRefreshControl {
        UIRefreshControl()
    }
    
    func сreatePageControl() -> UIPageControl {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 500, height: 0))
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }
    
    func createNavBar() -> UINavigationBar {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }
    
    func createScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }
    
    func createView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        let blurEffectView = createBlur()
        view.addSubview(blurEffectView)
        view.layer.cornerRadius = 20.0
        view.clipsToBounds = true
        return view
    }
    
    func createContainerStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        //        stackView.alignment = .center
        //        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
    
    func createImageView() -> UIImageView{
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func createLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }
    
    func createButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.placeholderText, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }
    
    func createBlur() -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.8
        return blurEffectView
    }
}
    
