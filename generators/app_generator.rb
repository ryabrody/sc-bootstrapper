require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Kuhsaft
  class AppGenerator < Rails::Generators::AppGenerator
    def finish_template
      invoke :custom_generators
      super
    end

    def custom_generators
      # TODO: rvm! (generate rvmrc from currently used ruby/gemset)
      build :remove_files_we_dont_need
      build :bundle
      build :setup_bdd_env
      build :setup_database
      build :configure_generators
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

