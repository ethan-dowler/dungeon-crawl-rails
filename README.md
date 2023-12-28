# BrowseRPG

Working title: **Dungeons of Tairos**

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

## Current Features

- Characters
  - Warrior and Rogue available with different base stats
  - higher base stat = faster progression in that stat
  - math for stat generation was [stolen from Pokémon](https://bulbapedia.bulbagarden.net/wiki/Stat#Determination_of_stats) and modified for my use
- Equipment
  - weapons, armor, shields, etc. can be equipped to improve stats
  - sword-and-board & dual-wielding styles are supported
- Flat Level Progression
  - start at level 5 and gain XP from defeating monsters
  - math for XP stolen from Pokémon (using _[medium fast](https://bulbapedia.bulbagarden.net/wiki/Experience#Medium_Fast)_ level progression)
- Elementary Dungeon Design
  - only available dungeon has same layout and same enemies every time
- Monsters
  - only current monster is a giant rat!
  - monsters have loot with a percent chance to drop

## Roadmap Features

### Minimum Viable Game

- Game log
  - track what happens during the dungeon run
  - display scrollable window of game log
  - add to game log whenever something of note happens (attack, deal damage, enter a room, pick up an item, etc.)

### Planned Features

- More combat actions
  - allow the player to do more than a basic attack
- Dungeon design
  - multiple, hand-crafted dungeons with recommended level ranges
  - Deeper floors have more complicated layouts and tougher enemies
- Monster design
  - make something other than a giant rat
- Skill Point progression system
  - gain skill points by leveling up
  - spend skill points to unlock new abilities and stat bonuses (i.e. "perks")
- Custom character generation
  - allow player to "build" a character from scratch
  - set base stats (using a point-buy system?)
  - choose starting equipment (spend a certain amount of money? choose a preset bundle?)
- Dungeon Map
  - allow player to see where they are relative to other rooms they've visited
  - show pips for unopened doors
  - add icons for items, monsters, etc. that are left behind
  - better navigation UI (N/E/S/W)

### Nice-to-have Features

- Skills
  - lock-picking (open locked doors and chests)
  - stealth (remain hidden from enemies)
  - awareness (spot hidden doors, traps, and enemies)
  - arcana (identify and use magic items & spells)
  - etc...
- Town
  - non-dungeon activities
  - venders - buy/sell/trade items
  - trainers - unlock skills or improve abilities
  - unlock and upgrade town buildings!

## Technical Details

- [Ruby 3.2.X](https://www.ruby-lang.org/en/)
  - [Rails 7.X](https://guides.rubyonrails.org/)
    - [Hotwire](https://hotwired.dev/)
  - [RSpec](https://rspec.info/)
  - [Rubocop](https://rubocop.org/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Hero Icons](https://heroicons.com/)

## Contributing

If you would like to start a conversation about this project, please create [a GitHub issue](https://github.com/ethan-dowler/browserpg/issues) on this repo. Thanks!
