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
    case infoSection, settingsSection, logoutSection
    var rows: [RowType] {
        switch self {
        case .infoSection:
            return [.GameProfile, .Profile, .Orders, .Favourites, .Adresses, .CreditCards, .Wallet, .Coupons, .Wiki, .Deals, .Campus]
        case .settingsSection:
            return [.Language, .ChangeCity, .RateApp, .AboutApp]
        case .logoutSection:
            return [.Logout]
            }
        }

    var sectionTitle: String {
        switch self {
        case .infoSection:
            return " "
        case .settingsSection:
            return "Ayarlar"
        case .logoutSection:
            return " "
        }
    }

    var sectionHeaderHeight: CGFloat {
        switch self {
        case .infoSection:
            return 30.0
        case .settingsSection:
            return 40.0
        case .logoutSection:
            return 30.0
        }
    }
}

    enum RowType {
        case
        GameProfile, Profile, Orders, Favourites, Adresses, CreditCards, Wallet, Coupons, Wiki, Deals, Campus, Language, ChangeCity, RateApp, AboutApp, Logout
        var rowName: String {
            switch self {
            case .GameProfile:
                return "Profilim"
            case .Profile:
                return "Bilgilerim"
            case .Orders:
                return "Önceki Siparişlerim"
            case .Favourites:
                return "Favorilerim"
            case .Adresses:
                return "Adreslerim"
            case .CreditCards:
                return "Kredi Kartlarım"
            case .Wallet:
                return "Cüzdanım"
            case .Coupons:
                return "Kuponlarım"
            case .Wiki:
                return "Oyunla İlgili Bilgiler"
            case .Deals:
                return "Fırsatlar"
            case .Campus:
                return "Kampüs"
            case .Language:
                return "Change Language"
            case .ChangeCity:
                return "Şehir Değiştir"
            case .RateApp:
                return "Uygulamayı Değerlendirin"
            case .AboutApp:
                return "Uygulama Hakkında"
            case .Logout:
                return "Güvenli Çıkış"
            }
        }

            var icon: UIImage? {
                switch self {
                case .GameProfile:
                    return #imageLiteral(resourceName: "myProfile")
                case .Profile:
                    return #imageLiteral(resourceName: "myProfile")
                case .Orders:
                    return #imageLiteral(resourceName: "myOrders")
                case .Favourites:
                    return #imageLiteral(resourceName: "myFavourites")
                case .Adresses:
                    return #imageLiteral(resourceName: "myAddresses")
                case .CreditCards:
                    return #imageLiteral(resourceName: "myCreditCards")
                case .Wallet:
                    return #imageLiteral(resourceName: "myWallet")
                case .Coupons:
                    return #imageLiteral(resourceName: "myCoupons")
                case .Wiki:
                    return #imageLiteral(resourceName: "myProfile")
                case .Deals:
                    return #imageLiteral(resourceName: "deals")
                case .Campus:
                    return #imageLiteral(resourceName: "other_campus")
                default:
                    return nil
                }
        }
}

class OtherViewModel: NSObject {
    var sections: [SectionType] {
        return [.infoSection, .settingsSection, .logoutSection]
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
