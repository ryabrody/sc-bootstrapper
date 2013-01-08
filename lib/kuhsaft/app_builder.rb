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
      setup_rspec
      setup_cucumber
      setup_guard
      setup_mail_interceptor
    end

    def setup_database
      # TODO: implement
      # use pg db sample
      # rake db:create
      # rake db:migrate
    end

    def configure_generators
      # TODO: implement
      # use haml, sass, rspec
    end

    def remove_files_we_dont_need
      remove_rails_logo_image
      remove_public_index
    end

    def outro
      say 'Application is ready!'
    end

    private

    def setup_mail_interceptor
      template 'mail_interceptor.rb', 'lib/mail_interceptor.rb'
      template 'setup_mail.rb', 'config/initializers/setup_mail.rb'
    end

    def setup_rspec
      generate 'rspec:install'
    end

    def setup_cucumber
      generate 'cucumber:install'
    end

    def setup_guard
      template 'Guardfile'
    end

    def remove_public_index
      remove_file 'public/index.html'
    end

    def remove_rails_logo_image
      remove_file 'app/assets/images/rails.png'
    end
  end
end

