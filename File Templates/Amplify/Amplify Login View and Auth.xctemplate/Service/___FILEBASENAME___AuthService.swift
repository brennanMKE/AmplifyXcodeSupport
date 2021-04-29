//___FILEHEADER___

import Amplify

class ___FILEBASENAMEASIDENTIFIER___: ObservableObject {

    func signUp(email: String, password: String, onComplete: @escaping (Result<Void, Error>) -> Void) {
        _ = Amplify.Auth.signUp(username: email, password: password) { event in
            switch event {
            case .completed(let authSignUpResult):
                print(authSignUpResult)
                onComplete(.success(()))
            case .failed(let authError):
                onComplete(.failure(authError))
            default:
                onComplete(.failure("Unexpected event from signUp"))
            }
        }
    }

    func confirmSignUp(email: String, code: String, onComplete: @escaping (Result<Void, Error>) -> Void) {
        _ = Amplify.Auth.confirmSignUp(username: email, confirmationCode: code) { event in
            switch event {
            case .completed(let authSignUpResult):
                print(authSignUpResult)
                onComplete(.success(()))
            case .failed(let authError):
                onComplete(.failure(authError))
            default:
                onComplete(.failure("Unexpected event from confirmSignUp"))
            }
        }
    }

    func signIn(email: String, password: String, onComplete: @escaping (Result<Void, Error>) -> Void) {
        _ = Amplify.Auth.signIn(username: email, password: password) { event in
            switch event {
            case .completed(let authSignInResult):
                print(authSignInResult)
                onComplete(.success(()))
            case .failed(let authError):
                onComplete(.failure(authError))
            default:
                onComplete(.failure("Unexpected event from signIn"))
            }
        }
    }

    func signOut(onComplete: @escaping (Result<Void, Error>) -> Void) {
        _ = Amplify.Auth.signOut(listener: { event in
            switch event {
            case .completed:
                onComplete(.success(()))
            case .failed(let authError):
                onComplete(.failure(authError))
            default:
                onComplete(.failure("Unexpected event from signOut"))
            }
        })
    }
}

