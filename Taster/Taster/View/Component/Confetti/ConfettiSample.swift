//
//  ConfettiSample.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/14/23.
//

import SwiftUI

struct ConfettiSample: View {
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            /// - Parameters:
            ///   - counter: 애니메이션 트리거
            ///   - num: 요소들의 갯수
            ///   - confettis: 요소들의 종류
            ///   - colors: 색상 배열
            ///   - confettiSize: 요소들의 크기
            ///   - rainHeight: 떨어지는 거리
            ///   - fadesOut: 투명도를 점점 줄일 것인지
            ///   - opacity: 최대 투명도
            ///   - openingAngle: 시작 앵글
            ///   - closingAngle: 끝 앵글
            ///   - radius: 범위 반경
            ///   - repetitions: 반복 횟수
            ///   - repetitionInterval: 반복 시간
            Confetti(counter: $counter,
                     num: 50,
                     confettis: [
                        .shape(.circle),
                        .shape(.roundedCross),
                        .shape(.smallCircle),
                        .shape(.triangle),
                        .shape(.square),
                        .shape(.smallSquare),
                        .shape(.slimRectangle),
                        .shape(.hexagon),
                        .shape(.star),
                        .shape(.starPop),
                        .shape(.blink)
                     ],
                     confettiSize: 10,
                     rainHeight: UIScreen.main.bounds.height,
                     openingAngle: .degrees(60),
                     closingAngle: .degrees(120),
                     radius: 400,
                     repetitions: 1,
                     repetitionInterval: 1)
            Button("Animate!") {
                counter += 1
            }
            .buttonStyle(.bordered)
        }
        
    }
}

#Preview {
    ConfettiSample()
}
