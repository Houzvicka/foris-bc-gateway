ADDRESS := $(if ${ADDRESS},${ADDRESS},192.168.1.1)
PLUGIN_NAME := $(if ${PLUGIN_NAME},${PLUGIN_NAME},"BC_Dashboard")

.PHONY: copy reload

all: copy reload
	@echo "PUSHED current source of ${PLUGIN_NAME} to ${ADDRESS}."


reload:
	ssh ${ADDRESS} /etc/init.d/lighttpd restart

copy:
	rsync -avzz src/ ${ADDRESS}:/usr/share/foris/plugins/${PLUGIN_NAME}
