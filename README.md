# fnix
Nix configuration of f-klubben servers

## Structure

### `pkgs`

Contains all of our Nix packages, such as Stregsystemet.

### `modules`

Contains reusable and configurable NixOS modules, such as one for using Stregsystemet. These should not be specific to one system.

### `system`

Contains modules specific to our system. This is where we use the packages in `pkgs` and configure the modules in `modules`.

## Contributing

Open a pull request and let someone review it.
