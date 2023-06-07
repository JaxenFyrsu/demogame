* Battle_Begins
    ** [Click any key to start the battle.]
    -> clickToStart
    -> DONE

=== clickToStart
-> battleStart

=== battleStart
VAR heroHitPoints = 99
VAR monsterHitPoints = 43
VAR heroStrength = 3
VAR monsterStrength = 1
VAR roundCounter = 1
-> Round_X

=== Round_X
temp heroDamage = DamageCalculation(heroStrength, heroStrength + 4)
temp monsterDamage = DamageCalculation(monsterStrength, monsterStrength + 4)

//choice:
    - ((heroHitPoints > 0) and (monsterHitPoints > 0)) -> chooseAction
    - else -> checkBattleStatus

=== chooseAction
[What do you want to do?]
* Attack -> heroAttack
* Defend -> heroDefend

=== heroAttack
monsterHitPoints -= heroDamage
-> checkBattleStatus

=== heroDefend
-> monsterCounter

=== monsterCounter
heroHitPoints -= monsterDamage
-> checkBattleStatus

=== checkBattleStatus
temp heroHitPointsLeft = heroHitPoints
temp monsterHitPointsLeft = monsterHitPoints

* ((heroHitPointsLeft > 0) and (monsterHitPointsLeft > 0)) -> nextRound
* ((heroHitPointsLeft > 0) and (monsterHitPointsLeft <= 0)) -> victory
* ((heroHitPointsLeft <= 0)) -> defeat

=== nextRound
~ roundCounter += 1
**** [Click any key to proceed to the next round.]
-> Round_X

=== victory
Congratulations! The hero emerges victorious in the battle against the monster!
The hero successfully defeated the monster, achieving a glorious victory in {roundCounter} rounds!
-> DONE

=== defeat
Oh no! The hero has been defeated by the mighty monster.
The battle ends with the hero's defeat after {roundCounter} rounds.
-> DONE

=== function DamageCalculation(min, max)
temp range = max - min + 1
temp offset = Random() % range + min
RETURN offset
