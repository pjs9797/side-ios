//
//  HomeView.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/11/29.
//

import UIKit
import SnapKit
import Shared
import RxCocoa

class HomeView: UIView {
    
    var itemName: [String] = ["토익 스터디", "드로잉 함께 해요", "운동", "카페", "게임", "요리"]
    var itemImage: [UIImage] = [SharedDSKitAsset.Icons.thumb.image, SharedDSKitAsset.Icons.thumb2.image, SharedDSKitAsset.Icons.thumb3.image, SharedDSKitAsset.Icons.thumb.image, SharedDSKitAsset.Icons.thumb2.image, SharedDSKitAsset.Icons.thumb3.image]
    
    var segmentedControl: UISegmentedControl = {
        let segmentedControl = UnderlineSegmentedControl(items: ["추천", "자기계발", "취미"])
        return segmentedControl
    }()
 
    var recommendView: UIView = {
        let view = UIView()
        return view
    }()
    
    var selfDevelopmentView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    var hobbyView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    var stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    var bannerView: UIView = { // 배너 뷰
        let view = UIView()
        view.backgroundColor = SharedDSKitAsset.Colors.gr90.color
        view.layer.cornerRadius = 16
        return view
        
    }()
    
    var bannerMainLabel: UILabel = {
        let label = UILabel()
        label.text = "취미 클래스를 찾으러 가볼까요?"
        label.font = Fonts.H01.font
        label.textColor = SharedDSKitAsset.Colors.white.color
        label.numberOfLines = 2
        return label
    }()
    
    var bannerSubLabel: UILabel = {
        let label = UILabel()
        label.text = "우리 집 근처에 있는"
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.white.color
        return label
    }()
    
