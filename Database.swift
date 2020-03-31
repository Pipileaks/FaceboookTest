//
//  Database.swift
//  FaceboookTest
//
//  Created by Umut Sever on 23.03.2020.
//  Copyright © 2020 Umut Sever. All rights reserved.
//

import Foundation





 /*
  
 Tables {
 
    Users : { *Kullanıcı kayıt olduktan sonra oluşan profil
        id(unique): Int
        username(unique): String
        email: String
        isSubscribedWithFacebook: Bool
        isSubscribedWithGoogle: Bool
        isSubscribedWithTwitter: Bool
        isSubscribedWithEmail: Bool
        subscribedDate: Date
        isTutorialDone: Bool
        isActive: Bool
        lastLoginDate: Date
        language: String
        pushedAllowed: Bool
        smsAllowed: Bool
        isPremium: Bool
        
    PremiumUsers: {
        ad: Bool
        currentCurrency: Int
        purchasedDate: Date
        buralara eklenti yap
        
        
 
 
    Story : { *Yaratıldıktan Sonra Oluşan Profili
        id(unique): Int
        name: String
        writtenDate: Date
        authorName: String
        userID: Int
        isPublished: Bool
        isApproved: Bool
        pageCount: Int
        difficulty: String/Int
        isDeleted: Bool
        storyCoverImage: Url
        language: String

    StoryCodes : { *Story için yaratılan kod
        storyId: Int
        storyCode(unique): String (alphanumeric)
      
    UserStats : { *User'ın storyde verdiği statlar
        userId: Int
        storyId: Int
        str: Int
        dex: Int
        con: Int
        wis: Int
        cha: Int
        int: Int
 
    playedStories : { *Kullanıcını Oynadığı ya da Oynamakta Olduğu Story
        userId: Int
        storyId: Int
        isFinished: Bool
        
    appRating : { *Appstore Rating
        userId: Int
        rating: Int
        isRated: Bool
        lastRateDate: Date
 
    storyRating : { *Story aldığı oylama
        storyId: Int
        rating: Int

   
 storyPlayCount: { *Story kaç defa oynandığı
        storyId: Int
        playCount: Int
 
        
        playedStories.userId = user.Id
        storyPlayCount.storyId = playedStories.storyId
        story.id = playedStoried.storyId
       
         playedStories.storyId.count
        
    
 
    storyText: {
        storyId: Int
        pageNumber: Int
        storyText: String
        storyTextImageUrl: Url
 
    storyAction: {
        storyId: Int
        pageNumber: Int
        
        phyText: String
        strPhy: Bool
        dexPhy: Bool
        conPhy: Bool
        wisPhy: Bool
        chaPhy: Bool
        intPhy: Bool
 
        mentalText: String
        strMental: Bool
        dexMental: Bool
        conMental: Bool
        wisMental: Bool
        chaMental: Bool
        intMental: Bool
        
        
        
   storyEndings: {
        storyId: Int
        sucEnd: String
        failEnd: String
        
 
        ** favori yazar ekleme - favori story ekleme
        *** Admin, supervisor yetkilerini ekle
        *story silme.
 
        *10 sayfadan ending yazmak zorunda
        *ending ekranı var
        

        *Story Yaratma Tablosu
        *Story Oynama Tablosu
        *İstatistikler
        *Achievements
        *
        
 ***************  MVC  ********************
 View ;
 
 Does it interact with the model layer?
 Does it contain any business logic?
 Does it try to do anything not related to UI?
 
 
 Controller;
 
 What should I access first: the persistence or the network?
 How often should I refresh the app?
 What should the next screen be and in which circumstances?
 If the app goes to the background, what should I tidy up?
 The user tapped on a cell; what should I do next?
 
 

 *Model
 
 LoginAuthModel - Auth bakacak, user bilgilerini database işlemek.
 LanguageModel -
 StorySearchModel - database'den XXX buldum, al bakalım.
 StatisticModel -
 StatsModel -
 
 
 *Controller
 
LoginScreenViewController -
AdminScreenViewController -
MainScreenViewController -
StorySearchViewController - 1- search text field'a XXX yazıldı, ne yapmalıyız? 2 - modelden gelen cevap YYY, al bunu tableview ını koy.
 
 StoryStatViewController -
 
 
 
 
 *View
 
 LoginScreenView
 AdminScreenView
 TutorialScreenView
 MainScreenView
 StorySearchView - search text field'a XXX yazıldı. - tamam yyy olarak dolduruyorum.
 StoryStatView -
 
 
 
 
        
        
 
 
 
 
 
 
 
 
 
 
 
 */
