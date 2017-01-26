#!/usr/bin/env bash
rm -f ../packages/app.latest.tar.gz > /dev/null 2>&1
mkdir -p ../packages/app/builds/
mkdir -p ../packages/config/builds/

# Build App Code ---------------------------------------------------------------

rm -rf node_modules
npm install


# Package App Code -------------------------------------------------------------

tar czf ../packages/app/app.latest.tar.gz \
   --exclude='*.sh' --exclude='config/*.yaml' \
   .
cp \
   ../packages/app/app.latest.tar.gz \
   ../packages/app/builds/app.$(date +"%Y-%m-%d--%H-%M-%S").tar.gz


# Package Config ---------------------------------------------------------------

envs=('development' 'test' 'staging' 'production')

for env in "${envs[@]}"
do
   :
   tar czf ../packages/config/config.${env}.latest.tar.gz \
     config/default.yaml config/${env}.yaml
   cp \
      ../packages/config/config.${env}.latest.tar.gz \
      ../packages/config/builds/config.${env}.$(date +"%Y-%m-%d--%H-%M-%S").tar.gz
done
