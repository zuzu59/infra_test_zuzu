# Le Vagrantfile pour l'infra de tests pour les étudiants de la SDF
# zf151029.1912,151117.1639,160812.1403,161028.1422,161115.1558,170305.1113

#Script Vagrant qui permet de provisionner x machines desktop 32/64 et y machines serveur 32/64 avec Linux Ubuntu
#desktop(x), machines en mode graphique avec xfce
#serveur(y), machines en mode console

#Usage:
#pour créer ou allumer: vagrant up zf-DSK32-30221, ou vagrant up zf-DSK32-30221 zf-SRV32-32221, ou vagrant up, démarre toutes les machines !
#pour se connecter en ssh: vagrant ssh...même chose que pour 'up'
#pour suspendre: vagrant suspend...même chose que pour 'up'
#pour réveiller: vagrant resume...même chose que pour 'up'
#pour détruire: vagrant destroy...même chose que pour 'up'
#pour connaitre l'état: vagrant status

#Login: vagrant
#Password: vagrant

#Login: ubuntu
#Password: tototutu


#config pour l'infra
$vm_name_infra			= "zf-"

#config pour machines DSK32
$vm_box_desktopA 		= "ubuntu/xenial32"
$vm_name_desktopA 		= $vm_name_infra + "DSK32-"
$vm_gui_desktopA		= true
$num_instances_desktopA	= 4
$vm_memory_desktopA		= 1000
$ports_range_desktopA	= 30

#config pour machines DSK64
$vm_box_desktopB 		= "ubuntu/xenial64"
$vm_name_desktopB 		= $vm_name_infra + "DSK64-"
$vm_gui_desktopB		= true
$num_instances_desktopB	= 4
$vm_memory_desktopB		= 1000
$ports_range_desktopB	= 31

#config pour machines SRV32
$vm_box_serverA 		= "ubuntu/xenial32"
$vm_gui_serverA			= false
$vm_name_serverA 		= $vm_name_infra + "SRV32-"
$num_instances_serverA	= 4
$vm_memory_serverA		= 500
$ports_range_serverA	= 32

#config pour machines SRV64
$vm_box_serverB 		= "ubuntu/xenial64"
$vm_gui_serverB			= false
$vm_name_serverB 		= $vm_name_infra + "SRV64-"
$num_instances_serverB	= 4
$vm_memory_serverB		= 500
$ports_range_serverB	= 33







Vagrant.configure(2) do |config|
#    config.vm.provision "shell", inline: "echo Hello"

$prov1 = <<SCRIPT
		echo I am provisioning...

		echo ---------------------change timezone...
		sh -c 'echo Europe/Zurich >/etc/timezone && dpkg-reconfigure -f noninteractive tzdata'

		echo ---------------------add ubuntu dans le group vagrant...
		addgroup ubuntu vagrant
		
		echo ---------------------change keyboard...
		sed -i.bak 's/^XKBMODEL=.*/XKBMODEL="macintosh"/' /etc/default/keyboard
		sed -i.bak 's/^XKBLAYOUT=.*/XKBLAYOUT="ch"/' /etc/default/keyboard
		sed -i.bak 's/^XKBVARIANT=.*/XKBVARIANT="fr"/' /etc/default/keyboard
		sed -i.bak 's/^XKBOPTIONS=.*/XKBOPTIONS="lv3:alt_switch"/' /etc/default/keyboard
		setupcon --force

		echo ---------------------change password Vagrant et Ubuntu user
		usermod --password '$6$rT3MgCSe$yNURL1FYaaJgDKR5S7FIMoUiRC.Krooi54bHNHdpYZwWNtWy/9wrGOF8M3NIZQMNH5/IU0zyzQEq2M4KbocZm.' vagrant
		usermod --password '$6$r4hbGMiV$JvEwB/BnabQsSooWEr89OfSXP.Jv8wHpF5mykiKYLxWQLhzuGp7JmqgWfpGKSIm5pS1dhrdadoNWpS5YvZ5l/0' ubuntu

		echo ---------------------copie des certificats SSH
		chmod +x /vagrant/ssh-copy.sh
		/vagrant/ssh-copy.sh

		echo ---------------------install le swap file
		chmod +x /vagrant/vagrant-swapfile.sh
		/vagrant/vagrant-swapfile.sh

		echo ---------------------change de sources pour apt-get
		# attention, il faut anti-slasher 2x !
