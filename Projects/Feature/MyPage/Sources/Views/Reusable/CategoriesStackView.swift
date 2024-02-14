//
//  CategoriesStackView.swift
//  FeatureMyPage
//
//  Created by 강민성 on 2/13/24.
//

import UIKit

class CategoriesStackView: UIStackView {
    
    let chip = ProfileCategoryChipsView(text: "테스트")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 8
        distribution = .fillEqually
    }
}
