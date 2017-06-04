require "passat/version"

module Passat

  def invert(i)
  return not(i)
  end

  attr_accessor :clause

  def load(file)
    @temparr = []
    @clause = []
     File.open(file) do |f|
       f.each_line do |o|
         case o[0]
         when "c"
         when "p"
         else
          o.split.each do |value|
            if value.to_i == 0
              @clause.push(@temparr)
              @temparr = []
            else
              @temparr.push(value.to_i)
            end
          end
         end
       end
     end
  end

  class Boolean
  include Passat
    attr_accessor :boolean, :input
    def initialize(input)
      @input = input # input customize
      @input.map! do |val|
        if val == 0
          val = false
        elsif val == 1
          val = true
        end
      end
    end

    def convert()
      @boolean = @clause.dup
      @boolean.each_with_index do |a, i|
        a.each_with_index do |b, j|
          if b.to_s[0] == "-"
            @boolean[i][j] = invert(@input[b.abs - 1])
          else
            @boolean[i][j] = @input[b.abs - 1]
          end
        end
      end
    end

    def check()
      @formula = []
      @boolean.each do |val|
          @clause_formula = "(" + val.join("||") + ")"
          @formula.push(@clause_formula)
      end
      return eval(@formula.join("&"))
    end
  end

end
