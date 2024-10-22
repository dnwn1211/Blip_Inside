import SwiftUI

struct Person {
    let name: String
    let description: String
    let instagramLink: String
    let githubLink: String
    let blogLink: String
    let imageName: String
    let hashtags: [String] // 해시태그 속성 추가
}

let people = [
    Person(name: "김석준", description: "좋아하는 음식 : 해산물만 아니라면 OK!\n좋아하는 색 : 파란색\n취미 : 게임, 헬스, 옷 구경\ntmi : 예비역 하사 V 충떵^^7 돌려돌려 돌림판으로 팀장이 되...\n장점 : 최대한 긍정적으로 생각하기\n협업 스타일 : 최대한 맞추려고 노력하고 협업을 하다가 이건 아니다 싶을 때 즉각적인 질문과 피드백으로 빠르게 문제 상황을 해결하는 것을 좋아합니다", instagramLink: "https://www.instagram.com/stonejun__00/", githubLink: "https://github.com/dnwn1211",blogLink: "https://velog.io/@dnwn1211/posts", imageName: "instagram", hashtags: ["#swift", "#iOS", "#헬스", "#패션"]),
    Person(name: "양정무", description: "좋아하는 음식 : 소고기! \n좋아하는 색 : 검은색 \n취미 : 클라이밍 \ntmi : 클라이밍이 너무 좋습니다… 나중에 브랜드도 만들고 싶어요 \n장점 : 빠른 상황판단 \n협업 스타일 : 최대한 협조하기", instagramLink: "https://www.instagram.com/person2", githubLink: "https://github.com/jeongmuya ", blogLink: "https://velog.io/@jeongmuya/posts", imageName: "instagram", hashtags: ["#developer", "#coding"]),
    Person(name: "박진홍", description: "좋아하는 음식 : 알리오 올리오 / 면과 고기 조합 \n좋아하는 색 : 올리브 그린\n취미: 커피 브루잉\ntmi : 강아지 봄이를 키우고 있습니다. \n최근 이사한 뒤로 실내에서 배변을 안 하기 시작하여 아침 저녁으로 산책을 나가줘야 하는 강아지가 됐습니다. 집안일 대부분을 병행해야 해서 빡센 4달이 될 예정입니다.\n장점 : 이해와 응용이 빠른 편입니다\n협업 스타일 : 반드시 반대해야 할 이유나 너무 비합리적인 선택만 아니라면 대부분의 의견에 동의하고 잘 따라가는 편이며 리더로 이끌어나가기보다 따라가며 디테일한 부분을 챙기는 편을 좋아합니다. ", instagramLink: "https://www.instagram.com/person3", githubLink: "https://github.com/person3",blogLink: "https://velog.io/@dnwn1211/posts", imageName: "instagram", hashtags: ["#tech", "#innovation"]),
    Person(name: "박준혁", description: "좋아하는 음식 : 다 잘먹어요!\n좋아하는 색 : 네이비 \n취미 : 라이딩\ntmi : 차쟁이입니다.\n장점 : 포기하지 않고 끝까지 해결하기\n협업 스타일 : 의견을 많이 들으려하고 생산적인 회의를 좋아합니다.", instagramLink: "https://www.insagram.com/ju_nyeok_2_", githubLink: "https://github.com/Genesis2010",blogLink: "dmsgktn1685@naver.com", imageName: "instagram", hashtags: ["#design", "#UIUX"]),
]

struct DetailView: View {
    var imageIndex: Int // 선택된 이미지 인덱스
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack(alignment: .top) {
                    // 고정된 이미지
                    Image("man\(imageIndex)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 500)
                        .padding(.top, 100) // 이미지를 약간 위로 올림
                        .frame(maxWidth: .infinity, alignment: .center) // 수평 중앙 정렬

                    // 내용
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer().frame(height: 500) // 이미지의 높이만큼 여백을 추가하여 내용이 아래에서 시작하도록 설정

                        Text((people[imageIndex - 1].name))
                            .font(.title)
                            .fontWeight(.bold)

                        // 해시태그 섹션
                        HStack {
                            ForEach(people[imageIndex - 1].hashtags, id: \.self) { hashtag in
                                Text(hashtag)
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                    .padding(5)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                        
                        Text(people[imageIndex - 1].description)
                            .font(.body)

                        

                        // 일반 이미지와 링크를 포함한 HStack 수정
                        HStack {
                            Link(destination: URL(string: people[imageIndex - 1].instagramLink)!) {
                                Image(people[imageIndex - 1].imageName)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            Link(destination: URL(string: people[imageIndex - 1].githubLink)!) {
                                Image("git_icon")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            Link(destination: URL(string: people[imageIndex - 1].blogLink)!) {
                                Image("blog")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .padding() // 아이콘과 배경 사이의 여백 추가
                        .background(Color.yellow) // 원하는 배경색 지정
                        .cornerRadius(10) // 모서리를 둥글게 처리
                        
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading) // 내용물을 왼쪽 정렬
                }
                .ignoresSafeArea()
            }
        }
        .navigationTitle("상세페이지")
        .ignoresSafeArea()
    }
}

#Preview {
    DetailView(imageIndex: 1)
}
