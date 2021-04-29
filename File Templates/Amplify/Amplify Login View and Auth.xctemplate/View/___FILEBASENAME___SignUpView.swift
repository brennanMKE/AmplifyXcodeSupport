//___FILEHEADER___

import SwiftUI

struct ___FILEBASENAMEASIDENTIFIER___: View {
    @EnvironmentObject var session: ___VARIABLE_productName:identifier___AuthService
    @Environment(\.presentationMode) var presentation

    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var loading: Bool = false
    @State var presentConfirmSignUp: Bool = false

    func signUp() {
        guard email != "" else {
            error = "Please enter your email"
            return
        }
        guard password != "" else {
            error = "Please enter a password"
            return
        }

        loading = true
        session.signUp(email: email, password: password) { result in
            self.loading = false
            switch result {
            case .success:
                print("Sign Up complete")
                self.error = ""
                self.presentConfirmSignUp = true
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    TitleView(title: "Sign Up")
                    InputContainerView(inputName: "Email Address *",
                                       placeholderText: "Enter your email address",
                                       inputValue: $email)

                    InputContainerView(inputName: "Password *",
                                       placeholderText: "Create a password",
                                       isSecure: true,
                                       inputValue: $password)

                    ButtonView(buttonText: "Create Account",
                               buttonAction: self.signUp)

                    if error != "" {
                        Text(error).font(.system(size: 16, weight: .semibold)).foregroundColor(.red).padding()
                    }
                    Spacer()

                    HStack {
                        Text("Have an account?")
                        Button(action: {
                            print("DIsmiss myself to go to Sign in")
                            self.presentation.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign In").foregroundColor(.orange)
                        })
                    }
                    NavigationLink(destination: EmptyView(), isActive: $presentConfirmSignUp) {
                        EmptyView()
                    }
                }.padding()
                VStack {
                    Spacer()
                    ActivityIndicator(isAnimating: loading)
                        //.configure { $0.color = UIColor.gray }
                        .padding()
                    Spacer()
                }
            }
        }.navigationBarHidden(true).navigationBarTitle("")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ___FILEBASENAMEASIDENTIFIER___()
    }
}

