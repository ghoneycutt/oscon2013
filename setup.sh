#!/bin/bash
#
# Dumb script to prep VM for tutorial. It requires one argument, the path to
# wherever you cloned the OSCON repo
#

# ensure arguments are passed
if [ $# -lt 1 ]; then
    echo "Usage: $0 /path/to/oscon"
    exit 1
fi

OSCON=$1

cat >> /tmp/foo << EOF
reports = store, http
reporturl = http://puppet.oscon.priv:3000/reports/upload
node_terminus = exec
external_nodes = /usr/share/puppet-dashboard/bin/external_node
EOF

cd /usr/share/puppet-dashboard && rake RAILS_ENV=production gems:refresh_specs; cd -; \
for i in puppetdb puppet-dashboard puppet-dashboard-workers httpd; do service $i restart; done
puppet agent -t

echo puppetmaster > /etc/role

cd /etc/puppet/modules && for i in filesdemo motd role; do ln -s ${OSCON}/${i}; done; ls -la; cd -
puppet agent -t
