#!/bin/bash
deluser lutim
addgroup --gid $GROUPID lutim
adduser --system --shell /bin/sh --no-create-home --ingroup lutim --uid $USERID lutim
SECRET=`cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 20 | head -n 1`
sed -i -e 's/<contact>/'$CONTACT'/g' \
       -e 's/<secret>/'$SECRET'/g' \
       -e 's/<max_file_size>/'$MAX_FILE_SIZE'/g' \
       -e 's|<webroot>|'$WEBROOT'|g' /config/lutim.conf
mv /lutim/lutim.conf /config/lutim.conf.bkp
cp /config/lutim.conf /lutim/lutim.conf
chown -R lutim:lutim /lutim /data /config
cd /lutim
su lutim -c "carton exec hypnotoad -f /lutim/script/lutim"
