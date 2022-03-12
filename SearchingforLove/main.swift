import Foundation

var isSearched = false
//By default true to repeat the condition
var valid = true
repeat
{
    print("Hello..!! Welcome to Searching For Love Game")
    print("What will you do")
    if(isSearched == true)
    {
    print("1. Search for Astrid" + "[Complete!]")
    }
    print("1. Search for Astrid")
    print("2. Rescue Astrid")
    print("3. Quit")
    let selection = Int(readLine()!)
    switch (selection) {
        case 1:
            print("Searching for Astrid....")
            isSearched = true
        case 2:
            var giveUp = true
            print("Rescuing Astrid....")
            if(isSearched)
            {
                print("already Know the location of astrid")
                let m1 = Monsters("Xyz")
                print("main",m1.abilityToAttack)
                print("main",m1.maxHealthPoint)
                //let l1 = Locations(locationName: "abc",monster: m1)
                // l1
                let heroe = Heroes()
                print(heroe.name)
                repeat
                {
                    print("Hugie, what move will you make?")
                    if(true)
                    {
                    print("1. Attack")
                    print("2. Sneak")
                    print("3. Give Up")
                    
                    let selection = Int(readLine()!)
                    switch(selection)
                        {
                            case 1:
                                print("Attack")
                                heroe.takeDamage(amt: m1.abilityToAttack)
                                print("Damage taken",heroe.attack())
                                print(heroe.maxHealthPoint)
                                m1.takeDamage(amt: heroe.weaponStrength)
                                print(m1.attack())
                            case 2:
                                print("Sneak")
                            case 3:
                                giveUp = false
                                print("Monster wins..Hugie Gave up..!!")
                                print("Game Over")
                                valid = false
                            default :
                                print("Default")
                        }
                    }
                }while(giveUp == true)
            }
            else
            {
            print("Please select option 1 from menu and Search For Astrid's Location")
            }
        case 3:
            print("bye")
            valid = false // make it false to close the game
            break
        default:
            print("Invalid selection, try again.")
    }
}while(valid == true)