#		sed -i -e "s/http:\\/\\/archive.ubuntu.com/http:\\/\\/mirror.switch.ch\\/ftp\\/mirror\\/ubuntu/g" /etc/apt/sources.list
		sed -i -e "s/http:\\/\\/archive.ubuntu.com/http:\\/\\/ubuntu.ethz.ch/g" /etc/apt/sources.list

		echo ---------------------update and upgrade
		apt-get -y update
		# apt-get -y upgrade

		echo ---------------------remove chef and puppet...
		dpkg -P chef chef-zero puppet puppet-common

		echo ---------------------install xfce4 minimum
		apt-get -y install xfce4 xdm
		
		#corrige le problème du TAB quand on est avec x2go
		sudo sed -i -e "s/&lt;Super&gt;Tab//g" /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

		echo ---------------------patch miscfiles
		sudo apt-get -y remove miscfiles
		sudo apt-get -y autoremove

		echo ---------------------setting MarkDown to PDF
		echo "sudo apt-get install pandoc texlive-latex3" > /home/ubuntu/zmd2pdf.sh
		chmod +x /home/ubuntu/zmd2pdf.sh

		echo ---------------------install x2go remote terminal
		apt-get -y install software-properties-common
		add-apt-repository ppa:x2go/stable -y
		apt-get update
		apt-get -y install x2goserver x2goserver-xsession

		echo ---------------------install and configure zDynDNS...
		chmod +x /vagrant/install_zdyndns.sh
		/vagrant/install_zdyndns.sh

		echo ---------------------clean...
		apt-get -y autoremove
		apt-get -y clean
		apt-get -y autoclean

		echo ---------------------finished...
		echo ---------------------reboot...
		echo ---------------------ATTENTION, IL FAUT FAIRE UN VAGRANT RELOAD DE LA MACHINE POUR LA REDEMARRER !
		echo -
 		echo ---------------------Et après il faudra faire DEPUIS la machine: /vagrant/install_desktop_utils.sh pour terminer la config

SCRIPT



$prov2 = <<SCRIPT
		echo ---------------------I am provisioning...

		echo ---------------------change timezone...
		sh -c 'echo Europe/Zurich >/etc/timezone && dpkg-reconfigure -f noninteractive tzdata'

		echo ---------------------add ubuntu dans le group vagrant...
		addgroup ubuntu vagrant
		
		echo ---------------------change keyboard...
		sed -i.bak 's/^XKBMODEL=.*/XKBMODEL="macintosh"/' /etc/default/keyboard
		sed -i.bak 's/^XKBLAYOUT=.*/XKBLAYOUT="ch"/' /etc/default/keyboard
		sed -i.bak 's/^XKBVARIANT=.*/XKBVARIANT="fr"/' /etc/default/keyboard
		sed -i.bak 's/^XKBOPTIONS=.*/XKBOPTIONS="lv3:alt_switch"/' /etc/default/keyboard
		setupcon --force

		echo ---------------------change password Vagrant et Ubuntu user
		usermod --password '$6$rT3MgCSe$yNURL1FYaaJgDKR5S7FIMoUiRC.Krooi54bHNHdpYZwWNtWy/9wrGOF8M3NIZQMNH5/IU0zyzQEq2M4KbocZm.' vagrant
		usermod --password '$6$r4hbGMiV$JvEwB/BnabQsSooWEr89OfSXP.Jv8wHpF5mykiKYLxWQLhzuGp7JmqgWfpGKSIm5pS1dhrdadoNWpS5YvZ5l/0' ubuntu

		echo ---------------------copie des certificats SSH
		chmod +x /vagrant/ssh-copy.sh
		/vagrant/ssh-copy.sh
		
		echo ---------------------install le swap file
		chmod +x /vagrant/vagrant-swapfile.sh
		/vagrant/vagrant-swapfile.sh
				
		echo ---------------------change de sources pour apt-get
		# attention, il faut anti-slasher 2x !
#		sed -i -e "s/http:\\/\\/archive.ubuntu.com/http:\\/\\/mirror.switch.ch\\/ftp\\/mirror\\/ubuntu/g" /etc/apt/sources.list
		sed -i -e "s/http:\\/\\/archive.ubuntu.com/http:\\/\\/ubuntu.ethz.ch/g" /etc/apt/sources.list

		echo ---------------------update and upgrade
		apt-get -y update
		# apt-get -y upgrade

		# echo ---------------------remove chef and puppet
		# dpkg -P chef chef-zero puppet puppet-common

		echo ---------------------install utils
		apt-get -y install htop git

		echo ---------------------install and configure Collectd...
		chmod +x /vagrant/install_collectd.sh
		/vagrant/install_collectd.sh

		echo ---------------------install and configure zDynDNS...
		chmod +x /vagrant/install_zdyndns.sh
		/vagrant/install_zdyndns.sh

		echo ---------------------clean...
		apt-get -y autoremove
		apt-get -y clean
		apt-get -y autoclean

		echo ---------------------finished...
