//
//  CustomDivider.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/12/23.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 3, style: .continuous)
            .frame(height: 1)
            .foregroundStyle(.appPickerGray)
    }
}

#Preview {
    CustomDivider()
}
