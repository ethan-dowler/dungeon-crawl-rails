class GenerateDungeon
  attr_reader :dungeon_template

  def initialize(dungeon_template)
    @dungeon_template = dungeon_template
  end

  # TODO: procedurally generate floors and rooms?
  #       that sounds hard... just add some radomization!
  #       like add traits to each template
  def execute # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    DungeonTemplate.transaction do # rubocop:disable Metrics/BlockLength
      dungeon = Dungeon.create!(dungeon_template:)

      # first floor - create rooms
      ground_floor = dungeon.floors.create!(name: 'Floor 1', level: 0)
      ground_floor.floor_encounters.create(
        monster_template: MonsterTemplate.first,
        level_range_start: 2,
        level_range_end: 3
      )
      gf_middle_room = ground_floor.rooms.create!(name: 'Middle Room')
      gf_north_room = ground_floor.rooms.create!(name: 'North Room')
      gf_east_room = ground_floor.rooms.create!(name: 'East Room')
      gf_south_room = ground_floor.rooms.create!(name: 'South Room')
      gf_west_room = ground_floor.rooms.create!(name: 'West Room')

      # first floor - connect rooms
      gf_middle_room.update!(
        north_room: gf_north_room,
        east_room: gf_east_room,
        south_room: gf_south_room,
        west_room: gf_west_room
      )
      gf_north_room.update!(south_room: gf_middle_room)
      gf_east_room.update!(west_room: gf_middle_room)
      gf_south_room.update!(north_room: gf_middle_room)
      gf_west_room.update!(east_room: gf_middle_room)

      # second floor - create rooms
      floor_one = dungeon.floors.create!(name: 'Floor 2', level: 1)
      floor_one.floor_encounters.create(
        monster_template: MonsterTemplate.first,
        level_range_start: 4,
        level_range_end: 5
      )
      f1_middle_room = floor_one.rooms.create!(name: 'Middle Room')
      f1_north_room = floor_one.rooms.create!(name: 'North Room')
      f1_east_room = floor_one.rooms.create!(name: 'East Room')
      f1_south_room = floor_one.rooms.create!(name: 'South Room')
      f1_west_room = floor_one.rooms.create!(name: 'West Room')

      # second floor - connect rooms
      f1_middle_room.update!(
        north_room: f1_north_room,
        east_room: f1_east_room,
        south_room: f1_south_room,
        west_room: f1_west_room
      )
      f1_north_room.update!(south_room: f1_middle_room)
      f1_east_room.update!(west_room: f1_middle_room)
      f1_south_room.update!(north_room: f1_middle_room)
      f1_west_room.update!(east_room: f1_middle_room)

      # the south room of floor 2 is directly above the north room of floor 1
      gf_north_room.update!(above_room: f1_south_room)
      f1_south_room.update!(below_room: gf_north_room)

      # players start in the south room of floor 1
      dungeon.update!(entrance_room: gf_south_room)

      # return a brand new dungeon!
      dungeon
    end
  end
end
