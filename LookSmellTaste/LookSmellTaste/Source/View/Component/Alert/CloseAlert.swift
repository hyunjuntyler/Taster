//
//  CloseAlert.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/5/23.
//

import SwiftUI

struct CloseAlert: View {
    @Environment(NoteEnvironment.self) var noteEnvironment: NoteEnvironment
    
    var body: some View {
        @Bindable var noteEnvironment = noteEnvironment
        Alert(
            isPresented: $noteEnvironment.showCloseAlert,
            emoji: "✍️",
            title: "정말 작성을 종료하시겠어요?",
            message: "작성된 내용은 저장되지 않아요",
            buttonLabel: "종료하기") {
                noteEnvironment.close()
            }
    }
}

#Preview {
    CloseAlert()
        .environment(NoteEnvironment())
}
