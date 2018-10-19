#! /bin/bash

#
# install gitolite
#

set -eu

key="gitolite_admin.pub"
keypath="./admin_key/${key}"
gitdir="/home/git"

useradd -m git

while getopts "k:" OPT ; do
  case $OPT in
    k) keypath=${OPTARG}
        key=${keypath##*/}
        ;;
  esac
done

if [ ! -f ${keypath} ] ; then
  echo "${keypath} is not found."
  exit 1
fi

cp ${keypath} ${gitdir}
chown git:git ${gitdir}/${key}

sudo su - git <<EOF
git clone git://github.com/sitaramc/gitolite
mkdir -p ${gitdir}/bin
${gitdir}/gitolite/install -to ${gitdir}/bin
${gitdir}/bin/gitolite setup -pk ${key}
echo
echo 'PATH=\"\$HOME/bin:\$PATH\"' >> ${gitdir}/.bashrc
source ${gitdir}/.bashrc
EOF

exit 0
