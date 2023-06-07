=== Battle_Begins
-> clickToStart
-> DONE

=== clickToStart
[Click any key to start the battle.]
-> battleStart

=== battleStart
~ heroHitPoints = 99
~ monsterHitPoints = 43
~ heroStrength = 3
~ monsterStrength = 1
-> Round_X

=== Round_X
~ heroDamage = randomInRange(heroStrength, heroStrength + 4)
~ monsterDamage = randomInRange(monsterStrength, monsterStrength + 4)

* heroAttack:
    ~ monsterHitPoints = monsterHitPoints - heroDamage
    -> checkBattleStatus

* monsterCounter:
    ~ heroHitPoints = heroHitPoints - monsterDamange
    -> checkBattleStatus

=== checkBattleStatus
~ heroHitPointsLeft = heroHitPoints
~ monsterHitPointsLeft = monsterHitPoints

* ((heroHitPointsLeft > 0) and (monsterHitPointsLeft > 0)) -> nextRound
* ((heroHitPointsLeft > 0) and (monsterHitPointsLeft <= 0)) -> victory
* ((heroHitPointsLeft <= 0)) -> defeat

=== nextRound
[Click any key to proceed to the next round.]
-> Round_X

=== victory
Congratulations! The hero emerges victorious in the battle against the monster!
The hero successfully defeated the monster, achieving a glorious victory!
-> DONE

=== defeat
Oh no! The hero has been defeated by the mighty monster.
The battle ends with the hero's defeat.
-> DONE

=== function randomInRange(min, max)
~ range = max - min + 1
~ offset = Random(0, range - 1) + min
RETURN offset
