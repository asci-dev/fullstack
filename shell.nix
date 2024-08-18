let
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) {
    config = {
      allowUnfree = true;
    };
  };
in

pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    docker
    docker-compose
    postgresql_14_jit
    python3
    python312Packages.psycopg
    virtualenv
    zed-editor
  ];

  # Read and export variables from .env file
  shellHook = ''
    # Activate virtualenv
    source venv/bin/activate

    # Export environment variables from .env file
    if [ -f .env ]; then
      echo "Loading environment variables from .env file..."
      export $(grep -v '^#' .env | xargs)
    else
      echo "Warning: .env file not found. Environment variables may not be set."
    fi

    echo "Starting Docker Compose..."
    docker-compose up -d  # Start Docker Compose in detached mode

    # Trap exit to bring down Docker Compose
    trap 'echo "Stopping Docker Compose..."; docker-compose down; deactivate; echo "Docker Compose stopped."' EXIT

    echo "Environment setup complete!"
  '';
}
