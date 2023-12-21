import UIKit
import SnapKit
import Shared

public class AlertViewController: UIViewController {
    let tableView = UITableView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AlertCell.self, forCellReuseIdentifier: "MyCell")
            
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AlertViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? AlertCell else { return UITableViewCell() }
        cell.titleLabel.text = ["기획자 모집합니다.", "안드로이드 개발자 모십니다."][indexPath.row]
        cell.contentLabel.text = ["[기획자 급구] 사이드 프로젝트 하실 분 구함", "코틀린 가능한 분 모십니다"][indexPath.row]
        cell.titleLabel.font = Fonts.SH01.font
        cell.contentLabel.font = Fonts.Body01.font
        cell.titleLabel.textColor = SharedDSKitAsset.Colors.gr100.color
        cell.contentLabel.textColor = SharedDSKitAsset.Colors.gr100.color
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.backgroundColor = (cell.backgroundColor == UIColor(red: 242 / 255, green: 246 / 255, blue: 236 / 255, alpha: 1)) ? UIColor.white : UIColor(red: 242 / 255, green: 246 / 255, blue: 236 / 255, alpha: 1)
        }
    }
}

class AlertCell: UITableViewCell {
    var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목"
        
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "내용"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        [cellImageView, titleLabel, contentLabel].forEach {
            addSubview($0)
        }
        
        self.backgroundColor = .white
        
        cellImageView.snp.makeConstraints {
            $0.width.height.equalTo(48)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(271)
            $0.height.equalTo(20)
            $0.leading.equalToSuperview().inset(84)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(self.snp.top).offset(18.5)
        }
        
        contentLabel.snp.makeConstraints {
            $0.width.equalTo(271)
            $0.height.equalTo(20)
            $0.leading.equalToSuperview().inset(84)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.top).offset(22)
        }
    }
}
