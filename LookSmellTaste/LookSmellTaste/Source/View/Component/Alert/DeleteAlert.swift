//
//  DeleteAlert.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/9/23.
//

import SwiftUI

struct DeleteAlert: View {
    @Binding var showDeleteAlert: Bool
    var action: () -> Void
    
    var body: some View {
        Alert(
            isPresented: $showDeleteAlert,
            emoji: "🗑️",
            title: "정말 노트를 삭제하시겠어요?",
            message: "삭제한 내용은 되돌릴 수 없어요",
            buttonLabel: "삭제하기") {
                action()
            }
    }
}

#Preview {
    DeleteAlert(showDeleteAlert: .constant(true)) {
        // action here
    }
}
