module Kuhsaft
  class AppBuilder < Rails::AppBuilder
    def readme
      config = {
        app_name:         app_name,
        maintainer:       ask('Who is the maintainer of the App?'),
        consultant:       ask('Who is the primary consultant for the App?')
      }

      template 'README.md.erb', 'README.md', config
    end

    def gemfile
      template 'Gemfile.erb', 'Gemfile'
    end

    def bundle
      bundle_command 'install'
      bundle_command 'show rspec'
    end

    def setup_bdd_env
      generate 'rspec:install'
      generate 'guard:init rspec'

      generate 'cucumber:install'
      generate 'guard:init cucumber'

      # TODO: apply templates:
      # or is it done by installer tasks?
      #   - spec helper
      #   - folders
      #   - guardfile
      #   - rakefile
    end

    def remove_files_we_dont_need
      remove_rails_logo_image
      remove_public_index
    end

    def outro
      say 'Application is ready!'
    end

    private

    def remove_public_index
      remove_file 'public/index.html'
    end

    def remove_rails_logo_image
      remove_file 'app/assets/images/rails.png'
    end
  end
end

