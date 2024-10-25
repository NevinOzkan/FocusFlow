//
//  ContentView.swift
//  FocusFlow
//
//  Created by Nevin Özkan on 25.10.2024.
//

import SwiftUI

struct PasswordResetView: View {
    @State private var email: String = ""
    @State private var isEmailValid: Bool = true
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // Başlık
                Text("Şifre Sıfırlama")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Açıklama metni
                Text("Şifreyi sıfırlamak için e-posta adresinizi giriniz.")
                    .font(.system(size: 14)) // Yazı boyutunu 14 olarak ayarlayın
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                // E-posta girişi
                ZStack {
                    RoundedRectangle(cornerRadius: 10) // Yuvarlak köşe
                        .fill(Color(.systemGray6)) // Arka plan rengi
                        .frame(width: 300, height: 40) // Genişlik ve yükseklik ayarı
                    
                    HStack {
                        Text("@")
                            .foregroundColor(.gray)
                            .font(.system(size: 20)) // Boyut ayarı
                            .padding(.leading, 30) // Sol boşluk ekleyin
                            .padding(.trailing, 2) // Sağ boşluk ekleyin, böylece TextField'a biraz boşluk kalır
                        
                        TextField("E-Posta", text: $email)
                            .padding(.leading, 8) // Sol boşluk
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal) // Yatay boşluk
                }
                .padding(.bottom, 10)
                
                if !isEmailValid {
                    Text("Geçersiz e-posta adresi.")
                        .foregroundColor(.red)
                        .padding(.bottom, 10)
                }
                
                // Şifre sıfırlama talebi gönder butonu
                Button(action: {
                    resetPassword()
                }) {
                    Text("ŞİFRE SIFIRLAMA TALEBİ GÖNDER")
                        .frame(width: 300, height: 40) // Genişlikveyükseklik ayarı
                        .background(Color(red: 0.6, green: 0, blue: 0.8)) // Koyu mor arka plan rengi
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .cornerRadius(25) // Kenarları tam yuvarlak yapmak için
                }
                .padding(.top, 10)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Duyuru"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
                }
            }
            .padding()
            .navigationBarBackButtonHidden(false) // Geri butonunu göster
         .navigationBarItems(leading: Button(action: {
                            // Geri gitmek için buraya işlemi ekleyebilirsiniz
                        }) {
         Image(systemName: "chevron.left") // Geri ok simgesi
        .foregroundColor(.black) // Renk ayarı
                        })
                    }
                }
    private func resetPassword() {
        // E-posta doğrulama
        if email.isEmpty || !email.contains("@") {
            isEmailValid = false
            return
        }
        
        isEmailValid = true
        
        // Burada şifre sıfırlama işlemini gerçekleştir
        alertMessage = "Şifre sıfırlama bağlantısı gönderildi."
        showAlert = true
    }
}

#Preview {
    PasswordResetView()
}
