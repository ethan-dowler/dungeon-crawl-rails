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
      floor_one = dungeon.floors.create!(name: 'Floor 1', level: 1)
      floor_one.floor_encounters.create(
        monster_template: MonsterTemplate.first,
        level_range_start: 2,
        level_range_end: 3
      )
      f1_middle_room = floor_one.rooms.create!(name: 'Middle Room')
      f1_north_room = floor_one.rooms.create!(name: 'North Room')
      f1_east_room = floor_one.rooms.create!(name: 'East Room')
      f1_south_room = floor_one.rooms.create!(name: 'South Room')
      f1_west_room = floor_one.rooms.create!(name: 'West Room')

      # first floor - connect rooms
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

      # second floor - create rooms
      floor_two = dungeon.floors.create!(name: 'Floor 2', level: 2)
      floor_two.floor_encounters.create(
        monster_template: MonsterTemplate.first,
        level_range_start: 4,
        level_range_end: 5
      )
      f2_middle_room = floor_two.rooms.create!(name: 'Middle Room')
      f2_north_room = floor_two.rooms.create!(name: 'North Room')
      f2_east_room = floor_two.rooms.create!(name: 'East Room')
      f2_south_room = floor_two.rooms.create!(name: 'South Room')
      f2_west_room = floor_two.rooms.create!(name: 'West Room')

      # second floor - connect rooms
      f2_middle_room.update!(
        north_room: f2_north_room,
        east_room: f2_east_room,
        south_room: f2_south_room,
        west_room: f2_west_room
      )
      f2_north_room.update!(south_room: f2_middle_room)
      f2_east_room.update!(west_room: f2_middle_room)
      f2_south_room.update!(north_room: f2_middle_room)
      f2_west_room.update!(east_room: f2_middle_room)

      # the south room of floor 2 is directly above the north room of floor 1
      f1_north_room.update!(above_room: f2_south_room)
      f2_south_room.update!(below_room: f1_north_room)

      # players start in the south room of floor 1
      dungeon.update!(entrance_room: f1_south_room)

      # return a brand new dungeon!
      dungeon
    end
  end
end
