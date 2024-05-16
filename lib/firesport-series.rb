# frozen_string_literal: true

module Firesport
  module Series
    module Person; end
    module Team; end

    class Handler
      def self.class_for(name, type)
        class_name = "Firesport::Series::#{type == :person ? 'Person' : 'Team'}::#{name}"
        begin
          "::#{class_name}".constantize
        rescue NameError => e
          return if e.message.start_with?("uninitialized constant #{class_name}")

          raise e
        end
      end

      def self.person_class_for(name)
        class_for(name, :person)
      end

      def self.team_class_for(name)
        class_for(name, :team)
      end

      def self.team_class_names
        Firesport::Series::Team::Base.descendants.map(&:name).map(&:demodulize)
      end

      def self.person_class_names
        Firesport::Series::Person::Base.descendants.map(&:name).map(&:demodulize)
      end

      def self.class_names
        (team_class_names + person_class_names).uniq.sort
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
require 'firesport/series/team/la_cup.rb'
require 'firesport/series/team/brandenburg_cup.rb'
require 'firesport/series/team/d_cup.rb'
require 'firesport/series/team/kp_bautzen.rb'
require 'firesport/series/team/mv_cup.rb'
require 'firesport/series/team/sa_pokal.rb'
require 'firesport/series/team/sachsen_cup.rb'
require 'firesport/series/team/sachsen_steiger_cup.rb'
require 'firesport/series/team/tgl_cup.rb'
require 'firesport/series/team/thueringen_cup.rb'
require 'firesport/series/team/vier_bahnen_pokal.rb'
require 'firesport/series/team/vier_bahnen_pokal2019.rb'
