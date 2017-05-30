require "passat/version"

module Passat

  def conv(i)
    if i == 1
      return 0
    else
      return 1
    end
  end

  class FromFile
    include Passat
    attr_accessor :x

    def initialize(file)
      @eq = []
      begin
        File.open(file) do |f|
          f.each_line do |o|
            @initial = "("
            case o[0]
            when "c"
              puts "Comment"
            when "p"
              i = o.split()
              @x = Array.new(i[2].to_i)
              @y = i[3].to_i
            else
              o.split().each do |v|
                if v.to_s[0] == "-"
                  block = "conv(@x[" + (v.to_i + 1).abs.to_s + "])"
                  @initial += (block + "|")
                elsif v.to_s == "0"
                  @initial.slice!(@initial.rindex("|"))
                else
                  block = "@x[" + (v.to_i - 1).to_s + "]"
                  @initial += (block + "|")
                end
              end
              @initial += ")"
              @eq.push(@initial)
            end
          end
        end

      end
    end

    def solve(solution)
      @x = solution
      return eval(@eq.join("&"))
    end

  end


end
