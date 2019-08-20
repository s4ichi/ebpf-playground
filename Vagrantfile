Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.ssh.forward_agent = true
  config.vm.provision 'shell', path: 'bootstrap.sh', privileged: false
  config.vm.network "private_network", ip: "192.168.33.13"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
end
