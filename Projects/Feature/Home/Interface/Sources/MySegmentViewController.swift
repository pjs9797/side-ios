import UIKit
import SnapKit
import Shared

public class MySegmentViewController: UIViewController {
    var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        
        return container
    }()
    
    var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.green.color
        
        return view
    }()
    
    lazy var leadingDistance: NSLayoutConstraint = {
        return underLineView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
    }()
    
    private let segmentedControl: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        segment.insertSegment(withTitle: "전체 알림", at: 0, animated: true)
        segment.insertSegment(withTitle: "나의 모임", at: 1, animated: true)
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: SharedDSKitAsset.Colors.text03.color,
            NSAttributedString.Key.font: Fonts.Body02.font], for: .normal)
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: SharedDSKitAsset.Colors.green.color,
            NSAttributedString.Key.font: Fonts.SH02Bold.font
        ], for: .selected)
            
        return segment
    }()
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private var viewControllers: [UIViewController] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setNavigationBar()
        setupPageViewController()
        configure()
        setupSegmentedControl()
    }
    
    func setNavigationBar() {
        title = "알림"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
    }
    
    func configure() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(containerView)
        view.addSubview(pageViewController.view)
        containerView.addSubview(segmentedControl)
        containerView.addSubview(underLineView)
        
        containerView.snp.makeConstraints {
            $0.leading.equalTo(safeArea.snp.leading)
            $0.trailing.equalTo(safeArea.snp.trailing)
            $0.top.equalTo(safeArea.snp.top)
            $0.height.equalTo(100)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.top)
            $0.leading.equalTo(containerView.snp.leading)
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.centerX.equalTo(containerView.snp.centerX)
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalTo(segmentedControl.snp.bottom)
            $0.height.equalTo(5)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
        pageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        NSLayoutConstraint.activate([
            leadingDistance,
            underLineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
        ])
    }
    
    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    private func setupPageViewController() {
        let firstViewController = AlertViewController()
        let secondViewController = MeetingViewController()
        
        viewControllers = [firstViewController, secondViewController]
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([viewControllers.first!], direction: .forward, animated: true, completion: nil)
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedViewController = viewControllers[sender.selectedSegmentIndex]
        pageViewController.setViewControllers([selectedViewController], direction: .forward, animated: true, completion: nil)
        
        let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
         
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.leadingDistance.constant = leadingDistance
            self?.view.layoutIfNeeded()
        })
    }
}

extension MySegmentViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = viewControllers.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        
        return viewControllers[currentIndex - 1]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = viewControllers.firstIndex(of: viewController), currentIndex < viewControllers.count - 1 else {
            return nil
        }
        
        return viewControllers[currentIndex + 1]
    }
}
