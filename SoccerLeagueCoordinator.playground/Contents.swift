// Project aim is to divide the 18 children who have signed up for the league into three even teams — Dragons, Sharks, and Raptors

// Manually create a single collection named 'players' that contains all information for all 18 players

let players : [[String: Any]] = [["name": "Joe Smith", "height": 42, "experience": true, "guardians":  "Jim and Jan Smith"],
                                ["name": "Jill Taner", "height": 36, "experience": true, "guardians":  "Clara Tanner"],
                                ["name": "Bill Bon", "height": 43, "experience": true, "guardians": "Sara and Jenny Bon"],
                                ["name": "Eva Gordon", "height": 45, "experience": false, "guardians": "Wendy and Mike Gordon"],
                                ["name": "Matt Gill", "height": 40, "experience": false, "guardians": "Charles and Sylvia Gill"],
                                ["name": "Kimmy Stein", "height": 41, "experience": false, "guardians": "Bill and Hillary Stein"],
                                ["name": "Sammy Adams", "height": 45, "experience": false, "guardians": "Jeff Adams"],
                                ["name": "Karl Saygan", "height": 42, "experience": true, "guardians": "Heather Bledsoe"],
                                ["name": "Suzane Greenberg", "height": 44, "experience": true, "guardians": "Henrietta Dumas"],
                                ["name": "Sal Dali", "height": 41, "experience": false, "guardians": "Sal Dali"],
                                ["name": "Joe Kavalier", "height": 39, "experience": false, "guardians": "Sam and Elaine Kavalier"],
                                ["name": "Ben Finkelstein", "height": 44, "experience": false, "guardians": "Aaron and Jill Finkelstein"],
                                ["name": "Diego Soto", "height": 41, "experience": true, "guardians": "Robin and Sarika Soto"],
                                ["name": "Chloe Alaska", "height": 47, "experience": false, "guardians": "David and Jamie Alaska"],
                                ["name": "Arnold Willis", "height": 43, "experience": false, "guardians": "Claire Willis"],
                                ["name": "Philip Helm", "height": 44, "experience": true, "guardians": "Thomas Helm and Eva Jones"],
                                ["name": "Les Clay", "height": 42, "experience": true, "guardians": "Wynonna Brown"],
                                ["name": "Herschel Krustofski", "height": 45, "experience": true, "guardians": "Hyman and Rachel Krutofski"]]

//Sort experienced players from inexperienced players

var experiencedPlayers : [[String : Any]] = []
var inexperiencedPlayers : [[String : Any ]] = []

 for index in 0..<players.count{
    let playerExperience : Bool = players[index]["experience"] as! Bool

    if (playerExperience) {experiencedPlayers.append(players[index])}
    else {inexperiencedPlayers.append(players[index])}
}

 
//Sort and store players into three teams: Sharks, Dragons and Raptors such that each team has the same number of experienced players

var teamSharks : [[[String: Any]]] = [[],[]]
var teamDragons : [[[String: Any]]] = [[],[]]
var teamRaptors : [[[String: Any]]] = [[],[]]

for index in 0..<experiencedPlayers.count {
    if index % 3 == 0 {teamSharks[0].append(experiencedPlayers[index])}
 else if index % 3 == 1 {teamDragons[0].append(experiencedPlayers[index])}
    else {teamRaptors[0].append(experiencedPlayers[index])}
    }
 
for index in 0..<inexperiencedPlayers.count {
    if index % 3 == 0 {teamSharks[1].append(inexperiencedPlayers[index])}
    else if index % 3 == 1 {teamDragons[1].append(inexperiencedPlayers[index])}
    else {teamRaptors[1].append(inexperiencedPlayers[index])}
    }

//Restrucure teams such that the average heights are within 1.5

let numberOfPlayersPerTeam : Double = Double ((teamSharks[0].count + teamSharks[1].count + teamDragons[0].count + teamDragons[1].count + teamRaptors[0].count + teamRaptors[1].count)/3)

var teamSharksTotalHeight : Double = 0
var teamDragonsTotalHeight : Double = 0
var teamRaptorsTotalHeight : Double = 0

