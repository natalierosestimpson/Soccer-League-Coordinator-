// Project aim is to divide the 18 children who have signed up for the league into three even teams — Dragons, Sharks, and Raptors

// Manually create a single collection named 'players' that contains all information for all 18 players

let players : [String] = ["Joe Smith", "42", "Yes", "Jim and Jan Smith",
                          "Jill Taner", "36", "Yes", "Clara Tanner",
                          "Bill Bon", "43", "Yes", "Sara and Jenny Bon",
                          "Eva Gordon", "45", "No", "Wendy and Mike Gordon",
                            "Matt Gill", "40", "No", "Charles and Sylvia Gill",
                            "Kimmy Stein", "41", "No", "Bill and Hillary Stein",
                            "Sammy Adams", "45", "No", "Jeff Adams",
                            "Karl Saygan", "42", "Yes", "Heather Bledsoe",
                            "Suzane Greenberg", "44", "Yes", "Henrietta Dumas",
                             "Sal Dali", "41", "No", "Gala Dali",
                             "Joe Kavalier", "39", "No", "Sam and Elaine Kavalier",
                             "Ben Finkelstein", "44", "No", "Aaron and Jill Finkelstein",
                            "Diego Soto", "41", "Yes", "Robin and Sarika Soto",
                            "Chloe Alaska", "47", "No", "David and Jamie Alaska",
                            "Arnold Willis", "43", "No", "Claire Willis",
                            "Philip Helm", "44", "Yes", "Thomas Helm and Eva Jones",
                            "Les Clay", "42", "Yes", "Wynonna Brown",
                            "Herschel Krustofski", "45", "Yes", "Hyman and Rachel Krutofski"]

// Represent each player by a Dictionary with String keys and the corresponding values.

var n: Int = 0

let numberOfPlayers = players.count / 4

var playerDictionaryHeight : [String: String] = [:]
var playerDictionaryExperience : [String: String] = [:]
var playerDictionaryGuardians : [String: String] = [:]

repeat{
    
    let playerName = players[n]
   
    playerDictionaryHeight["\(playerName)"] =  players[n+1]
    playerDictionaryExperience["\(playerName)"] =  players[n+2]
    playerDictionaryGuardians["\(playerName)"] =  players[n+3]

    n += 4
    
    } while n < numberOfPlayers*4


//Sort experienced players from inexperienced players

var experiencedPlayers : [String] = []
var inexperiencedPlayers : [String] = []

for (name,experienceLevel) in  playerDictionaryExperience {
    if experienceLevel == "Yes" {experiencedPlayers.append(name)}
        else {inexperiencedPlayers.append(name)}
}

//Sort and store players into three teams: Sharks, Dragons and Raptors such that each team has the same number of experienced players

var teamSharks : [String] = []
var teamRaptors : [String] = []
var teamDragons : [String] = []

n = 0

repeat {
    if n % 3 == 0 {teamSharks.append(experiencedPlayers[n])}
    else if n % 3 == 1 {teamDragons.append(experiencedPlayers[n])}
    else {teamRaptors.append(experiencedPlayers[n])}
    n+=1
    } while n < experiencedPlayers.count

n = 0

repeat {
    if n % 3 == 0 {teamSharks.append(inexperiencedPlayers[n])}
    else if n % 3 == 1 {teamDragons.append(inexperiencedPlayers[n])}
    else {teamRaptors.append(inexperiencedPlayers[n])}
    n+=1
    } while n < inexperiencedPlayers.count



