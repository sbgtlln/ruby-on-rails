class User
    attr_reader :name

    def initialize(name, birth_year)
        @name = name
        @birth_year = birth_year
    end

    def self.class_name
        "It's a User class" 
    end

    def age
        Time.now.year - @birth_year
    end
end

p User.class_name 
me = User.new("Alina", 2004)
p me.name 
p me.age 