import Foundation

func convertToUserProfile(id: Int, newUserProfile: NewUserProfile) -> UserProfile {
    return UserProfile(
            name: newUserProfile.name,
            surname: newUserProfile.surname,
            email: newUserProfile.email,
            password: newUserProfile.password,
            verificationCode: newUserProfile.verificationCode,
            id: id,
            userplan: newUserProfile.userplan,
            friendlist: newUserProfile.friendlist?.split(separator: ",").compactMap { Int($0) } ?? [],
            verified: newUserProfile.verified,
            admin: newUserProfile.admin,
            banned: newUserProfile.banned,
            photo: newUserProfile.photo
        )
}
