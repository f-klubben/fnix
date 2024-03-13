set -e

cd $(dirname $0)
nixos-rebuild build-vm --flake .#fklub-test
result/bin/run-fklub-vm
