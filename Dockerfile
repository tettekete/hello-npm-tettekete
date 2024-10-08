FROM node:latest
USER root
WORKDIR /app

RUN <<__EOF__
cat << __DOC__ > /usr/local/bin/entrypoint.sh
#!/bin/bash
set -e
#set -x

npm run build
npm pack

tarball="\$(ls -1 *.tgz | head -1)"

echo "tarball: \${tarball}"

if [[ -z "\$tarball" ]]
then
	exit 1
fi

npm install -g "\${tarball}"

if [[ -n "\$@" ]]
then
	echo "> \$@"
	\$@
fi
__DOC__
__EOF__

ENTRYPOINT ["/bin/bash","/usr/local/bin/entrypoint.sh"]