SCRIPT







	(1..$num_instances_desktopA).each do |i|
		vm_name = $vm_name_desktopA + "#{$ports_range_desktopA}22#{i}"
		config.vm.define vm_name do |zconfig|
			zconfig.vm.box = $vm_box_desktopA
			zconfig.vm.provider "virtualbox" do |vb|
				 vb.gui = $vm_gui_desktopA
				 vb.memory = $vm_memory_desktopA
			end
			zconfig.vm.hostname = vm_name
			# zconfig.vm.network "public_network"
			# zconfig.vm.network "private_network", ip: "192.168.41.12"
			zconfig.vm.network "forwarded_port", guest: 22,		host: 	"#{$ports_range_desktopA}22#{i}"
			zconfig.vm.network "forwarded_port", guest: 80,		host: 	"#{$ports_range_desktopA}80#{i}"
			zconfig.vm.network "forwarded_port", guest: 443,	host: 	"#{$ports_range_desktopA}44#{i}"
			zconfig.vm.network "forwarded_port", guest: 5900, 	host: 	"#{$ports_range_desktopA}59#{i}"
			zconfig.vm.network "forwarded_port", guest: 3000,	host: 	"#{$ports_range_desktopA}30#{i}"
			zconfig.vm.network "forwarded_port", guest: 3306,	host: 	"#{$ports_range_desktopA}33#{i}"
			zconfig.vm.provision "shell", inline: $prov1
		end
	end



	(1..$num_instances_desktopB).each do |i|
		vm_name = $vm_name_desktopB + "#{$ports_range_desktopB}22#{i}"
		config.vm.define vm_name do |zconfig|
			zconfig.vm.box = $vm_box_desktopB
			zconfig.vm.provider "virtualbox" do |vb|
				 vb.gui = $vm_gui_desktopB
				 vb.memory = $vm_memory_desktopB
			end
			zconfig.vm.hostname = vm_name
			# zconfig.vm.network "public_network"
			# zconfig.vm.network "private_network", ip: "192.168.41.12"
			zconfig.vm.network "forwarded_port", guest: 22,		host: 	"#{$ports_range_desktopB}22#{i}"
			zconfig.vm.network "forwarded_port", guest: 80,		host: 	"#{$ports_range_desktopB}80#{i}"
			zconfig.vm.network "forwarded_port", guest: 443,	host: 	"#{$ports_range_desktopB}44#{i}"
			zconfig.vm.network "forwarded_port", guest: 5900, 	host: 	"#{$ports_range_desktopB}59#{i}"
			zconfig.vm.network "forwarded_port", guest: 3000,	host: 	"#{$ports_range_desktopB}30#{i}"
			zconfig.vm.network "forwarded_port", guest: 3306,	host: 	"#{$ports_range_desktopB}33#{i}"
			zconfig.vm.provision "shell", inline: $prov1
		end
	end



	(1..$num_instances_serverA).each do |i|
#		vm_name = $vm_name_serverA + i.to_s
		vm_name = $vm_name_serverA + "#{$ports_range_serverA}22#{i}"
		
		config.vm.define vm_name do |zconfig|
			zconfig.vm.box = $vm_box_serverA
			zconfig.vm.provider "virtualbox" do |vb|
				 vb.gui = $vm_gui_serverA
				 vb.memory = $vm_memory_serverA
			end
			zconfig.vm.hostname = vm_name
			# zconfig.vm.network "public_network"
			# zconfig.vm.network "private_network", ip: "192.168.41.12"
			zconfig.vm.network "forwarded_port", guest: 22,		host: 	"#{$ports_range_serverA}22#{i}"
			zconfig.vm.network "forwarded_port", guest: 80,		host: 	"#{$ports_range_serverA}80#{i}"
			zconfig.vm.network "forwarded_port", guest: 443,	host: 	"#{$ports_range_serverA}44#{i}"
			zconfig.vm.network "forwarded_port", guest: 5900, 	host: 	"#{$ports_range_serverA}59#{i}"
			zconfig.vm.network "forwarded_port", guest: 3000,	host: 	"#{$ports_range_serverA}30#{i}"
			zconfig.vm.network "forwarded_port", guest: 3306,	host: 	"#{$ports_range_serverA}33#{i}"
			zconfig.vm.provision "shell", inline: $prov2
		end
	end


	
	(1..$num_instances_serverB).each do |i|
		vm_name = $vm_name_serverB + "#{$ports_range_serverB}22#{i}"
		config.vm.define vm_name do |zconfig|
			zconfig.vm.box = $vm_box_serverB
			zconfig.vm.provider "virtualbox" do |vb|
				 vb.gui = $vm_gui_serverB
				 vb.memory = $vm_memory_serverB
			end
			zconfig.vm.hostname = vm_name
			# zconfig.vm.network "public_network"
			# zconfig.vm.network "private_network", ip: "192.168.41.12"
			zconfig.vm.network "forwarded_port", guest: 22,		host: 	"#{$ports_range_serverB}22#{i}"
			zconfig.vm.network "forwarded_port", guest: 80,		host: 	"#{$ports_range_serverB}80#{i}"
			zconfig.vm.network "forwarded_port", guest: 443,	host: 	"#{$ports_range_serverB}44#{i}"
			zconfig.vm.network "forwarded_port", guest: 5900, 	host: 	"#{$ports_range_serverB}59#{i}"
			zconfig.vm.network "forwarded_port", guest: 3000,	host: 	"#{$ports_range_serverB}30#{i}"
			zconfig.vm.network "forwarded_port", guest: 3306,	host: 	"#{$ports_range_serverB}33#{i}"
			zconfig.vm.provision "shell", inline: $prov2
		end
	end
		    
 
end


