//
//  ToastView.swift
//  Wordle
//
//  Created by Priyam Soni on 26/05/24.
//

import SwiftUI

struct ToastView: View {
    var toastText: String = "Not in word list"
    var body: some View {
        Text(toastText)
            .foregroundStyle(Color.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

#Preview {
    ToastView()
}
