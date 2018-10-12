#!/bin/sh

# iptables -F
# iptables -t nat -F
# iptables -X


iptables \
	-t nat \
	-A POSTROUTING \
	-j MASQUERADE

# Check if iptable fail 
if [ $? -ne 0 ]; then
	echo "Failed executing iptable command. Maybe you execute this container without `NET_ADMIN` capabilitie?"
	exit 1
fi
# Loop over every param into $REROUTER delimited by ',' character
for i in ${REROUTER//,/ }
do
	# Split every ReRoute by first ':' character
	IFS=':' read -r in_port dest <<-EOF
			$(echo $i)
		EOF

	iptables \
		-t nat \
		-A PREROUTING \
		-p tcp \
		--dport $in_port \
		-j DNAT \
		--to-destination $dest

	# Check if iptable fail applying desired rule
	if [ $? -eq 0 ]; then
		echo "ReRouted port '$in_port' to '$dest'."
	else
		echo
		echo
		echo "!!! FAILED !!! ReRouting port '$in_port' to '$dest'."
		echo
	fi
done


# Exec desired command
exec "$@"
