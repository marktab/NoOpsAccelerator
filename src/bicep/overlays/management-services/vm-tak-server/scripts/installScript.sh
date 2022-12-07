#!/bin/bash
echo "Running script to begin the install process for TAK Server, it will take a while so please be patient."

# source global_vars.sh add var here since global_var can not be read from vm extention 
project="TakImage"
RPM_TAKsource="https://noopsblobstorage.blob.core.usgovcloudapi.net/anoatak/takserver-4.7-RELEASE20.noarch.rpm?sp=r&st=2022-12-07T00:51:22Z&se=2022-12-07T08:51:22Z&spr=https&sv=2021-06-08&sr=b&sig=aQB1tSL2BPLqeKz%2BKysdovJdQ8BpmIjOb9nN3vdnnqw%3D"
RPM_DBsource="https://noopsblobstorage.blob.core.usgovcloudapi.net/anoatak/postgresql14-14.6-1PGDG.rhel7.x86_64.rpm?sp=r&st=2022-12-07T00:53:11Z&se=2022-12-07T08:53:11Z&spr=https&sv=2021-06-08&sr=b&sig=TQlHvMdyzbP1XBjVM6u%2FwBOJVnkfqoYn%2BC4VA1scWJc%3D"
# new from takimage-main
script_home=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)


echo 'cd ~' >> /root/.bashrc

# Install postgres
# yum -y install postgresql10-server unzip

# curl -fskSL -o "${script_home}/takserver.rpm" "${script_home}"

# [[ ! -f "${script_home}/takserver.rpm" ]] && exit 1

# yum -y localinstall "${script_home}/takserver.rpm" --nogpgcheck
# /bin/bash /opt/tak/db-utils/takserver-setup-db.sh

# grep -m1 'keystorePass' /opt/tak/CoreConfig.example.xml | awk -F\" '{print $6}' > "${script_home}/.jks"
# echo "ftpuser:ftpuser$(seq -s. 4 | tr -d '.')" > "${script_home}/.ftp"
# echo "$(openssl $(openssl / 2>&1 | head -9 | tail -1 | awk '{print $3}') --help 2>&1 | head -1 | awk '{print substr($2,1,4)}' | sed 's/.*/\u&/')4marti$(seq -s. 4 | tr -d '.')"'!' > "${script_home}/.marti"

# sed -i "s/#DBP/$(grep connection /opt/tak/CoreConfig.example.xml | awk -F\" '{print $6}')/g" "${script_home}/CoreConfig.xml"
# sed -i "s/#SS/$(hostname -A | awk -F. '{print $2}')/g" "${script_home}/CoreConfig.xml"
# sed -i "s/#JKS/$(cat ${script_home}/.jks)/g" "${script_home}/CoreConfig.xml"

# rm -f ${script_home}/takserver.rpm
# rm -rf ${script_home}/${project}-main

# yum -y update
###
