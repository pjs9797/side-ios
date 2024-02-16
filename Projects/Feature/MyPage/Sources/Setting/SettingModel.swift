import RxDataSources

enum SettingTableViewItem {
    case Info(mainLabelText: String, infoLabelText: String)
    case Terms(mainLabelText: String)
    case Logout(mainLabelText: String)
}

struct SettingSection {
    var items: [Item]
}

extension SettingSection: SectionModelType {
    typealias Item = SettingTableViewItem
    
    init(original: SettingSection, items: [Item]) {
        self = original
        self.items = items
    }
}
