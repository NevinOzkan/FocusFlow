//
//  PasswordResetConfirmationView.swift
//  FocusFlow
//
//  Created by Nevin Özkan on 28.10.2024.
//

import SwiftUI

struct PasswordResetConfirmationView: View {
    var body: some View {
        ZStack {
            Image("Image") // Arka plan resmi
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            
            VStack {
                Image("logo") // Logo resmi
                    .resizable()
                    .scaledToFit()
                    .frame(width: 135, height: 53)
                    .padding(.top, 50) // Üstten biraz boşluk

                Spacer()

                Text("E-posta adresinize şifre sıfırlama talebi gönderildi. Lütfen E-postanızı kontrol ediniz.")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Şifre Sıfırlama")
    }
}

#Preview {
    PasswordResetConfirmationView()
}
