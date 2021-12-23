//
//  PreviewProvider.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

import SwiftUI

extension PreviewProvider {
    static var devPreview: DeveloperPreview {
        .instance
    }
}

class DeveloperPreview {
    static let instance: DeveloperPreview = .init()
    private init() { }
    
    let anime: Anime = .init(
        id: 16498,
        url: "https://myanimelist.net/anime/16498/Shingeki_no_Kyojin",
        title: "Shingeki no Kyojin",
        imageUrl: "https://cdn.myanimelist.net/images/anime/10/47347.jpg",
        synopsis: "Centuries ago, mankind was slaughtered to near extinction by monstrous humanoid creatures called titans, forcing humans to hide in fear behind enormous concentric walls. What makes these giants truly terrifying is that their taste for human flesh is not born out of hunger but what appears to be out of pleasure. To ensure their survival, the remnants of humanity began living within defensive barriers, resulting in one hundred years without a single titan encounter. However, that fragile calm is soon shattered when a colossal titan manages to breach the supposedly impregnable outer wall, reigniting the fight for survival against the man-eating abominations. After witnessing a horrific personal loss at the hands of the invading creatures, Eren Yeager dedicates his life to their eradication by enlisting into the Survey Corps, an elite military unit that combats the merciless humanoids outside the protection of the walls. Based on Hajime Isayama's award-winning manga, Shingeki no Kyojin follows Eren, along with his adopted sister Mikasa Ackerman and his childhood friend Armin Arlert, as they join the brutal war against the titans and race to discover a way of defeating them before the last walls are breached. [Written by MAL Rewrite]",
        type: "TV",
        members: 3178147,
        genres: [
            DefaultData(id: 1, type: "anime", name: "Action", url: "https://myanimelist.net/anime/genre/1/Action"),
            DefaultData(id: 8, type: "anime", name: "Drama", url: "https://myanimelist.net/anime/genre/8/Drama"),
            DefaultData(id: 10, type: "anime", name: "Fantasy", url: "https://myanimelist.net/anime/genre/10/Fantasy"),
            DefaultData(id: 7, type: "anime", name: "Mystery", url: "https://myanimelist.net/anime/genre/7/Mystery"),
        ],
        explicitGenres: nil,
        themes: [
            DefaultData(id: 38, type: "anime", name: "Military", url: "https://myanimelist.net/anime/genre/38/Military"),
            DefaultData(id: 31, type: "anime", name: "Super Power", url: "https://myanimelist.net/anime/genre/31/Super_Power")
        ],
        score: 8.52,
        airingStart: "2013-04-06T16:58:00+00:00",
        episodes: 25,
        source: "Manga",
        producers: [
            DefaultData(id: 858, type: "anime", name: "Wit Studio", url: "https://myanimelist.net/anime/producer/858/Wit_Studio")
        ])
    
    let manga: Manga = .init(
        id: 23390,
        url: "https://myanimelist.net/manga/23390/Shingeki_no_Kyojin",
        title: "Shingeki no Kyojin",
        imageUrl: "https://cdn.myanimelist.net/images/manga/2/37846.jpg?s=5bdb1e80e14d90cf4103f8416ef57645",
        synopsis: "Hundreds of years ago, horrifying creatures which resembled humans appeared. These mindless, towering giants, called \"titans,\" proved to be an existential threat, as they preyed on whatever humans they could find in order to satisfy a seemingly unending appetite. Unable to effectively combat the titans, mankind was forced to barricade themselves within large walls surrounding what may very well be humanity's last safe haven in the world. In the present day, life within the walls has finally found peace, since the residents have not dealt with titans for many years. Eren Yeager, Mikasa Ackerman, and Armin Arlert are three young children who dream of experiencing all that the world has to offer, having grown up hearing stories of the wonders beyond the walls. But when the state of tranquility is suddenly shattered by the attack of a massive 60-meter titan, they quickly learn just how cruel the world can be. On that day, Eren makes a promise to himself that he will do whatever it takes to eradicate every single titan off the face of the Earth, with the hope that one day, humanity will once again be able to live outside the walls without fear. [Written by MAL Rewrite]",
        type: "Manga",
        members: 535619,
        genres: [
            DefaultData(id: 1, type: "manga", name: "Action", url: "https://myanimelist.net/manga/genre/1/Action"),
            DefaultData(id: 8, type: "manga", name: "Drama", url: "https://myanimelist.net/manga/genre/8/Drama"),
            DefaultData(id: 10, type: "manga", name: "Fantasy", url: "https://myanimelist.net/manga/genre/10/Fantasy"),
            DefaultData(id: 7, type: "manga", name: "Mystery", url: "https://myanimelist.net/manga/genre/7/Mystery"),
        ],
        explicitGenres: nil,
        themes: [
            DefaultData(id: 38, type: "manga", name: "Military", url: "https://myanimelist.net/manga/genre/38/Military"),
            DefaultData(id: 31, type: "manga", name: "Super Power", url: "https://myanimelist.net/manga/genre/31/Super_Power")
        ],
        score: 8.58,
        publishingStart: "2009-09-08T00:00:00+00:00",
        volumes: 34,
        authors: [
            DefaultData(id: 11705, type: "people", name: "Isayama, Hajime", url: "ttps://myanimelist.net/people/11705/Hajime_Isayama")
        ])
    
