//
//  SelfDevelopViewController.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/05.
//

import UIKit
import RxCocoa
import Shared

public class SelfDevelopViewController: UIViewController {
    let selfDevelopView = SelfDevelopView()

    let data = ["[디자이너 급구] 사이드 프로젝트","[백엔드] 사이드 플젝 하실분","three","four","five"]

    public override func loadView() {
        super.loadView()
        view = selfDevelopView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        selfDevelopView.tableView.delegate = self
        selfDevelopView.tableView.dataSource = self
    }
}

extension SelfDevelopViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 데이터가 없어 임의로 5개 데이터만 보여주도록 설정.
      return 5
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        selfDevelopView.tableView.register(CodingCustomTableViewCell.self, forCellReuseIdentifier: "CodingCustomTableViewCell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CodingCustomTableViewCell", for: indexPath) as? CodingCustomTableViewCell else { return UITableViewCell() }
        cell.label.text = data[indexPath.row]
        selfDevelopView.tableView.rowHeight = 130
        cell.selectionStyle = .none
        return cell
    }
}
