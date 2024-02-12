class MeetingDataManager {
    static let shared = MeetingDataManager()
    
    private init() {}
    
    var categoryMajor: String = ""
    var categorySub: String = ""
    var meetingType: String = ""
}
