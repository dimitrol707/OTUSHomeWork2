//
//  CharacterService.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//
import Combine

protocol ProductCharacterService {
    var list: Published<[CharacterData]>.Publisher { get }
    func getCharacters()
}
