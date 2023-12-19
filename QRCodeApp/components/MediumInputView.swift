//
//  MediumInputView.swift
//  QRCodeApp
//
//  Created by 平山奈々海 on 2023/12/19.
//

import SwiftUI

struct MediumInputView: View {
    @Binding var medium : String
    var body: some View {
        VStack {
            HStack {
                Text("Campaign Medium")
                    .font(.footnote)
                    .bold()
                Text("*")
                    .font(.footnote)
                    .bold()
                    .foregroundStyle(.red)
                Spacer()
            }
            TextField("入力してください", text: $medium)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.URL)
                .font(.title3)
        }
        .padding(6)
    }
}


#Preview {
    MediumInputView(medium: .constant(""))
}
