module VagrantPlugins
  module Ventriloquist
    module Cap
      module Debian
        module PgInstallHeaders
          def self.pg_install_headers(machine)
            machine.communicate.tap do |comm|
              if ! comm.test('dpkg -l | grep libpq-dev')
                machine.env.ui.info('Installing PostgreSQL headers')
                machine.guest.capability(:install_packages, 'libpq-dev', silent: true)
              end
            end
          end
        end
      end
    end
  end
end
