Vagrant.configure("2") do |config|

  config.vm.define "Db01" do |db01|
    db01.vm.box = "ubuntu/focal64"
    db01.vm.hostname = "Databaseserver01"
    db01.vm.network "private_network", ip: "192.168.56.30"

    db01.vm.provider "virtualbox" do |v|
      v.name = "Databaseserver01"
    end
    db01.ssh.insert_key = false
    db01.ssh.private_key_path = [ '~/.ssh/id_rsa', '~/.vagrant.d/insecure_private_key' ]
    db01.ssh.forward_agent = true
    db01.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("/home/student/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
    echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
    end

    db01.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbookdatabaseserver.yml"
        ansible.inventory_path = "/media/student/Data/ansible/inventory.yml"
    end
  end

  config.vm.define "Web01" do |web01|
    web01.vm.box = "ubuntu/jammy64"
    web01.vm.hostname = "Webserver01"
    web01.vm.network "private_network", ip: "192.168.56.10"

    web01.vm.provider "virtualbox" do |v|
      v.name = "Webserver01"
    end
    web01.ssh.insert_key = false
    web01.ssh.private_key_path = [ '~/.ssh/id_rsa', '~/.vagrant.d/insecure_private_key' ]
    web01.ssh.forward_agent = true   
    web01.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("/home/student/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
    echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
    end
   
    web01.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbookwebserver.yml"
	ansible.inventory_path = "/media/student/Data/ansible/inventory.yml"
    end
  end

  config.vm.define "Web02" do |web02|
    web02.vm.box = "ubuntu/jammy64"
    web02.vm.hostname = "Webserver02"
    web02.vm.network "private_network", ip: "192.168.56.11"

    web02.vm.provider "virtualbox" do |v|
      v.name = "Webserver02"
    end
    web02.ssh.insert_key = false
    web02.ssh.private_key_path = [ '~/.ssh/id_rsa', '~/.vagrant.d/insecure_private_key' ]
    web02.ssh.forward_agent = true
    web02.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("/home/student/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
    echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
    end
    
    web02.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbookwebserver.yml"
	ansible.inventory_path = "/media/student/Data/ansible/inventory.yml"
    end
  end

  config.vm.define "Lb01" do |lb01|
    lb01.vm.box = "ubuntu/jammy64"
    lb01.vm.hostname = "Loadbalancer01"
    lb01.vm.network "private_network", ip: "192.168.56.20"

    lb01.vm.provider "virtualbox" do |v|
      v.name = "Loadbalancer01"
    end
    lb01.ssh.insert_key = false
    lb01.ssh.private_key_path = [ '~/.ssh/id_rsa', '~/.vagrant.d/insecure_private_key' ]
    lb01.ssh.forward_agent = true
    lb01.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("/home/student/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
    echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
    end



    lb01.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbookloadbalancer.yml"
	ansible.inventory_path = "/media/student/Data/ansible/inventory.yml"
    end
  end
end
