default: modify_config_file

check_directories:
	sh -c "tripwire --check | grep Filename > no-directory.txt"
	cat no-directory.txt

modify_config_file:
	cp ./twpol.txt /etc/tripwire/twpol.txt
	twadmin -m P /etc/tripwire/twpol.txt

reload_config_file:
	twadmin -m P /etc/tripwire/twpol.txt
init:
	tripwire --init

check:
	tripwire --check
