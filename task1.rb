class Raspberry
    attr_reader :index, :state
  
    @@states = ["Нету", "Цветет", "Зеленая", "Красная"]
  
    def initialize(index)
      @index = index
      @state = @@states[0]
    end
  
    def grow!
      @state = @@states[@@states.index(@state) + 1] if @state != @@states.last
    end
  
    def ripe?
      @state == @@states.last
    end
  end
  
  class RaspberryBush
    def initialize(num_raspberries)
      @raspberries = Array.new(num_raspberries) { Raspberry.new(rand(1..10)) }
    end
  
    def grow_all!
      @raspberries.each { |raspberry| raspberry.grow! }
    end
  
    def ripe_all?
      @raspberries.all? { |raspberry| raspberry.ripe? }
    end
  
    def give_away_all!
      @raspberries.clear
    end
  end
  
  class Human
    attr_reader :name
  
    def initialize(name, plant)
      @name = name
      @plant = plant
    end
  
    def work!
      @plant.grow_all!
    end
  
    def harvest
      if @plant.ripe_all?
        @plant.give_away_all!
        puts "Урожай собран!"
      else
        puts "Ещё рано собирать урожай."
      end
    end
  
    def self.knowledge_base
      puts "Справка по садоводству:"
      puts "Сажать малину лучше весной."
      puts "Малину нужно поливать регулярно."
    end
  end
  
  if __FILE__ == $PROGRAM_NAME
    Human.knowledge_base
  
    raspberries_bush = RaspberryBush.new(5)
    human = Human.new("Alina", raspberries_bush)
  
    human.work!
    human.harvest
  
    until raspberries_bush.ripe_all?
      human.work!
    end
  
    human.harvest
  end
  