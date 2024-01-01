//
//  PeriodPickerView.swift
//  FeatureHome
//
//  Created by 박중선 on 12/31/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Shared

// 시간을 나타내는 구조체
struct Time {
    var period: String
    var hour: Int
    var minute: Int
}

// 시간 선택기에 대한 뷰 모델
class TimePickerViewModel {
    // 외부 바인딩을 위한 프로퍼티
    var selectedTime: Observable<Time>
    let disposeBag = DisposeBag()
    
    // 내부 로직을 위한 프라이빗 프로퍼티
    private let timeSubject = BehaviorSubject<Time>(value: Time(period: "오전", hour: 1, minute: 0))
    
    init() {
        // timeSubject를 Observable로 변환
        self.selectedTime = timeSubject.asObservable()
        timeSubject.subscribe(onNext: { time in
            print(time)
        }).disposed(by: disposeBag)
    }
    
    // 오전/오후 선택 메서드
    func selectPeriod(_ period: String) {
        if let currentTime = try? timeSubject.value() {
            timeSubject.onNext(Time(period: period, hour: currentTime.hour, minute: currentTime.minute))
        }
    }
    
    // 시간 선택 메서드
    func selectHour(_ hour: Int) {
        if let currentTime = try? timeSubject.value() {
            timeSubject.onNext(Time(period: currentTime.period, hour: hour, minute: currentTime.minute))
        }
    }
    
    // 분 선택 메서드
    func selectMinute(_ minute: Int) {
        if let currentTime = try? timeSubject.value() {
            timeSubject.onNext(Time(period: currentTime.period, hour: currentTime.hour, minute: minute))
        }
    }
}

// 커스텀 UIPickerView 클래스
class CustomTimePickerView: UIPickerView,UIPickerViewDelegate,UIPickerViewDataSource {
    var timePickerViewModel: TimePickerViewModel
    let disposeBag = DisposeBag()
    let label = UILabel()
    private let amPm = ["오전", "오후"] // 오전/오후
    private let hours = Array(1...12) // 1시부터 12시
    private let minutes = Array(0...59) // 0분부터 59분
    
    
    init(timePickerViewModel: TimePickerViewModel) {
        self.timePickerViewModel = timePickerViewModel
        super.init(frame: .zero)
        self.delegate = self
        self.dataSource = self
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UIPickerViewDataSource 메서드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3 // 오전/오후, 시, 분
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return amPm.count
        case 1: return hours.count
        case 2: return minutes.count
        default: return 0
        }
    }
    
    // UIPickerViewDelegate 메서드
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        // 각 row에 대한 커스텀 뷰 생성
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.SH03.font
        //print(row)
        switch component{
        case 0:
            label.text = amPm[row]
            label.textColor = UIColor(red: 0.32, green: 0.64, blue: 0, alpha: 1)
        case 1:
            label.text = String(format: "%02d",hours[row])
            label.textColor = UIColor(red: 0.32, green: 0.64, blue: 0, alpha: 1)
        case 2:
            label.text = String(format: "%02d",minutes[row])
        default:
            break
        }
        label.textColor = .black
        //label.textColor = pickerView.selectedRow(inComponent: component) == row+1 ? UIColor(red: 0.32, green: 0.64, blue: 0, alpha: 1) : .black
        
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 현재 선택된 행을 강조하기 위해 해당 컴포넌트를 재로드합니다.
        //pickerView.reloadComponent(component)
        print("didSelectRow",row,component)
        label.textColor = pickerView.selectedRow(inComponent: component) == row ? UIColor(red: 0.32, green: 0.64, blue: 0, alpha: 1) : .black
    }
    
    // 각 컴포넌트의 너비 설정
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0: return 112 // 오전/오후 컴포넌트 너비
        case 1: return 84 // 시 컴포넌트 너비
        case 2: return 84 // 분 컴포넌트 너비
        default: return 0
        }
    }
    
    // 각 row의 높이 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 56 // row 높이
    }
    
    // 뷰 모델 바인딩 설정
    func bind() {
        
        // 사용자가 새로운 row를 선택할 때 뷰 모델 업데이트
        self.rx.itemSelected.subscribe(onNext: { [weak self] (row, component) in
            print(row,component)
            switch component {
            case 0:
                let period = self?.amPm[row]
                self?.timePickerViewModel.selectPeriod(period!)
            case 1:
                let hour = self?.hours[row]
                self?.timePickerViewModel.selectHour(hour!)
            case 2:
                let minute = self?.minutes[row]
                self?.timePickerViewModel.selectMinute(minute!)
            default:
                break
            }
        }).disposed(by: disposeBag)
        
         //뷰 모델이 변경될 때 UIPickerView 업데이트
        self.timePickerViewModel.selectedTime.subscribe(onNext: { [weak self] time in
            guard let self = self else { return }
            if let periodRow = self.amPm.firstIndex(of: time.period) {
                self.selectRow(periodRow, inComponent: 0, animated: true)
            }
            if let hourRow = self.hours.firstIndex(of: time.hour) {
                self.selectRow(hourRow, inComponent: 1, animated: true)
            }
            if let minuteRow = self.minutes.firstIndex(of: time.minute) {
                self.selectRow(minuteRow, inComponent: 2, animated: true)
            }
        }).disposed(by: disposeBag)
    }
    
}

