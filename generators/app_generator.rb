require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Kuhsaft
  class AppGenerator < Rails::Generators::AppGenerator
    def finish_template
      invoke :custom_generators
      super
    end

    def custom_generators
      # TODO: rvm!
      build :bundle
      build :setup_bdd_env
      build :remove_files_we_dont_need
      build :outro
    end

    def run_bundle
      # Don't run bundle now. First add gems etc.
    end

    protected

    def get_builder_class
      Kuhsaft::AppBuilder
    end
  end
end

