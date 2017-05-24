module Firesport
  module Series
    module Person ; end
    module Team ; end

    class Handler
      def self.class_for(name, type)
        class_name = "Firesport::Series::#{type == :person ? 'Person' : 'Team'}::#{name}"
        begin
          "::#{class_name}".constantize
        rescue NameError => error
          if error.message == "uninitialized constant #{class_name}"
            nil
          else
            raise error
          end
        end
      end

      def self.person_class_for(name)
        class_for(name, :person)
      end

      def self.team_class_for(name)
        class_for(name, :team)
      end
    end
  end
end

require 'firesport/series/person/base.rb'
require 'firesport/series/person/d_cup.rb'
require 'firesport/series/person/extra_liga.rb'
require 'firesport/series/person/mv_cup.rb'
require 'firesport/series/person/mv_hindernis_cup.rb'
require 'firesport/series/person/mv_steiger_cup.rb'
require 'firesport/series/person/sachsen_steiger_cup.rb'

require 'firesport/series/team/base.rb'
require 'firesport/series/team/brandenburg_cup.rb'
require 'firesport/series/team/d_cup.rb'
require 'firesport/series/team/la_cup.rb'
require 'firesport/series/team/mv_cup.rb'
require 'firesport/series/team/sachsen_cup.rb'
require 'firesport/series/team/sachsen_steiger_cup.rb'
require 'firesport/series/team/thueringen_cup.rb'