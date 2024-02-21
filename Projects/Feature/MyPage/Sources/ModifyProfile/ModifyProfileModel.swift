public struct ModifyProfileCellData: Equatable{
    let item: String
    var isSelected: Bool
}

struct DevelopCellData {
    static let cellData = [
        ModifyProfileCellData(item: "스터디 · 자격증", isSelected: false),
        ModifyProfileCellData(item: "사이드 프로젝트", isSelected: false),
        ModifyProfileCellData(item: "이직준비", isSelected: false),
        ModifyProfileCellData(item: "어학", isSelected: false),
        ModifyProfileCellData(item: "재테크", isSelected: false),
        ModifyProfileCellData(item: "기타", isSelected: false)
    ]
}

struct HobbyCellData {
    static let cellData = [
        ModifyProfileCellData(item: "음악 · 악기", isSelected: false),
        ModifyProfileCellData(item: "문화 · 예술", isSelected: false),
        ModifyProfileCellData(item: "운동 · 스포츠", isSelected: false),
        ModifyProfileCellData(item: "여행 · 드라이브", isSelected: false),
        ModifyProfileCellData(item: "댄스 · 무용", isSelected: false),
        ModifyProfileCellData(item: "공예", isSelected: false),
        ModifyProfileCellData(item: "사교 · 동네친구", isSelected: false),
        ModifyProfileCellData(item: "핫플투어", isSelected: false),
        ModifyProfileCellData(item: "독서 · 인문학", isSelected: false),
        ModifyProfileCellData(item: "외국어 · 언어", isSelected: false),
        ModifyProfileCellData(item: "사진 · 영상", isSelected: false),
        ModifyProfileCellData(item: "그 외", isSelected: false)
    ]
}
