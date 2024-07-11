//
//  RegistrationView.swift
//  KitchenSync
//
//  Created by Claire Morgan-Sanders on 6/17/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("kitchen-sync-logo")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .padding(.vertical, 32)

        }
        
        VStack(spacing: 24) {
            InputView(text: $email,
                      title: "Email Address",
                      placeholder: "name@example.com")
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            InputView(text: $fullName,
                      title: "Full Name",
                      placeholder: "Enter name")
            
            InputView(text: $password,
                      title: "Password",
                      placeholder: "Password",
                      isSecureField: true)
            
            InputView(text: $confirmPassword,
                      title: "Confirm Password",
                      placeholder: "Confirm Password",
                      isSecureField: true)
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
        Button {
            Task {
                try await viewModel.createUser(withEmail: email,                                password: password,
                                               fullName: fullName)
            }
        } label: {
            HStack {
                Text("Create Account")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 42)
        }
        .background(Color(.systemBlue))
        .cornerRadius(10)
        .padding(.top, 24)
        
        Spacer()
        
        Button {
            dismiss()
        } label: {
            HStack {
                Text("Already have an account?")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .font(.system(size: 14))
        }
    }
}

#Preview {
    RegistrationView()
}
