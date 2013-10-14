git clone --branch 7.x-3.x http://git.drupal.org/project/provision.git
FILENAME="provision-7.x-2.$(date +%Y%m%d).tar.gz"
tar caf ${FILENAME} provision --exclude .git*
mv ${FILENAME} /usr/portage/distfiles

echo "Created distfile for ${FILENAME}"
