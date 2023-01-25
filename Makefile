.PHONY: install
install:
	sudo install -o root -g root -m 755 sway-service.sh /usr/local/bin/sway-service
	install -D waybar/* -t /home/${USER}/.config/waybar/
	install -D swaylock/* -t /home/${USER}/.config/swaylock/
	install -D swayidle/* -t /home/${USER}/.config/swayidle/
	install -D i3status-rust/* -t /home/${USER}/.config/i3status-rust/
	install -D kanshi/* -t /home/${USER}/.config/kanshi/
	install -D sway/* -t /home/${USER}/.config/sway/
	install -D systemd/user/* -t /home/${USER}/.config/systemd/user/
	install -D environment.d/* -t /home/${USER}/.config/environment.d/
	find systemd/user/ -type f -exec sh -c 'systemctl --user enable $$(basename -s .service {})' \;
	systemctl --user disable swaylock
