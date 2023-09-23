import UIKit

class MainTabBarController: UITabBarController {
    
    lazy var pageControl = userInterfaceBuilder.сreatePageControl()
    lazy var buttonOnTabBar = userInterfaceBuilder.createButton()
    lazy var blurView = userInterfaceBuilder.createBlur()
    
    let userInterfaceBuilder = UserInterfaceBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    private func setUI() {
        generateTabBar()
        setupPageControl()
        addSubviews()
        setupViews()
        setupTargets()
        
    }
    
    private func setupViews() {
        delegate = self
        setBarAppearanceUpdate()
        setupConstraints()
    }
    
    private func addSubviews() {
//        tabBar.addSubview(blurView)
        view.addSubview(pageControl)
//        tabBar.addSubview(buttonOnTabBar)
    }
    
    private func generateTabBar() {
        let viewController = ViewController()
        let secondViewController = SecondViewController()
        viewController.tabBarItem = UITabBarItem(title: "Current", image: UIImage(systemName: "list.bullet.rectangle.portrait"), tag: 0)
  
        secondViewController.tabBarItem = UITabBarItem(title: "Changing", image: UIImage(systemName: "doc.text.magnifyingglass"), tag: 1)

        viewControllers = [viewController,
                           secondViewController]
        
    }
    
    private func setBarAppearanceUpdate() {
        tabBar.backgroundColor = #colorLiteral(red: 0.7924358249, green: 0.9457847476, blue: 0.9248284698, alpha: 1)
        tabBar.barStyle = .black
        view.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.itemPositioning = .fill
        tabBar.barTintColor = .black
    }
    
    private func setupPageControl() {
        pageControl.isEnabled = false
        pageControl.numberOfPages = viewControllers?.count ?? 0
    }
    
    private func setupTargets() {
        addTarget()
    }
    
    private func addTarget() {
        buttonOnTabBar.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
}

extension MainTabBarController {
    @objc private func handleButtonTap() {
        guard let viewControllers = viewControllers, let selectedVC = selectedViewController,
              let currentIndex = viewControllers.firstIndex(of: selectedVC ) else { return }
        
        let nextIndex = (currentIndex + 1) % viewControllers.count
        let destinationVC = viewControllers[nextIndex]
        
        UIView.transition(from: selectedVC.view, to: destinationVC.view, duration: 0.4, options: .transitionFlipFromRight, completion: { _ in
            self.selectedViewController = destinationVC
            self.pageControl.currentPage = nextIndex
        })
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let selectedVC = selectedViewController {
                        pageControl.currentPage = viewControllers?.firstIndex(of: selectedVC) ?? 0
        }
    }
}
