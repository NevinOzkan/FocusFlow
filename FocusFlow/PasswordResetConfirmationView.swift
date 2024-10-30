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
            Image("Image")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 135, height: 53)
                    .padding(.top, 50)

                Spacer()

                Text("E-posta adresinize şifre sıfırlama talebi gönderildi. Lütfen E-postanızı kontrol ediniz.")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

              
                Image("Loading 2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.bottom, 50)

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
