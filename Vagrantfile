# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :forwarded_port, guest: 80, host: 8081
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder "", "/vagrant", disabled: true
  config.vm.synced_folder "", "/var/src"
end

module VagrantPlugins
    module PM2

        class Plugin < Vagrant.plugin(2)
            name 'vagrant-pm2'
            description ''
            command :appstart do Start end
            command :apprestart do Restart end
            command :appstop do Stop end
            command :applist do List end
            command :applog do Log end
        end

        class Start < Vagrant.plugin(2, :command)
          def execute
            command = 'pm2 start /var/src/app/app.js -i max'
            with_target_vms(nil, :single_target => true) do |vm|
              vm.action(:ssh_run, :ssh_run_command => command)
              return 0
            end
          end
        end

        class Restart < Vagrant.plugin(2, :command)
          def execute
            command = 'pm2 restart all'
            with_target_vms(nil, :single_target => true) do |vm|
              vm.action(:ssh_run, :ssh_run_command => command)
              return 0
            end
          end
        end

        class Stop < Vagrant.plugin(2, :command)
          def execute
            command = 'pm2 stop all'
            with_target_vms(nil, :single_target => true) do |vm|
              vm.action(:ssh_run, :ssh_run_command => command)
              return 0
            end
          end
        end

        class List < Vagrant.plugin(2, :command)
          def execute
            command = 'pm2 list'
            with_target_vms(nil, :single_target => true) do |vm|
              vm.action(:ssh_run, :ssh_run_command => command)
              return 0
            end
          end
        end

        class Log < Vagrant.plugin(2, :command)
          def execute
            command = 'pm2 logs'
            with_target_vms(nil, :single_target => true) do |vm|
              vm.action(:ssh_run, :ssh_run_command => command)
              return 0
            end
          end
        end
    end
end