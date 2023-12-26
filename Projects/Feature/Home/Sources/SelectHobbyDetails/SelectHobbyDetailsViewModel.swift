import RxSwift
import RxCocoa
import Shared

public class SelectHobbyDetailsViewModel{
    let disposeBag = DisposeBag()
    
    let backButtonTapped = PublishRelay<Void>()
    let nextButtonTapped = PublishRelay<Void>()
    
    let hobbyDetailTableViewCellData = Driver<[HobbyModel]>.just(
        [
            HobbyModel(title: "음악 · 악기", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.music.image, title: "음악"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.instrument.image, title: "악기"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "문화 · 예술", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.movie.image, title: "영화"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.performance.image, title: "공연"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.musical.image, title: "뮤지컬"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.exhibition.image, title: "전시회"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.festival.image, title: "축제"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "운동 · 스포츠", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.fitness.image, title: "헬스"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.golf.image, title: "골프"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.mountainClimbing.image, title: "등산"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.running.image, title: "러닝"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.cycling.image, title: "자전거"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.badminton.image, title: "배드민턴"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.bowling.image, title: "볼링"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.climbing.image, title: "클라이밍"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.watchTheGame.image, title: "경기관람"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "여행 · 드라이브", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.travel.image, title: "여행"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.drive.image, title: "드라이브"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.picnic.image, title: "피크닉"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.camping.image, title: "캠핑"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "댄스 · 무용", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.broadcastDance.image, title: "방송댄스"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.ballet.image, title: "발레"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.dance.image, title: "무용"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "공예", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.drawing.image, title: "드로잉"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.woodWorking.image, title: "목공"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.calligraphy.image, title: "캘리그라피"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.flowerArrangement.image, title: "꽃꽂이"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "사교 · 동네친구", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.society.image, title: "사교"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.blindDate.image, title: "소개팅"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.game.image, title: "게임"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "핫플투어", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.restaurant.image, title: "맛집"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.cafe.image, title: "카페"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.wineCocktail.image, title: "와인 · 칵테일"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "독서 · 인문학", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.reading.image, title: "독서"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.writing.image, title: "작문"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.psychology.image, title: "심리학"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.economy.image, title: "경제학"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "외국어 · 언어", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.english.image, title: "영어"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.chinese.image, title: "중국어"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.japanese.image, title: "일본어"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.german.image, title: "독일어"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.french.image, title: "프랑스어"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "사진 · 영상", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.picture.image, title: "사진"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.video.image, title: "영상"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")]),
            HobbyModel(title: "그외", hobbyDetailModel: [
                HobbyDetailModel(img: SharedDSKitAsset.Icons.cooking.image, title: "요리"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.volunteer.image, title: "봉사활동"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.pet.image, title: "반려동물"),
                HobbyDetailModel(img: SharedDSKitAsset.Icons.frame371.image, title: "기타")])
        ])
    
    public init(){
        
    }
}
