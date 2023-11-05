//
//  ViewExtension.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

extension View {
    func onScrollOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background(
                GeometryReader {geo in
                    Text("")
                        .preference(
                            key: ScrollPreferenceKey.self,
                            value: geo.frame(in: .named("scroll")).minY
                        )
                        .frame(height: 0)
                }
            )
            .onPreferenceChange(ScrollPreferenceKey.self, perform: action)
    }
}