    let character = CharacterData(
        id: 1,
        url: "https://myanimelist.net/character/1/Spike_Spiegel",
        name: "Spike Spiegel",
        about: "Birthdate: June 26, 2044\nHeight: 185 cm (6' 1\")\nWeight: 70 kg (155 lbs)\nBlood type: O\nPlanet of Origin: Mars\n\nSpike Spiegel is a tall and lean 27-year-old bounty hunter born on Mars. The inspiration for Spike is found in martial artist Bruce Lee who uses the martial arts style of Jeet Kune Do as depicted in Session 8, \"Waltz For Venus\". He has fluffy, dark green hair (which is inspired by Yusaku Matsuda's) and reddish brown eyes, one of which is artificial and lighter than the other. He is usually dressed in a blue leisure suit, with a yellow shirt and Lupin III inspired boots. A flashback in Session 6 revealed it was his fully functioning right eye which was surgically replaced by the cybernetic one (although Spike himself may not have conscious recollection of the procedure since he claims to have lost his natural eye in an \"accident\"). One theory is that his natural eye may have been lost during the pre-series massacre in which he supposedly \"died\". The purpose of this cybernetic eye is never explicitly stated, though it apparently gives him exceptional hand-eye coordination - particularly with firearms (Spike's gun of choice is a Jericho 941, as seen throughout the series). In the first episode, when facing a bounty-head using Red Eye, Spike mocks him, calling his moves \"too slow\". At first, this seems like posturing on Spike's part, but even with his senses and reflexes accelerated to superhuman levels by the drug, the bounty cannot even touch Spike. A recurring device throughout the entire show is a closeup on Spike's fully-natural left eye before dissolving to a flashback of his life as part of the syndicate. As said by Spike himself in the last episode, his right eye \"only sees the present\" and his left eye \"only sees the past.\" Spike often has a bent cigarette between his lips, sometimes despite rain or \"No Smoking\" signs.",
        memberFavorites: 40290,
        imageUrl: "https://cdn.myanimelist.net/images/characters/4/50197.jpg",
        animeography: [
            ProductOgraphy(id: 1,
                           name: "Cowboy Bebop",
                           url: "https://myanimelist.net/anime/1/Cowboy_Bebop",
                           imageUrl: "https://cdn.myanimelist.net/images/anime/4/19644.jpg?s=42d7666179a2851c99fada2e0ceb5da1",
                           role: "Main")],
        mangaography: [
            ProductOgraphy(id: 173,
                           name: "Cowboy Bebop",
                           url: "https://myanimelist.net/manga/173/Cowboy_Bebop",
                           imageUrl: "https://cdn.myanimelist.net/images/manga/5/166652.jpg?s=11de80d1d5c75e063332dbe842bf9dd2",
                           role: "Main")],
        voiceActors: [
            VoiceActor(id: 11,
                       name: "Yamadera, Kouichi", url: "https://myanimelist.net/people/11/Kouichi_Yamadera", imageUrl: "https://cdn.myanimelist.net/images/voiceactors/3/60992.jpg", language: "Japanese")])
}
