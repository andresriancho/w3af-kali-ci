#!/usr/bin/env bash

set -x
set -e

cd w3af-kali/

# Define the version
VERSION=`python get-latest-w3af-tag.py`

# This downloads the updated tagged version from your git repo
uscan --force-download --verbose

git -d upstream/${VERSION}
~/w3af-kali-ci/utils/git-import-orig ../${VERSION}.tar.gz --upstream-version=${VERSION}

# Add the new release changelog entry, pointing to the right version
# so dpkg-buildpackage can find the tgz
cat <<EOF >> debian/changelog.entry
w3af (${VERSION}-0kali1) kali; urgency=medium

  * Automated test

 -- Andres Riancho <andres@tagcube.io>  Wed, 22 Apr 2015 10:16:46 -0300

EOF

(cat debian/changelog.entry; cat debian/changelog) > debian/changelog
rm -rf debian/changelog.entry

git commit debian/changelog -m ${VERSION}

dpkg-checkbuilddeps

# -uc and -us disable PGP signing (which we don't need, Kali devs will
# sign the final package)
#
# --git-ignore-new ignores any changes to the local directory
#
# -b builds binary only package
~/w3af-kali-ci/utils/git-buildpackage --git-ignore-new -b -uc -us
