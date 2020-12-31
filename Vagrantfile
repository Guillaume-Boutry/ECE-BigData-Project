# SOURCE https://github.com/hajdaini/k8s-cluster-vagrant-ansible

# ####################################################################
# ################### CONFIGURATION VARIABLES ########################
# ####################################################################
IMAGE_NAME = "generic/ubuntu1804"   # Image to use 
#IMAGE_NAME = "bento/ubuntu-18.04"   # Overwrite for virtualbox
MASTER_NAME="master"                # Master node name
WORKER_NBR = 0                      # Number of workers node
NODE_NETWORK_BASE = "192.168.80"    # First three octets of the IP address that will be assign to all type of nodes


# ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    # RAM and CPU config
    # Libvirt peut être changé par VirtualBox
    config.vm.provider :libvirt do |v|
        v.cpus = 6
        v.memory = 8192
    end

    # Si windows install le plugin vagrant-guest_ansible -> vagrant plugin install vagrant-guest_ansible
    provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible


    # Master node config
    config.vm.define MASTER_NAME do |master|
        # Hostname and network config
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "#{NODE_NETWORK_BASE}.10"
        master.vm.hostname = MASTER_NAME
        
        master.vm.network "forwarded_port", guest: 31080, host: 80

        # Ansible role setting
        #master.vm.provision provisioner do |ansible|
            
            # Ansbile role that will be launched
            #ansible.playbook = "roles/main.yml"

            # Groups in Ansible inventory
            #ansible.groups = {
            #    "masters" => ["#{MASTER_NAME}"],
            #    "workers" => ["worker-[1:#{WORKER_NBR}]"]
            #}

            # Overload Ansible variables
        #    ansible.extra_vars = {
        #        node_ip: "#{NODE_NETWORK_BASE}.10",
        #        node_name: "master"
        #    }
        #end

        config.vm.provision "shell" do |s|
            ssh_pub_key = File.readlines(".ssh/key.pub").first.strip
            s.inline = <<-SHELL
              echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            SHELL
        end

    end

    # Worker node config
    (1..WORKER_NBR).each do |i|
        config.vm.define "worker-#{i}" do |worker|

            # Hostname and network config
            worker.vm.box = IMAGE_NAME
            worker.vm.network "private_network", ip: "#{NODE_NETWORK_BASE}.#{i + 10}"
            worker.vm.hostname = "worker-#{i}"

            # Ansible role setting
            #worker.vm.provision provisioner do |ansible|

                # Ansbile role that will be launched
                #ansible.playbook = "roles/main.yml"

                # Groups in Ansible inventory
                #ansible.groups = {
                #    "masters" => ["#{MASTER_NAME}"],
                #    "workers" => ["worker-[1:#{WORKER_NBR}]"]
                #}

                # Overload Ansible variables
            #    ansible.extra_vars = {
            #        node_ip: "#{NODE_NETWORK_BASE}.#{i + 10}"
            #    }
            #end
            config.vm.provision "shell" do |s|
                ssh_pub_key = File.readlines(".ssh/key.pub").first.strip
                s.inline = <<-SHELL
                  echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
                SHELL
            end
        end
    end
end
