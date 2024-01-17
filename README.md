# Dungeon Crawl Rails

An experiment to see if you can build a dungeon-crawler game in Rails! I also wanted to learn Tailwind, so I took this opportunity

## Premise

The entrance to a dark and mysterious dungeon has erupted from the ground at the center of the continent of Tairos.

No one knows why it appeared, but it’s clear that it’s dangerous. Monsters emerge from it daily.

Players take characters through the dungeon, layer by layer, until they find and defeat the source of the corruption.

## Goals

The goal of this project is to build a text-based RPG that's designed **for the browser** with an emphasis on the mobile browser experience.

I want to pick up exactly where I left off and play for whatever length of time I have available.

## Motivations

So many games have fancy graphics and epic soundtracks, but I don't always have time to sit down and play a game for hours at a time. I want a game that I can pick up and put down instantly.

Aside from the actual gameplay, I've been very interested in building a game with Ruby and/or Rails for a long time. As a professional RoR developer and avid gaming fan, it's exciting to combine one of my favorite hobbies with my professional skill set.

### Side Note

Also, I've always been skeptical of Tailwind, but I've never given a try, so I thought this would be a good opportunity for me to give it a fair shot. I still don't like it, but now I can firmly say _why_ I don't like it. Mainly because it conflates page structure (HTML) with page style (CSS).

## Current Features

The current engine is based on Pokemon. The only real difference is the fact that you can equip weapons and armor to change your stats. Also, there's only one "move": Attack.

- Characters
  - Three basic characters with different stats
    - Guardian - high HP & Defense; low Spirit & Wisdom
    - Blade Dancer - high Speed & Attack; low Spirit & Wisdom
    - Arcanist - high Spirit & Wisdom; low Attack & Defense
  - higher base stat = faster progression in that stat
  - math for stat generation was [stolen from Pokémon](https://bulbapedia.bulbagarden.net/wiki/Stat#Determination_of_stats) and modified slightly for my use
    - removed EVs and IVs from Pokémon formula
    - added "flat" and "percent" modifiers
- Equipment
  - weapons, armor, shields, etc. can be equipped to improve stats
  - sword-and-board & dual-wielding styles are supported
  - magic-boosting items are included (e.g. wand, spellbook), but there are no actions that use Spirit or Wisdom yet
- Flat Level Progression
  - start at level 5 and gain XP from defeating monsters
  - math for XP stolen from Pokémon (using _[medium fast](https://bulbapedia.bulbagarden.net/wiki/Experience#Medium_Fast)_ level progression)
- Elementary Dungeon Design
  - only available dungeon has same layout and same enemies every time
  - two plus-shaped floors with a boss room on the third floor
  - every "dungeon run" creates a brand new dungeon instance with brand new monsters
  - once you leave a dungeon instance, you can't access it again
  - each room has a chance to spawn a monster
- Elementary Combat
  - you and the monster exchange "basic attacks" (the Pokémon equivelant of Pound - 40 base power; 100% accuracy)
  - higher speed goes first
  - knocking out the monster first prevents them from hitting you
- Monsters
  - only current monsters are giant rats and a king rat
  - monsters have multiple loot items with different percent chances to drop
- Game log
  - track what happens during the dungeon run
  - display scrollable window of game log
  - add to game log whenever something of note happens (deal damage, defeat a monster; gain xp, pick up an item, etc.)

## Possible Feature Expansions

I probably won't build any of these using the "game engine" in this repo, but they are things that _could_ be added to it. I'm going to try building out a new engine in a new repo that fosters the kind of gameplay I want.

### Simple

- More combat actions
  - allow the player to do more than a basic attack
  - martial techniques
  - spells! (consume MP? turn-based CD? certain times per dungeon? per floor?)
  - defend/block/dodge
- Updated combat system
  - select action THEN select target
  - turn-based with speed/action determining when next action happens (a la [Doom & Destiny](https://doomanddestiny.fandom.com/wiki/Doom_%26_Destiny?file=DoandDe_Screenshot3_-_Use_Spell.jpg))
- Skill Point progression system
  - gain skill points by leveling up
  - spend skill points to unlock new abilities and stat bonuses (i.e. "perks")
- Custom character generation
  - allow player to "build" a character from scratch
  - set base stats (using a point-buy system?)
  - choose starting equipment (spend a certain amount of money? choose a preset bundle?)

### Expanded

- Party mechanics
  - allow player to control multiple characters in a single run
- Town
  - non-dungeon activities
  - venders - buy/sell/trade items
  - trainers - unlock skills or improve abilities
  - unlock and upgrade town buildings!
- Story/Campaign
  - track player progress through narrative events
  - track time spent during campaign (in-game days)
  - progressive, hand-crafted dungeons
    - some level of open-worldness with multiple paths for progression
    - More complicated dungeons with story-trigger mechanics
    - Deeper floors have more complicated layouts and tougher enemies
- Skills
  - lock-picking (open locked doors and chests)
  - stealth (remain hidden from enemies)
  - awareness (spot hidden doors, traps, and enemies)
  - arcana (identify and use magic items & spells)
  - etc...

### Probably Not...

- Dungeon Map
  - allow player to see where they are relative to other rooms they've visited
  - show pips for unopened doors
  - add icons for items, monsters, etc. that are left behind

## Technical Details

- [Ruby 3.2.X](https://www.ruby-lang.org/en/)
  - [Rails 7.X](https://guides.rubyonrails.org/)
    - [Hotwire](https://hotwired.dev/)
  - [RSpec](https://rspec.info/)
  - [Rubocop](https://rubocop.org/)
- [Tailwind CSS](https://tailwindcss.com/) (experimental; considering dropping this)
- [Hero Icons](https://heroicons.com/)

## Contributing

If you would like to start a conversation about this project, please create [a GitHub issue](https://github.com/ethan-dowler/dungeon-crawl-rails/issues) on this repo. Thanks!
