//
//  NSCViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/20/23.
//

import UIKit
import Shared
import FeatureChatInterface
import SnapKit

public struct MockUpScheduleData {
    
    var mockup = [MockUpScheduleModel(id: 1, title: "주말 영어 스터디", time: "2023. 11. 15 오후 17:00", location: "스타벅스 강남역점", memberCount: "5/6"),MockUpScheduleModel(id: 2, title: "주말 영어 스터디", time: "2023. 11. 15 오후 17:00", location: "스타벅스 강남역점", memberCount: "5/6"),MockUpScheduleModel(id: 3, title: "주말 영어 스터디", time: "2023. 11. 15 오후 17:00", location: "스타벅스 강남역점스타벅스 강남역점스타벅스 강남역점스타벅스 강남역점", memberCount: "5/6")]
}

public struct MockUpNoticeData {
    
    var mockup = [MockUpNoticeModel(id: 1, title: "들어오시면 바로 자기소개 부탁드려요~", dateAndAdmin: "2023. 11. 15 방장님님님", isPinned: true), MockUpNoticeModel(id: 2, title: "필독 !! 최근에 눈팅만 하는 분들이 늘어난 것 같은데 그러지맙시다", dateAndAdmin: "2023. 11. 15 방장님님님", isPinned: false), MockUpNoticeModel(id: 2, title: "필독 !! 최근에 눈팅만 하는 분들이 늘어난 것 같은데 그러지맙시다", dateAndAdmin: "2023. 11. 15 방장님님님", isPinned: false), MockUpNoticeModel(id: 2, title: "필독 !! 최근에 눈팅만 하는 분들이 늘어난 것 같은데 그러지맙시다", dateAndAdmin: "2023. 11. 15 방장님님님", isPinned: false)]
}

public class NSVViewController: UIViewController {
    
    var selectedSegmentIndex: Int = 0
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UnderlineSegmentedControl(items: ["공지", "일정"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    var noticeMockUpData = MockUpNoticeData()
    var scheduleMockUpData = MockUpScheduleData()
    
    init(selectedSegmentIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        self.selectedSegmentIndex = selectedSegmentIndex
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = selectedSegmentIndex
        setUp()
        registerTableView()
        render()
    }
    
    @objc private func segmentedControlSelected() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            tableView.reloadData()
            break
            
        case 1:
            tableView.reloadData()
            break
        default:
            break
        }
    }
    
    private func registerTableView() {
        tableView.register(NoticeListTableViewCell.self, forCellReuseIdentifier: NoticeListTableViewCell.className)
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.className)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUp() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "영화관투어모임 영사모 >_<"
        navigationController?.navigationBar.tintColor = SharedDSKitAsset.Colors.gr100.color
        
        let postButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconWrite16.image, style: .plain, target: self, action: #selector(tapPostButton))
        
        let dismissButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowClose24.image, style: .plain, target: self, action: #selector(tapDismissButton))
        navigationItem.setRightBarButton(postButton, animated: true)
        
        navigationItem.setLeftBarButton(dismissButton, animated: true)
        
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor:
                    SharedDSKitAsset.Colors.text03.color,
                .font: Fonts.Body02.font
            ],
            for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor:
                    SharedDSKitAsset.Colors.green.color,
                .font: Fonts.SH02Bold.font
            ],
            for: .selected
        )
        self.segmentedControl.addTarget(self, action: #selector(segmentedControlSelected), for: .valueChanged)
    }
    
    private func render() {
        view.addSubViews([segmentedControl, tableView])
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(49)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom)
        }
    }
    
    @objc private func tapPostButton() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let viewController = MakeNoticeViewController()
            navigationController?.pushViewController(viewController, animated: true)
            
        case 1:
            let viewController = MakeScheduleViewController()
            navigationController?.pushViewController(viewController, animated: true)
            
        default:
            return
        }
    }
    
    @objc private func tapDismissButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NSVViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return noticeMockUpData.mockup.count
            
        case 1:
            return scheduleMockUpData.mockup.count
            
        default:
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let noticeCell = tableView.dequeueReusableCell(withIdentifier: NoticeListTableViewCell.className) as? NoticeListTableViewCell else { return UITableViewCell() }
        guard let scheduleCell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.className) as? ScheduleTableViewCell else { return UITableViewCell() }
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let data = self.noticeMockUpData.mockup[indexPath.row]
            noticeCell.noticeTitleLabel.text = data.title
            noticeCell.createdDateAndAdminLabel.text = data.dateAndAdmin
            noticeCell.pinnedImageView.isHidden = !data.isPinned
            return noticeCell
            
        case 1:
            let data = self.scheduleMockUpData.mockup[indexPath.row]
            scheduleCell.scheduleTitleLabel.text = data.title
            scheduleCell.timeLabel.text = data.time
            scheduleCell.locationLabel.text = data.location
            scheduleCell.memberCountLabel.text = data.memberCount
            return scheduleCell
            
        default:
            break
        }
        
        return noticeCell
    }
    
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let mockup = self.noticeMockUpData.mockup[indexPath.row]
            
            let pinToggle = UIContextualAction(style: .normal, title: "") { (_, _, success: @escaping (Bool) -> Void) in
                self.noticeMockUpData.mockup[indexPath.row].isPinned.toggle()
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
                success(true)
            }
            pinToggle.image = mockup.isPinned ? SharedDSKitAsset.Icons.iconPinGreen16.image : SharedDSKitAsset.Icons.iconPin16.image
            pinToggle.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
            
            return UISwipeActionsConfiguration(actions: [pinToggle])
            
        default:
            return nil
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            break
            
        case 1:
            let viewController = ScheduleDetailViewController()
            navigationController?.pushViewController(viewController, animated: true)
            break
            
        default:
            break
        }
    }
}
