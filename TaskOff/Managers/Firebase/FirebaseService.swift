//
//  FirebaseService.swift
//  TaskOff
//
//  Created by Олег Борисов on 24.03.2023.
//

import UIKit
import Firebase
import FirebaseFirestore

class FirebaseService{

    let database = Firestore.firestore()

    init(){
        //Optional: Tweak the settings below to your app's needs
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited
        database.settings = settings
    }

    func authUser(emailLabel: String, passwordLabel: String, completion: @escaping(Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: emailLabel, password: passwordLabel){ result, error in
            if error != nil{
                completion(.failure(error!))
                print("login error")
            } else{
                completion(.success(()))
                print(result?.user.email)
            }
        }
    }

    func signInUser(emailLabel: String, passwordLabel: String, nickName: String, completion: @escaping (Result<Void, Error>) -> Void ) {
        Auth.auth().createUser(withEmail: emailLabel, password: passwordLabel){ result, error in
            if error != nil{
                print(error.debugDescription)
                print("Error create user")
                completion(.failure(error!))
            } else{
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: [
                    "email": emailLabel,
                    "uid": result!.user.uid
                ]) { errorDB in
                    if errorDB != nil{
                        print("Error save user in database")
                        completion(.failure(errorDB!))
                    }
                    completion(.success(()))
                    print(result?.user.uid)
                }
                print(emailLabel)
            }

        }
    }
}
