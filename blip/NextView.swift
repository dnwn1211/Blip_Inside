import SwiftUI

struct NextView: View {
    var body: some View {
        NavigationView { // NavigationView로 감싸기
            VStack {
                Text("Blip Inside")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 20) // 상단 여백 조정
                
                // 가로로 스크롤 가능한 이미지 6개 겹침
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -50) { // 이미지를 겹치도록 간격 조절
                        ForEach(1...4, id: \.self) { index in
                            NavigationLink(destination: DetailView(imageIndex: index)) {
                                Image("man\(index)") // 각 이미지를 "man1", "man2", ...로 불러오기
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300, height: 500)
                            }
                        }
                    }
                    .padding(.horizontal, 50) // 스크롤 시작 위치 조정
                }
                .padding(.top, 100) // 슬라이드를 아래로 내리기 위한 여백 추가
                .ignoresSafeArea()

                Spacer() // Spacer를 추가하여 이미지 아래 공간 확보
            }
        }
    }
}

#Preview {
    NextView()
}
