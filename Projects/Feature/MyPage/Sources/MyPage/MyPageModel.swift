import RxDataSources

public struct ActivityTableViewItem {
    var title: String
    var cnt: String
}

public struct ActivitySection {
    var header: String
    public var items: [ActivityTableViewItem]
}

extension ActivitySection: SectionModelType {
    public typealias Item = ActivityTableViewItem

    public init(original: ActivitySection, items: [Item]) {
        self = original
        self.items = items
    }
}
