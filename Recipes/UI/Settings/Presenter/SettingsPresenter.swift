//
//  SettingsPresenter.swift
//  Recipes
//
//  Created by Alexandra Bashkirova on 20/10/2019.
//  Copyright © 2019 sashenka.xyz. All rights reserved.
//
import ReactiveSwift

class SettingsPresenter {

    private let settingsCellPresentersFactory: SettingsCellPresentersFactory
    
    private let interactor: SettingsInteractorInput
    private let router: SettingsRouterInput

    var cellPresenters: [[CellPresenter]] = []
    
    init(
        settingsCellPresentersFactory: SettingsCellPresentersFactory,
        interactor: SettingsInteractorInput,
        router: SettingsRouterInput
    ) {
        self.interactor = interactor
        self.router = router
        self.settingsCellPresentersFactory = settingsCellPresentersFactory
        
        let aboutCellPresenter = settingsCellPresentersFactory.createAboutTableViewCellPresenterFactory()
       
        let socialBlock: [LinkType] = [.site, .vk, .ok, .instagram]
        let appBlock: [LinkType] = [.rate, .email]
       
        let socialCellPresenters = socialBlock.map { type in
            settingsCellPresentersFactory.createLinkTableViewCellPresenterFactory(
                config: LinkConfig(type: type),
                cellSeletedAction: { typeLink in
                    router.open(appUrl: typeLink.appUrl, siteUrl: typeLink.siteUrl)
                }
            )
        }
        
        let appCellPresenters = appBlock.map { type in
            settingsCellPresentersFactory.createLinkTableViewCellPresenterFactory(
                config: LinkConfig(type: type),
                cellSeletedAction: { typeLink in
                    router.open(appUrl: typeLink.appUrl, siteUrl: typeLink.siteUrl)
                }
            )
        }
        
        cellPresenters = [[aboutCellPresenter], socialCellPresenters, appCellPresenters]
    }
}

extension SettingsPresenter: SettingsViewOutput {
    func viewIsReady() { }
}

private extension LinkType {
    var siteUrl: URL? {
        switch self {
        case .site:
            return URL(string: "https://www.say7.info")
        case .vk:
            return URL(string: "https://vk.com/say7info")
        case .ok:
            return URL(string: "https://ok.ru/group/53005004505199")
        case .instagram:
            return URL(string: "https://user?username=skripkina.7")
        case .email:
            return URL(string: "mailto:example@gmail.com")
        case .rate:
            return URL(string: "https://google.com")
        }
    }
    var appUrl: URL? {
        switch self {
        case .vk:
            return URL(string: "vk://vk.com/say7info")
        case .ok:
            return URL(string: "ok://ok.ru/group/53005004505199")
        case .instagram:
            return URL(string: "instagram://user?username=skripkina.7")
        case .site:
            return nil
        case .email:
            return URL(string: "mailto:example@gmail.com")
        case .rate:
            return URL(string: "itms-apps:://itunes.apple.com")
        }
        
    }
}
