#!/bin/busybox sh
# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# /init script for use in factory install shim.
# Note that this script uses the busybox shell (not bash, not dash).

#original: https://chromium.googlesource.com/chromiumos/platform/initramfs/+/refs/heads/main/factory_shim/init

set -x

. /lib/init.sh

setup_environment() {
  initialize

  # Install additional utility programs.
  /bin/busybox --install /bin || true
}

main() {
  setup_environment
  # In case an error is not handled by bootstrapping, stop here
  # so that an operator can see installation stop.
  exec bootstrap.sh || sleep 1d
}

main "$@"
exit 1