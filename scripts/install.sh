#!/usr/bin/env bash

set -e

echo "🚀 Installing Nix and dependencies..."
echo "======================================"

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "❌ Cannot detect OS"
    exit 1
fi

# Install Git if not present
if ! command -v git &> /dev/null; then
    echo "📦 Installing Git..."
    case $OS in
        ubuntu|debian)
            sudo apt update && sudo apt install -y git curl
            ;;
        fedora|rhel|centos)
            sudo dnf install -y git curl
            ;;
        arch|manjaro)
            sudo pacman -S --noconfirm git curl
            ;;
        *)
            echo "⚠️  Please install git manually for your OS"
            exit 1
            ;;
    esac
else
    echo "✅ Git already installed"
fi

# Install Nix if not present
if ! command -v nix &> /dev/null; then
    echo "📦 Installing Nix package manager..."
    curl -L https://nixos.org/nix/install | sh -s -- --daemon

    echo "⚙️  Enabling flakes..."
    echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf

    if command -v systemctl &> /dev/null; then
        sudo systemctl restart nix-daemon
    fi

    echo "✅ Nix installed successfully"
    echo "⚠️  Please restart your shell or run: source /etc/profile.d/nix.sh"
else
    echo "✅ Nix already installed"

    # Check if flakes are enabled
    if ! grep -q "experimental-features.*flakes" /etc/nix/nix.conf 2>/dev/null; then
        echo "⚙️  Enabling flakes..."
        echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
        if command -v systemctl &> /dev/null; then
            sudo systemctl restart nix-daemon
        fi
    fi
fi

# Optional: Install Docker
read -p "📦 Install Docker? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if ! command -v docker &> /dev/null; then
        echo "📦 Installing Docker..."
        case $OS in
            ubuntu|debian)
                sudo apt install -y docker.io
                ;;
            fedora|rhel|centos)
                sudo dnf install -y docker
                ;;
            arch|manjaro)
                sudo pacman -S --noconfirm docker
                ;;
            *)
                echo "⚠️  Please install Docker manually for your OS"
                ;;
        esac

        if command -v systemctl &> /dev/null; then
            sudo systemctl start docker
            sudo systemctl enable docker
        fi

        sudo usermod -aG docker $USER
        echo "✅ Docker installed. Please logout/login for group changes"
    else
        echo "✅ Docker already installed"
    fi
fi

# Install direnv and nix-direnv
read -p "📦 Install direnv for automatic environment loading? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📦 Installing direnv and nix-direnv..."
    nix profile add nixpkgs#direnv
    nix profile add nixpkgs#nix-direnv

    # Configure nix-direnv
    mkdir -p ~/.config/direnv
    echo 'source $HOME/.nix-profile/share/nix-direnv/direnvrc' > ~/.config/direnv/direnvrc

    # Add direnv hook to shell config
    SHELL_RC="$HOME/.bashrc"
    if [ -n "$ZSH_VERSION" ]; then
        SHELL_RC="$HOME/.zshrc"
    fi

    if ! grep -q "direnv hook" "$SHELL_RC" 2>/dev/null; then
        echo 'eval "$(direnv hook bash)"' >> "$SHELL_RC"
        echo "✅ Added direnv hook to $SHELL_RC"
    fi

    # Add DIRENV_LOG_FORMAT to reduce verbosity
    if ! grep -q "DIRENV_LOG_FORMAT" "$SHELL_RC" 2>/dev/null; then
        echo 'export DIRENV_LOG_FORMAT=""' >> "$SHELL_RC"
    fi

    echo "✅ direnv and nix-direnv installed"
fi

# Add SSH agent alias
read -p "🔑 Add ssh-agent alias to shell config? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    SHELL_RC="$HOME/.bashrc"
    if [ -n "$ZSH_VERSION" ]; then
        SHELL_RC="$HOME/.zshrc"
    fi

    if ! grep -q "ssh-start" "$SHELL_RC" 2>/dev/null; then
        cat >> "$SHELL_RC" << 'EOF'

# SSH agent alias
alias ssh-start='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'
EOF
        echo "✅ Added ssh-start alias to $SHELL_RC"
        echo "   Use 'ssh-start' to start ssh-agent and add your key"
    else
        echo "✅ ssh-start alias already exists"
    fi
fi

echo ""
echo "✨ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Restart your shell or run: source ~/.bashrc"
echo "2. Test with: nix develop github:voidtek/nixpkgs#devops"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "3. Use 'ssh-start' to start ssh-agent"
fi
echo ""
