// Project aim is to divide the 18 children who have signed up for the league into three even teams — Dragons, Sharks, and Raptors

// Step 1a - Manually create a single collection named 'players' that contains all information for all 18 players

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

//Step 1b - represent each player by a Dictionary with String keys and the corresponding values.

var n: Int = 0

let numberOfPlayers = players.count / 4

var playerDictionary : [String: String] = [:]


    repeat{
    let playerName = players[n]
   
    playerDictionary["\(playerName) name"] =  players[n]
    playerDictionary["\(playerName) height"] =  players[n+1]
    playerDictionary["\(playerName) experience"] =  players[n+2]
    playerDictionary["\(playerName) guardians"] =  players[n+3]

    n += 4} while n < numberOfPlayers*4
    

    
    for codes in playerDictionary {
        print("code: \(codes)")
    }





