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
                             "Sal Dali", "41", "No", "Sal Dali",
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
var teamDragons : [String] = []
var teamRaptors : [String] = []

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

//Calculate average height of each team

let numberOfPlayersPerTeam : Double = Double ((teamSharks.count + teamDragons.count + teamRaptors.count)/3)

var teamSharksHeight : [Int] = []
var teamDragonsHeight : [Int] = []
var teamRaptorsHeight : [Int] = []

var teamSharksTotalHeight : Double = 0
var teamDragonsTotalHeight : Double = 0
var teamRaptorsTotalHeight : Double = 0

for player in teamSharks {
    let a : String? = playerDictionaryHeight[player]
    let b : Double? = Double(a!)
    teamSharksTotalHeight = teamSharksTotalHeight + b!
}

for player in teamDragons {
    let c : String? = playerDictionaryHeight[player]
    let d : Double? = Double(c!)
    teamDragonsTotalHeight = teamDragonsTotalHeight + d!
}

for player in teamRaptors {
    let e : String? = playerDictionaryHeight[player]
    let f : Double? = Double(e!)
    teamRaptorsTotalHeight = teamRaptorsTotalHeight + f!
}

//Restrucure teams such that the average heights are within 1.5

var constraintSatisfied : Int = 0

while constraintSatisfied < 1 {

    teamSharks.append(teamDragons[0])
    teamDragons.append(teamRaptors[0])
    teamRaptors.append(teamSharks[0])

    teamSharks.remove(at:0)
    teamDragons.remove(at:0)
    teamRaptors.remove(at:0)

    teamSharksTotalHeight=0
    teamDragonsTotalHeight=0
    teamRaptorsTotalHeight=0

    for player in teamSharks {
        let g : String? = playerDictionaryHeight[player]
        let h : Double? = Double(g!)
        teamSharksTotalHeight = teamSharksTotalHeight + h!
    }
    
    for player in teamDragons {
        let i : String? = playerDictionaryHeight[player]
        let j : Double? = Double(i!)
        teamDragonsTotalHeight = teamDragonsTotalHeight + j!
    }
    
    for player in teamRaptors {
        let k : String? = playerDictionaryHeight[player]
        let l : Double? = Double(k!)
        teamRaptorsTotalHeight = teamRaptorsTotalHeight + l!
    }

    
    if (teamSharksTotalHeight-teamDragonsTotalHeight) < (-1.5*numberOfPlayersPerTeam) || (teamSharksTotalHeight-teamRaptorsTotalHeight) < (-1.5*numberOfPlayersPerTeam) || (teamRaptorsTotalHeight-teamDragonsTotalHeight) < (-1.5*numberOfPlayersPerTeam) || (teamSharksTotalHeight-teamDragonsTotalHeight) > (1.5*numberOfPlayersPerTeam) || (teamSharksTotalHeight-teamRaptorsTotalHeight) > (1.5*numberOfPlayersPerTeam) || (teamRaptorsTotalHeight-teamDragonsTotalHeight) > (1.5*numberOfPlayersPerTeam) {constraintSatisfied = 0}
    else { constraintSatisfied = 1}
}
    
//Generate personalised letters to each of the guardians

var letters : [String] = []

func lettergeneratorfor(player: String!, guardians: String!, teamName: String!, teamPracticeDateAndTime: String!) -> String {
    let letter = """
                Hello, \(guardians!)!
                Just a quick note to let you know that \(player!) has been selected to play in the \(teamName!) soccer team.
                Team \(teamName!)'s next practice is at \(teamPracticeDateAndTime!).
                Please let me know if you need anything else.
                Best wishes, Soccer team manager"
                """
    print(letter)
    letters.append(letter)
    return letter
}

for player in teamSharks {
    let guardians = playerDictionaryGuardians[player]
    lettergeneratorfor(player : player, guardians: guardians, teamName: "Sharks",teamPracticeDateAndTime : "3pm on 17 March")
}

for player in teamDragons {
    let guardians = playerDictionaryGuardians[player]
    lettergeneratorfor(player : player, guardians: guardians, teamName: "Dragons",teamPracticeDateAndTime : "1pm on 17 March")
}

for player in teamRaptors {
    let guardians = playerDictionaryGuardians[player]
    lettergeneratorfor(player : player, guardians: guardians, teamName: "Raptors",teamPracticeDateAndTime : "1pm on 18 March")
}
