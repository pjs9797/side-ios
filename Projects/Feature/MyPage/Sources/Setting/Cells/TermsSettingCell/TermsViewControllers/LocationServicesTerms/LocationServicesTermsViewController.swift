import UIKit
import ReactorKit
import SnapKit
import Shared

class LocationServicesTermsViewController: UIViewController, ReactorKit.View{
    var disposeBag = DisposeBag()
    let backButton = UIBarButtonItem(image: SharedDSKitAsset.Icons.iconArrowLeft24.image, style: .plain, target: nil, action: nil)
    let scrollView = UIScrollView()
    let contentView = UIView()
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = LocationServicesTermsModel.text
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    public init(with reactor: TermsReactor) {
        super.init(nibName: nil, bundle: nil)
        
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.styledTextToTextView(textView: self.textView, fullText: self.textView.text)
        setNavigationbar()
        layout()
    }
    
    private func setNavigationbar() {
        self.title = "개인정보처리방침"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : Fonts.SH03Bold.font,
            .foregroundColor: UIColor.black
        ]
        self.backButton.tintColor = SharedDSKitAsset.Colors.black.color
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func layout(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(textView)
        
        scrollView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.bottom.equalToSuperview().offset(-16*Constants.standardHeight)
        }
    }
    
    func styledTextToTextView(textView: UITextView, fullText: String) {
        let baseAttributes: [NSAttributedString.Key: Any] = [
            .font: Fonts.Body02.font,
            .foregroundColor: SharedDSKitAsset.Colors.text03.color
        ]
        let attributedString = NSMutableAttributedString(string: fullText, attributes: baseAttributes)
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: Fonts.SH03Bold.font
        ]
        let regexPattern = "\\*\\*(.*?)\\*\\*"
        
        if let regex = try? NSRegularExpression(pattern: regexPattern, options: []) {
            let matches = regex.matches(in: fullText, options: [], range: NSRange(location: 0, length: fullText.utf16.count))
            
            for match in matches.reversed() {
                let matchRange = match.range(at: 1)
                attributedString.addAttributes(titleAttributes, range: matchRange)
                let fullMatchRange = match.range(at: 0)
                attributedString.replaceCharacters(in: NSRange(location: fullMatchRange.location, length: 2), with: "")
                attributedString.replaceCharacters(in: NSRange(location: fullMatchRange.location + fullMatchRange.length - 4, length: 2), with: "")
            }
        }
        
        textView.attributedText = attributedString
    }
}

extension LocationServicesTermsViewController{
    func bind(reactor: TermsReactor) {
        backButton.rx.tap
            .map{ Reactor.Action.backButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
