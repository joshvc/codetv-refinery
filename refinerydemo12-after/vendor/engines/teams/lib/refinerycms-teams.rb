require 'refinerycms-base'

module Refinery
  module Teams

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "teams"
          plugin.pathname = root
          plugin.activity = {
            :class => Team,
            :title => 'name'
          }
        end
      end
    end
  end
end

require File.expand_path('../refinerycms-drivers', __FILE__)