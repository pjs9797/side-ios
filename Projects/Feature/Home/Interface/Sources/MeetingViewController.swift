import UIKit
import SnapKit
import Shared

public class MeetingViewController: UIViewController {
    let tableView = UITableView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MeetingCell.self, forCellReuseIdentifier: "MeetingCell")
            
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MeetingViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MeetingCell", for: indexPath) as? MeetingCell else { return UITableViewCell() }
        cell.contentLabel.font = Fonts.SH01Bold.font
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

class MeetingCell: UITableViewCell {
    var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "내용"
        
        return label
    }()
    
    var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemCyan
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        [contentLabel, cellImageView].forEach {
            addSubview($0)
        }
        
        self.backgroundColor = .white
        
        contentLabel.snp.makeConstraints {
            $0.width.equalTo(271)
            $0.height.equalTo(20)
            $0.leading.equalToSuperview().inset(84)
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        cellImageView.snp.makeConstraints {
            $0.width.height.equalTo(48)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
}
