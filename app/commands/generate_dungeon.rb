class GenerateDungeon
  attr_reader :dungeon_template

  def initialize(dungeon_template)
    @dungeon_template = dungeon_template
  end

  # TODO: add POIs and traits to dungeon/floor/room templates
  def execute # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    DungeonTemplate.transaction do # rubocop:disable Metrics/BlockLength
      dungeon = Dungeon.create!(dungeon_template:)

      # create all rooms in the dungeon
      dungeon_template.floor_templates.each do |floor_template|
        floor = dungeon.floors.create!(floor_template:)
        floor_template.room_templates.each do |room_template|
          floor.rooms.create!(room_template:)
        end
      end

      # connect the rooms
      dungeon.floors.each do |floor|
        floor.rooms.each do |room|
          room.update!(
            north_room: dungeon.rooms.find_by(room_template: room.room_template.north_room_template),
            east_room: dungeon.rooms.find_by(room_template: room.room_template.east_room_template),
            south_room: dungeon.rooms.find_by(room_template: room.room_template.south_room_template),
            west_room: dungeon.rooms.find_by(room_template: room.room_template.west_room_template),
            above_room: dungeon.rooms.find_by(room_template: room.room_template.above_room_template),
            below_room: dungeon.rooms.find_by(room_template: room.room_template.below_room_template)
          )
        end
      end

      # set the entrance
      entrance_room = dungeon.rooms.find_by(room_template_id: dungeon_template.entrance_room_template_id)
      dungeon.update!(entrance_room:)

      # return a brand new dungeon!
      dungeon.reload
    end
  end
end
