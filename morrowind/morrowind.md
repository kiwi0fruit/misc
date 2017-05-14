# Kiwi0Fruit’s gameplay fixes pack for Morrowind

Here is my set of modules that fix gameplay experience. It consists of two parts and is designed to work together with HotFusion's Economy Adjuster.

The main goal of this set is to make gameplay more convenient and at the same time reduce the opportunities of playing in a manner that feels like cheating and so reduces the pleasure of the game. For this purpose I introduce some rules of playing.

This pack contains my own fix for the levelling system that keeps the vanilla Morrowind mechanics but removes it's inconveniences.

Important! I can guarantee proper work of this module pack only with [_Morrowind Overhaul – Sounds & Graphics 3.0_](http://www.ornitocopter.net/morrowind-overhaul/mgso-release/). If you use russian version then install [_Русификатор "MGSO 3.0 Rus Patch" для мода Morrowind Overhaul 3.0_](http://rutracker.org/forum/viewtopic.php?t=4238689) (some info is also [here](https://steamcommunity.com/sharedfiles/filedetails/?id=234976161)).

After _Morrowind Overhaul_ install [MGSO v3 Temporary Patch 5](http://download.fliggerty.com/download-13-726).

[**_Download_**](https://dl.dropboxusercontent.com/u/5265451/kiwi0fruit_s_gameplay_fixes.zip)

## Additional recomendations:

### 1. Dark Brotherhood Attacks Fixed

Gluby:

> The Tribunal expansion adds, as part of its plotline, a chance of being attacked by leveled Dark Brotherhood (DB) assassins every time the player attempts to rest from the beginning of the game onward. However, the DB assassinations were poorly implemented by Bethesda.
> 
> While the assassins can be annoying in themselves (particularly to weak characters), the bigger problem is that the Dark Brotherhood armor they carry is quite valuable and effective, and, in the unmodded game, it is quite routine to find oneself with several sets within a very short time of starting a new game. It ruins the economy and scaling of the early game, and it does not appear that the Bethesda developers tested its overall game impact much.

So I recommend installing [_Dark Brotherhood Attacks Fixed_](https://dl.dropboxusercontent.com/u/5265451/DBA_Fixed_plus_transportMH.zip) mod by Xiran to fix this problem.

> Another recent addition, and arguably the simplest, this mod simply makes it so the DB attacks subplot will not begin until the player has completed the Morrowind main quest. The Tribunal subplot, and consequently start of the attempted assassinations by the DB, is triggered by the player's arrival in Mounrhold.
>
> The author includes an optional compatibility plugin for mods, like Kateri's Julan, Ashlander Companion, which require the player to travel to Mournhold before completing the main quest, that allows the player to travel to Mournhold without triggering the DB attacks.

### 2. Magicka Regen for NPCs

Kalamestari_69:

> Did you ever find it annoying that NPC mages were too...easy? After running out of their magicka, they were nearly defenseless.

I recommend installing _[Magicka Regen for NPCs](http://www.nexusmods.com/morrowind/mods/26466)_ mod by Kalamestari_69 to fix this problem.

> This mod adds magicka regeneration ability to all the races of Tamriel. Remember that this mod will not do anything to the Player.

### 3. HotFusion's Economy Adjuster

I recommend installing the following parts of _[HotFusion's Economy Adjuster](http://btb2.free.fr/morrowind.html#hotfusion)_ module:

* Ingredients [`EcoAdjIngredients.esp`]
* Daedric Drops [`EcoAdjDaedricDrops.esp`]
* Crime (Tresspass Edit) [`EcoAdjCrime (Tresspass Edit).esp`]

See description and download link [here](http://btb2.free.fr/morrowind.html#hotfusion).

I also recommend using the modification for console usage of the following module:

*   Merchant Skills [`EcoAdjMerchantSkills_console.esp`] which is included in the `kiwi0fruit_s_gameplay_fixes.zip` archive.

This makes the economy of Morrowind more realistic and fixes the infamous "mercantile bug". The instruction is following:

You should alter every merchant in game by using the console. If the merchant **_offers training_** services, press ~, click on him/her, and then type

> `StartScript xMerchT`

into the console, and press enter. If the merchant in question **_doesn't offer training_**, type

> `StartScript xMerch`

instead (same thing, but without the T at the end). You'll only have to do this once per NPC. The changes are permanent.

Arille is very important character so you should change his level in order to fit the Merchant Skills module logic. Click on Arille, and type

> `SetLevel 5`

This should be done before using `xMerchT` or `xMerch` on Arille.

### 4. Tarnsman’s No thieving start

Tarnsman:

> Eliminates the “thieving start” at the beginning of the game.  Places ownership on all items inside the Census and Excise office as well as all the outside containers in the cities, thereby eliminating an easy source of gold and items for the player. Balanced by giving extra gold and items to the Player at the start.  In addition, all the tutorial messages when you start a new game have been removed.

[Download link](http://mw.modhistory.com/download--2706).

### 5. Better Dialogue Font / Bigger Vanilla Font / Morrowind Code Patch
- Hrnchamd’s [Better Dialogue Font](http://www.nexusmods.com/morrowind/mods/36873). If you use russian version then install [russian version](http://tesall.ru/files/download/3106-better-dialogue-font/).
- Xuligator’s [Bigger Vanilla Font](http://www.nexusmods.com/morrowind/mods/42420). If you use russian version then download _Bigger Vanilla Font Ru_.
- [Morrowind Code Patch](http://www.nexusmods.com/morrowind/mods/19510) version 2.2 or later. Enable "Better typography".
- In order to disable bigger font copy-install again _Better Dialogue Font_ contents. In order to enable bigger font copy-install _Bigger Vanilla Font_.

### 6. Westly's Pluginless Head and Hair Replacer
[From here](https://www.reddit.com/r/Morrowind/comments/19ycge/morrowind_modding_guide/):
> This pluginless head replacer made by Westly replaces the vanilla heads with updated one's that stay truer to the originals than those included in the overhaul. It does not replace the Beast Race Heads however. The changes made by this mod will overwrite those of the overhaul.

[Download link](http://download.fliggerty.com/download-127-874).

## More information about modules in the pack:

### 1. Level up fix [`Kiwi0Fruit_level_up_fix.esp`]

This module fixes the irritating Morrowind levelling system but leaves the main concept.

* Now when level up you "open" attributes for further progress (exept luck, increasing the luck works as before). Opens 5 points for each selected attribute per level (maximum 3 attributes can be selected).
* The amount of opened attributes are shown in ___Xmax___ stats that are listed in the ___Stats___ scroll.
* The skill increase determine how much of the "opened" attributes will be actually "filled".
* The amount of ready to be filled attributes are shown in ___dXleft___ stats that are listed in the ___Stats___ scroll.
* The player's health is calculated depending on your level, **current** endurance and starting health by the algorithm that imitates the vanilla health gaining system.
* But the main difference is that the algorithm supposes that you were increasing Endurance by 5 points each level. And that you did it on early levels.

To provide correct functioning of the module follow the instructions below:

1. Right after leaving Census and Excise Office (when you are 1st level and gained no skills) type the following in the console:  

  `startscript x0save`  
  `player->additem xScroll 1`  
   
2. Right before level up sleeping put off all magic items and end all spells and diseases affecting you and type in the console:  

  `startscript xBefore`  
   
3. Right after waking up (after levelling up) type in the console:  

  `startscript xAfter`  
   
4. Then you may put on all magic items again.
5. Use the ___Stats___ scroll (`xScroll`) to watch your attributes progress.
6. If you'd like to use this module not from the beginning of the game you can edit `x0save111` script and calculate what should be there by your own.

### 2. Misc fixes [`Kiwi0Fruit_misc_fixes.esp`]

Changes:

* Changes unarmored skill so it now gives 100 armor at skill level of 100 (instead of 65 armor).
* Sets value of self-made potions to 0.
* Adds a new class called ___Conjurer___: main attributes are _Luck_ and _Endurance_. Specialization is _Magic_. Major skills are _Conjuration, Mysticism, Destruction, Illusion_ and _Enchant_. Minor skills are _Alteration, Short Blade, Sneak, Light Armor_ and _Restoration_.
* Changes master trainer Qorwynn fight parameter from 90 to 30 so he will not attack you now.
* Adds a corpse of a scrib to Balmora Guild of Mages so you can use it as an infinite container.
* Sets amount of gold of Creeper and Mudcrab Merchant to 100.
* Magicka regenerates to 100% no matter how much hours you slept. You should type into console the following:  

  `startscript FasterRestoreMagicka`  
   
* Undo pearl random settings change that are made in HotFusion's Economy Adjuster `EcoAdjIngredients.esp` module.
* The cost of training is multiplied by 3.
* _The Atronach_ birthsign _Wombburn_ ability was changed: _Fortify Maximum Magicka_ was lowered to _x1.5 (15pt)_ instead of _x2.0 (20pt)_, _Spell Absorption_ was lowered to _30pt_ instead of _50pt_.

### 3. Races Rebalance [`Kiwi0Fruit_races_rebalance.esp`]

* All races except Bretons and Altmers were given additional _Fortify Maximum Magicka x0.5 (5pt)_ ability.
* Altmer's weaknesses to magic and fire were lowered to 25%.
* Argonians' _Water Breathing_ was made permanent ability.
* Bosmers' _Beast Tongue_ was extended to 1440 seconds.
* Bosmers' got _Heal Companion Power_ that is _Restore Health 200pt on Target_.
* Bretons' _Dragon Skin_ was lowered from _Shield 50pt_ to _Shield 30pt_.
* Dunmers' _Ancestor Guardian_ was lowered from _Sanctuary 50pt_ to _Sanctuary 30pt_.
*   Imperials' _Voice of the Emperor_ was changed to _Charm 25 to 50 pts for 60 seconds on target_ (instead of _15 seconds_).
*   Imperials' _Star of the West_ was changed to _Fortify Luck 50pt 60sec on Self_ (instead of _Absorb Fatigue 200 pts on target_).
* Khajiits' _Eye of Night_ was extended to 60 seconds.
* Nords' _Woad_ was lowered from _Shield 30pt_ to _Shield 20pt_.
* Nords' _Thunder Fist_ was removed (_Frost Damage 25pts on Touch_).
* Orcs' _Berserk_ was changed to _Fortify Attack & Fatigue + Drain Agility 100pt 60sec on Self_ (_Fortify Health 20pts & Fatigue 200pts for 60sec on Self_ were removed).
* Redguards' _Adrenaline Rush_ was changed to _Fortify Speed, Agility & Endurance 50pt 60sec on Self_ (_Fortify Strength 50pts & Health 25pts for 60sec on Self_ were removed).

### 4. Gameplay fix [No module. You are supposed to use your will :)]

Follow these instructions in order to avoid game mechanics bugs that will reduce the pleasure of the gameplay:

1. Breaking the following is almost like using `sethealth`, `setattribute`, `setskill`, `setlevel` cheats:
  * Do not cast spells only for the skill increase.
  * Do not let enemies hit you only for the skill increase.
  * Do not summon creatures and hit them only for the skill increase.
  * Do not hit and cure enemies only for the skill increase.
  * Do not cast lock spell only for the skill increase.
  * Do not set Alchemy, Mercantile, Acrobatics, Athletics as your major or minor skills. This is important with _Kiwi0Fruit's Level up fix_ module that loosens vanilla better-when-cheduled level up system with a price of easy level gaining via Alchemy, Mercantile, Acrobatics, Athletics **without** drawbacks that were in vanilla.
  * If you feel that some time spent on exercises fits the idea of preparations for the real deal then go ahead. But do not be too enthusiastic because the mechanics is really unbalanced.
2. Breaking the following is almost like using `tgm` cheat:
  * Do not create spells in unexpected way in order to get a cheap and easy way of killing enemies. The key point is that it is too cheap so unbalanced.
  * Do not cast Levitate 1pt spell on others in order to immobilize them (it's too cheap).
  * Do not drink lots of sujamma and kill everything in one hit.
3. Breaking the following is almost like using `player->additem gold_001` cheat (because of the flaws in Morrowind economy):
  * Do not buy low and sell high in orger to make profit. Do only buy and use. Do only loot and sell.
  * Do not kill and rob in front of witnesses because the Morrowind crime punishment is unbalanced and you can easily pay guards and make a huge profit. This 'bug' is fixed in _HotFusion's Economy Adjuster_.
  * Try not to kill and rob merchants even if they are all alone. This is important in situation when you can make a huge profit and ruin the levelling pleasure.
  * Do not use series of small bargains to rise merchant disposition.
  * When selling things follow the instructions below:
    1. Let X be the value of the item.
    2. If X is less than 2000 then sell item for X gold.
    3. If X is between 2000 and 4000 then sell item for 2000 gold.
    4. Otherwise sell item for `Round[X/Log[2, X/1000], 100]` gold, but not more than 15000 gold.
    5. You can calculate the formula above by means of Wolfram Alpha. Just follow [_the link_](http://www.wolframalpha.com/input/?i=Min%5B15000%2CRound%5Bx*Log%5B2%5D%2FLog%5Bx%2F1000%5D%2C100%5D%5D%3Bx%3D5000) and replace 5000.
4. Do not use information that is not available to your character. For example take the cool loot (ring, boots, etc.) **only** if you know where they are from the ingame sources. Surely you can take loot if you found it accidentally.
5. Do not use short duration custom spells to deal with merchants and talk with NPCs. For this purpose only use spells and potions with duration more than 59 seconds.
6. Do not use short duration magic effects to disable side effects of equipment and potions. You can only use equipment when the spell effect lasts. Re-equip them after it ends. Because you cannot re-equip potions with side effects you should disable their side effects with magic effects of longer or the same duration.
7. Do not use potions effects to create other potions. For example boosting intelligence with potions and making more potions.
8. Do not create custom conjuration summon spells with duration less than 60 seconds. This ruins levelling progress idea in conjuration (Dremora for 15 sec is still a kick ass but is easily available for a 1st level character).
9. If you can overcome the blind enchantment of the Boots of Blinding Speed they become severely overpowered (they help much in combat). So do not overcome it. If you are a Breton or an Orc and have no choise (or have a constant enchantment and do not want to bother re-equipping) then do the following trick: expand map container so it hides everything. Then pin it so it always stays visible. Use Boots of Blinding Speed and see nothing but a map.