    var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconSearch24.image, for: .normal)
        return button
    }()
    
    var alarmButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.bellDefault.image, for: .normal)
        return button
    }()
    
    var shortMeetingClearButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var shortMeetingButtonViewMainLabel: UILabel = {
        let label = UILabel()
        label.text = "단기 모임 추천"
        label.font = Fonts.H01.font
        return label
    }()
    
    var shortMeetingButtonViewSubLabel: UILabel = {
        let label = UILabel()
        label.text = "단기 모임으로 부담없게 시작하세요."
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var longMeetingClearButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var longMeetingButtonViewMainLabel: UILabel = {
        let label = UILabel()
        label.text = "지속형 모임 추천"
        label.font = Fonts.H01.font
        return label
    }()
    
    var longMeetingButtonViewSubLabel: UILabel = {
        let label = UILabel()
        label.text = "꾸준함을 이길것은 없다!"
        label.font = Fonts.Body01.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    
    var verticalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    var horizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    var horizontalScrollView2: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render(){
        self.backgroundColor = .white
        addSubViews([segmentedControl, selfDevelopmentView, hobbyView, recommendView, searchButton, alarmButton ])
        
        recommendView.addSubViews([verticalScrollView])

        verticalScrollView.addSubViews([bannerView, shortMeetingButtonViewMainLabel, shortMeetingButtonViewSubLabel, shortMeetingClearButton, longMeetingButtonViewMainLabel,longMeetingButtonViewSubLabel, longMeetingClearButton,horizontalScrollView,horizontalScrollView2 ])
        
        horizontalScrollView.addSubview(stackView1)
        
        horizontalScrollView2.addSubview(stackView2)
        
        bannerView.addSubViews([bannerMainLabel, bannerSubLabel])
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(49)
        }
        
        recommendView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        selfDevelopmentView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        hobbyView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalTo(alarmButton.snp.leading).offset(-20)
        }
        alarmButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        bannerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(335)
            make.height.equalTo(184)
        }
                
        bannerMainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(150)
            make.leading.equalToSuperview().offset(20)
        }
        
        bannerSubLabel.snp.makeConstraints { make in
            make.bottom.equalTo(bannerMainLabel.snp.top).offset(-8)
            make.leading.equalTo(20)
        }
        
        verticalScrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        horizontalScrollView.snp.makeConstraints { make in
            make.top.equalTo(shortMeetingButtonViewSubLabel.snp.bottom).offset(8)
            make.height.equalTo(234)
            make.width.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            
        }
        horizontalScrollView2.snp.makeConstraints { make in
            make.top.equalTo(longMeetingButtonViewSubLabel.snp.bottom).offset(8)
            make.height.equalTo(234)
            make.width.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    
        stackView1.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.height.equalTo(113)
            make.leading.equalToSuperview().offset(20)
        }
        stackView2.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.height.equalTo(113)
            make.leading.equalToSuperview().offset(20)
        }
        shortMeetingButtonViewMainLabel.snp.makeConstraints { make in
            make.top.equalTo(bannerView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
        }
        shortMeetingButtonViewSubLabel.snp.makeConstraints { make in
            make.top.equalTo(shortMeetingButtonViewMainLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(20)
        }
        
        shortMeetingClearButton.snp.makeConstraints { make in
            make.top.equalTo(bannerView.snp.bottom).offset(40)
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(49)
        }
        
        longMeetingButtonViewMainLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalScrollView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
        }
        longMeetingButtonViewSubLabel.snp.makeConstraints { make in
            make.top.equalTo(longMeetingButtonViewMainLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(20)
        }
        longMeetingClearButton.snp.makeConstraints { make in
            make.top.equalTo(horizontalScrollView.snp.bottom).offset(40)
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(49)
        }
        
        addItems()
        addItems2()
       
    }
    private func addItems() {
           (0..<6).map { idx in
               let titleLabel = UILabel()
               titleLabel.text = itemName[idx]
               titleLabel.font = Fonts.SH02Bold.font
               
               let tagCategoryButton = UIButton()
               tagCategoryButton.setTitle("# 사이드프로젝트", for: .normal)
               tagCategoryButton.layer.cornerRadius = 16
               tagCategoryButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
               tagCategoryButton.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
               tagCategoryButton.titleLabel?.font = Fonts.ST01.font
               
               let tagTypeButton = UIButton()
               tagTypeButton.setTitle("단기", for: .normal)
               tagTypeButton.layer.cornerRadius = 12
               tagTypeButton.setTitleColor(UIColor(red: 0/255, green: 85/255, blue: 163/255, alpha: 1), for: .normal)
               tagTypeButton.backgroundColor = UIColor(red: 227/255, green: 238/255, blue: 251/255, alpha: 1)
               tagTypeButton.titleLabel?.font = Fonts.ST01.font
               
               let itemView: UIView = {
                   let view = UIImageView()
                   view.image = itemImage[idx]
                   view.snp.makeConstraints { make in
                       make.height.equalTo(113)
                       make.width.equalTo(151.5)
                   }
                   return view
               }()
               itemView.addSubViews([titleLabel, tagCategoryButton, tagTypeButton])
                                     
               itemView.snp.makeConstraints { make in
                   make.height.equalTo(113)
                   make.width.equalTo(151.5)
               }
               titleLabel.snp.makeConstraints { make in
                   make.top.equalToSuperview().offset(160)
                   make.leading.equalToSuperview()
               }
               tagCategoryButton.snp.makeConstraints { make in
                   make.top.equalTo(titleLabel.snp.bottom).offset(20)
                   make.leading.equalToSuperview()
                   make.width.equalTo(99)
                   make.height.equalTo(25)
               }
               tagTypeButton.snp.makeConstraints { make in
                   make.bottom.equalTo(titleLabel.snp.top).offset(-10)
                   make.width.equalTo(45)
                   make.height.equalTo(25)
                   make.leading.equalToSuperview()
               }
                                     
               return itemView
           }
           .forEach(stackView1.addArrangedSubview)
        
       }
    private func addItems2() {
        (0..<6).map { idx in
            let titleLabel = UILabel()
            titleLabel.text = itemName[idx]
            titleLabel.font = Fonts.SH02Bold.font
            
            let tagCategoryButton = UIButton()
            tagCategoryButton.setTitle("# 사이드프로젝트", for: .normal)
            tagCategoryButton.layer.cornerRadius = 16
            tagCategoryButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
            tagCategoryButton.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
            tagCategoryButton.titleLabel?.font = Fonts.ST01.font
            
            let tagTypeButton = UIButton()
            tagTypeButton.setTitle("지속", for: .normal)
            tagTypeButton.layer.cornerRadius = 12
            tagTypeButton.setTitleColor(UIColor(red: 81/255, green: 163/255, blue: 0/255, alpha: 1), for: .normal)
            tagTypeButton.backgroundColor = UIColor(red: 235/255, green: 248/255, blue: 220/255, alpha: 1)
            tagTypeButton.titleLabel?.font = Fonts.ST01.font
            
            let itemView: UIView = {
                let view = UIImageView()
                view.image = itemImage[idx]
                view.snp.makeConstraints { make in
                    make.height.equalTo(113)
                    make.width.equalTo(151.5)
                }
                return view
            }()
            itemView.addSubViews([titleLabel, tagCategoryButton, tagTypeButton])
                                  
            itemView.snp.makeConstraints { make in
                make.height.equalTo(113)
                make.width.equalTo(151.5)
            }
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(160)
                make.leading.equalToSuperview()
            }
            tagCategoryButton.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.leading.equalToSuperview()
                make.width.equalTo(99)
                make.height.equalTo(25)
            }
            tagTypeButton.snp.makeConstraints { make in
                make.bottom.equalTo(titleLabel.snp.top).offset(-10)
                make.width.equalTo(45)
                make.height.equalTo(25)
                make.leading.equalToSuperview()
            }
                                  
            return itemView
        }
        .forEach(stackView2.addArrangedSubview)
    }
}
