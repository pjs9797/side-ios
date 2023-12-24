//
//  MakeScheduleViewController.swift
//  FeatureChat
//
//  Created by 강민성 on 12/21/23.
//

import UIKit
import Shared

public class MakeScheduleViewController: UIViewController {
    
    var makeScheduleView = MakeScheduleView()
    
    public override func loadView() {
        super.loadView()
        view = makeScheduleView
        
        let dismissBarButtonItem = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowClose24.image, style: .plain, target: self, action: #selector(didTapDismissButton))
        let postBarButtonItem = UIBarButtonItem(title: "게시", style: .plain, target: self, action: #selector(didTapPostButton))
        
        navigationItem.title = "일정 올리기"
        navigationItem.setRightBarButton(postBarButtonItem, animated: true)
        navigationItem.setLeftBarButton(dismissBarButtonItem, animated: true)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        render()
        setUp()
    }
    
    private func setUp() {
        makeScheduleView.timeButton.addTarget(self, action: #selector(didTapTimeButton), for: .touchUpInside)
        
        var tap = UIGestureRecognizer(target: self, action: #selector(didTapView))
    }
    
    @objc private func didTapTimeButton() {
        let dateAlert = UIAlertController(title: "날짜 선택", message: "원하는 날짜를 선택해주세요", preferredStyle: .actionSheet)
        let timeAlert = UIAlertController(title: "시간 선택", message: "원하는 시간을 선택해주세요", preferredStyle: .actionSheet)

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko_KR")
        
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.locale = Locale(identifier: "ko_KR")
        
        let dateOk = UIAlertAction(title: "날짜 선택완료", style: .default) { action in
            self.present(timeAlert, animated: true)
        }
        let dismissAction = UIAlertAction(title: "선택 취소", style: .destructive) { action in
            self.dismiss(animated: true)
        }
        let timeOk = UIAlertAction(title: "시간 선택완료", style: .default) { action in
            self.makeScheduleView.dateLabel.text = self.changeDate(date: datePicker.date)
            self.makeScheduleView.dateLabel.textColor = SharedDSKitAsset.Colors.gr100.color
            
            self.makeScheduleView.timeLabel.text = self.changeTime(date: timePicker.date)
            self.makeScheduleView.timeLabel.textColor = SharedDSKitAsset.Colors.gr100.color
        }
        
        dateAlert.addAction(dateOk)
        dateAlert.addAction(dismissAction)
        timeAlert.addAction(timeOk)
        timeAlert.addAction(dismissAction)
                
        let dateViewController = UIViewController()
        dateViewController.view = datePicker
        let timeViewController = UIViewController()
        timeViewController.view = timePicker
                
        dateAlert.setValue(dateViewController, forKey: "contentViewController")
        timeAlert.setValue(timeViewController, forKey: "contentViewController")
                
        present(dateAlert, animated: true)
    }
    
    private func changeDate(date: Date) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy. MM. dd"
        
        return formatter.string(from: date)
    }
    
    private func changeTime(date: Date) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "a HH:mm"
        
        return formatter.string(from: date)
    }
    
    @objc private func didTapPostButton() {
        self.dismiss(animated: true)
    }
    
    @objc private func didTapDismissButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapView() {
        self.dismiss(animated: true)
    }
    
    private func render() {
        
    }

}
