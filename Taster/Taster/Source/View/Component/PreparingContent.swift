//
//  PreparingContent.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/14/23.
//

import SwiftUI

struct PreparingContent: View {
    var body: some View {
        VStack {
            Text("👨🏻‍💻")
                .font(.tossFace(.large))
                .padding(.bottom)
            Text("콘텐츠 준비중")
                .font(.pretendard(.body))
                .padding(.bottom, 5)
            Text("멋진 콘텐츠를 준비중이예요")
                .font(.pretendard(.caption))
                .foregroundStyle(.secondary)
        }
        .padding(.top, 100)
    }
}

#Preview {
    PreparingContent()
}
