//
//  OtherViewModel.swift
//  Other
//
//  Created by Serkan Özdemir on 14.11.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import Foundation
import UIKit
enum SectionType {
    case personalInfoSection, changePasswordSection, socialNetworksSection, emailAndSMSSection
    var rows: [RowType] {
        switch self {
        case .personalInfoSection:
            return [.Name, .Surname, .BirthDate, .Email]
        case .changePasswordSection:
            return [.ChangePassword]
        case .socialNetworksSection:
            return [.FacebookConnection]
        case .emailAndSMSSection:
            return [.AllowEmail, .AllowSms]
        }
    }

    var sectionTitle: String {
        switch self {
        case .personalInfoSection:
            return "Kişisel Bilgiler"
        case .changePasswordSection:
            return ""
        case .socialNetworksSection:
            return "Sosyal Ağlar"
        case .emailAndSMSSection:
            return "E-Posta ve SMS"
        }
    }

    var shouldShowTopLine: Bool {
        switch self {
        case .changePasswordSection:
            return false
        default:
            return true
        }
    }
    
    var sectionHeaderHeight: CGFloat {
        switch self {
        case .personalInfoSection:
            return 40.0
        case .changePasswordSection:
            return 20.0
        case .socialNetworksSection:
            return 20.0
        case .emailAndSMSSection:
            return 20.0
        }
    }
}

    enum RowType {
        case
        Name, Surname, BirthDate, Email, ChangePassword, FacebookConnection, AllowEmail, AllowSms
        var rowName: String {
            switch self {
//            case .Name:
//                return "Ad"
//            case .Surname:
//                return "Soyad"
//            case .BirthDate:
//                return "Doğum Tarihi"
//            case .Email:
//                return "E-Posta"
            case .ChangePassword:
                return "Şifre Değişikliği"
            case .FacebookConnection:
                return "Bağlantıyı Kaldır"
            case .AllowEmail:
                return "Kampanya ve indirimler ile ilgili e-posta almak istiyorum."
            case .AllowSms:
                return "Sms almak istiyorum"
            default:
                return ""
            }
        }

            var icon: UIImage? {
                switch self {
                case .FacebookConnection:
                    return #imageLiteral(resourceName: "myProfile")
                case .ChangePassword:
                    return #imageLiteral(resourceName: "myFavourites")
                default:
                    return nil
                }
        }
        
//            var badge: String? {
//                switch self {
//                case .BirthDate:
//                    return "1"
//                case .Surname:
//                    return "2"
//                default:
//                    return nil
//                }
//        }
}

class OtherViewModel {
    var sections: [SectionType] {
        return [.personalInfoSection, .changePasswordSection, .socialNetworksSection, .emailAndSMSSection]
    }
    func getSectionType(at section: Int) -> SectionType? {
        guard section < sections.count else {return nil}
        return sections[section]
    }
    func getRowType(indexPath: IndexPath) -> RowType? {
        guard let sectionType = getSectionType(at: indexPath.section) else {return nil}
        return sectionType.rows[indexPath.row]

    }
}
