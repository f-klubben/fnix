set -e

cd $(dirname $0)
nixos-rebuild build-vm --flake .#fklub
result/bin/run-fklub-vm
