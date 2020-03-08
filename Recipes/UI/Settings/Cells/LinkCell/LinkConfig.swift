//
//  LinkConfig.swift
//  Recipes
//
//  Created by Александра Башкирова on 20.10.2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit

struct LinkConfig {
    let titleLink: String
    let subtitleLink: String
    let imagePreview: String?
    let type: LinkType
    
    init(type: LinkType) {
        titleLink = type.title
        subtitleLink = type.subtitleLink
        imagePreview = type.imagePreview
        self.type = type
    }
}

private extension LinkType {
    var title: String {
        switch self {
        case .instagram:
            return "Аккаунт Instagram"
        case .ok:
            return "«Что приготовить?!»"
        case .site:
            return "Say7.info"
        case .vk:
            return "«Что приготовить?!»"
        case .email:
            return "Обратная связь"
        case .rate:
            return "Оценить приложение"
        }
    }
    
    var subtitleLink: String {
        switch self {
        case .instagram:
            return "Вдохновение рецептами"
        case .ok:
            return "Рецепты и подборки"
        case .site:
            return "Cайт и форум"
        case .vk:
            return "Новые рецепты и рекомендации"
        case .email:
            return "Написать разработчику"
        case .rate:
            return ""
        }
    }
    
    var imagePreview: String {
        switch self {
        case .instagram:
            return "instagram-icon"
        case .ok:
            return "ok-icon"
        case .site:
            return "say7-icon"
        case .vk:
            return "vk-icon"
        case .email:
            return "email-icon"
        case .rate:
            return "rating-icon"
        }
    }
}