var constraintSatisfied : Int = 0

while constraintSatisfied < 1 {

    teamSharksTotalHeight=0
    teamDragonsTotalHeight=0
    teamRaptorsTotalHeight=0
    
    for number in 0..<teamSharks.count {
         for index in 0..<teamSharks[number].count {
             let playerHeight : Int? = teamSharks[number][index]["height"] as? Int
             let playerHeightasDouble : Double? = Double(playerHeight!)
             teamSharksTotalHeight = teamSharksTotalHeight + playerHeightasDouble!
        }
     }
 
     for number in 0..<teamDragons.count {
         for index in 0..<teamDragons[number].count {
             let playerHeight : Int? = teamDragons[number][index]["height"] as? Int
             let playerHeightasDouble : Double? = Double(playerHeight!)
             teamDragonsTotalHeight = teamDragonsTotalHeight + playerHeightasDouble!
         }
     }
 
    for number in 0..<teamRaptors.count {
         for index in 0..<teamRaptors[number].count {
             let playerHeight : Int? = teamRaptors[number][index]["height"] as? Int
             let playerHeightasDouble : Double? = Double(playerHeight!)
             teamRaptorsTotalHeight = teamRaptorsTotalHeight + playerHeightasDouble!
         }
     }
 
    if (teamSharksTotalHeight-teamDragonsTotalHeight) < (-1.5*numberOfPlayersPerTeam) || (teamSharksTotalHeight-teamRaptorsTotalHeight) < (-1.5*numberOfPlayersPerTeam) || (teamRaptorsTotalHeight-teamDragonsTotalHeight) < (-1.5*numberOfPlayersPerTeam) || (teamSharksTotalHeight-teamDragonsTotalHeight) > (1.5*numberOfPlayersPerTeam) || (teamSharksTotalHeight-teamRaptorsTotalHeight) > (1.5*numberOfPlayersPerTeam) || (teamRaptorsTotalHeight-teamDragonsTotalHeight) > (1.5*numberOfPlayersPerTeam){
        
        constraintSatisfied = 0
        
        teamSharks[0].append(teamDragons[0][0])
        teamDragons[0].append(teamRaptors[0][0])
        teamRaptors[0].append(teamSharks[0][0])
        
        teamSharks[0].remove(at:0)
        teamDragons[0].remove(at:0)
        teamRaptors[0].remove(at:0)
        
        }
    
    else {constraintSatisfied = 1}

    }

//Print average height of the players of each team

var averageHeightSharks : Double = teamSharksTotalHeight/numberOfPlayersPerTeam
var averageHeightDragons : Double = teamDragonsTotalHeight/numberOfPlayersPerTeam
var averageHeightRaptors : Double = teamRaptorsTotalHeight/numberOfPlayersPerTeam

func averageHeightsFinal() -> String {
    let data = """
                The average height of players on team Sharks is \(averageHeightSharks)
                The average height of players on team Dragons is \(averageHeightDragons)
                The average height of players on team Raptors is \(averageHeightRaptors)
                """
    print(data)
    return data
    }

averageHeightsFinal()

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

 for number in 0..<teamSharks.count {
    for index in 0..<teamSharks[number].count {
        lettergeneratorfor(player : teamSharks[number][index]["name"] as! String, guardians: teamSharks[number][index]["guardians"] as! String, teamName: "Sharks",teamPracticeDateAndTime : "3pm on 17 March")
    }
 }

 for number in 0..<teamDragons.count {
    for index in 0..<teamDragons[number].count {
        lettergeneratorfor(player : teamDragons[number][index]["name"] as! String, guardians: teamDragons[number][index]["guardians"] as! String, teamName: "Dragons",teamPracticeDateAndTime : "1pm on 17 March")
    }
 }
 
 for number in 0..<teamRaptors.count {
    for index in 0..<teamRaptors[number].count {
        lettergeneratorfor(player : teamRaptors[number][index]["name"] as! String, guardians: teamRaptors[number][index]["guardians"] as! String, teamName: "Raptors",teamPracticeDateAndTime : "1pm on 18 March")
    }
 }
 


