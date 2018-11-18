//
//  OtherViewModel.swift
//  Other
//
//  Created by Serkan Özdemir on 14.11.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import Foundation

enum SectionType {
    case infoSection, settingsSection, logoutSection
    var rows:[RowType]{
        switch self {
        case .infoSection:
            return [.myProfile, .myInfo, .previousOrders, .myFavorites, .myAdresses, .myCreditCards, .Wallet, .myCoupons, .aboutGame, .promotions, .campus]
        case .settingsSection:
            return [.changeLanguage, .changeCity, .rateApp, .aboutApp]
        case .logoutSection:
            return [.logout]
            }
        }

    var sectionTitle:String{
        switch self {
        case .infoSection:
            return " "
        case .settingsSection:
            return "Ayarlar"
        case .logoutSection:
            return " "
        }
    }
    var sectionHeaderHeight:Float{
        switch self {
        case .infoSection:
            return 50.0
        case .settingsSection:
            return 80.0
        case .logoutSection:
            return 50.0
        }
    }
}


    enum RowType{
        case
        myProfile, myInfo, previousOrders, myFavorites, myAdresses, myCreditCards, Wallet, myCoupons, aboutGame, promotions, campus, changeLanguage, changeCity, rateApp, aboutApp, logout
        var rowName:String{
            switch self {
            case .myProfile:
                return "Profilim"
            case .myInfo:
                return "Bilgilerim"
            case .previousOrders:
                return "Önceki Siparişlerim"
            case .myFavorites:
                return "Favorilerim"
            case .myAdresses:
                return "Adreslerim"
            case .myCreditCards:
                return "Kredi Kartlarım"
            case .Wallet:
                return "Cüzdan"
            case .myCoupons:
                return "Kuponlarım"
            case .aboutGame:
                return "Oyunla İlgili Bilgiler"
            case .promotions:
                return "Fırsatlar"
            case .campus:
                return "Kampüs"
            case .changeLanguage:
                return "Change Language"
            case .changeCity:
                return "Şehir Değiştir"
            case .rateApp:
                return "Uygulamayı Değerlendirin"
            case .aboutApp:
                return "Uygulama Hakkında"
            case .logout:
                return "Güvenli Çıkış"
            }
        }
}


class OtherViewModel:NSObject{
    var sections:[SectionType]{
        return [.infoSection, .settingsSection, .logoutSection]
    }
    func getSectionType(at section:Int)->SectionType?{
        guard section < sections.count else {return nil}
        return sections[section]
    }
    func getRowType(indexPath:IndexPath) -> RowType?{
        guard let sectionType = getSectionType(at: indexPath.section) else {return nil}
        return sectionType.rows[indexPath.row]
        
    }
}