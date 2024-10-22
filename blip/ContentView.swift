import SwiftUI

struct ContentView: View {
    @State private var showNextView = false // 상태 변수: 다음 화면 전환 여부
    
    var body: some View {
        if showNextView {
            // 1~2초 후에 전환할 새로운 화면
            NextView()
        } else {
            // 첫 번째 화면
            VStack {
                // 상단 텍스트
                Text("Blip Inside")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 100)
                
                Spacer()
                
                // 하단 이미지 (스냅 이미지)
                Image("blip_hand_2") // "blip_hand_2"는 실제 이미지 이름으로 대체
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 700)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 전체 화면 배경
            .background(Color(red: 1.0, green: 0.694, blue: 0.207)) // #FFB135 배경색
            .ignoresSafeArea() // 배경이 화면 전체를 덮도록 설정
            .onAppear {
                // 화면이 나타난 후 2초 후에 상태 변경
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showNextView = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
