# zgenom - zsh plugin manager
# https://github.com/jandamm/zgenom

source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin updates every 7 days
zgenom autoupdate

# Generate static init script if not exist or reset requested
if ! zgenom saved; then
    echo "Creating zgenom init script..."

    # Load oh-my-zsh base
    zgenom ohmyzsh

    # oh-my-zsh plugins
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/docker

    # External plugins
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load zsh-users/zsh-completions

    # Theme: Powerlevel10k
    zgenom load romkatv/powerlevel10k powerlevel10k

    # Generate the init script
    zgenom save

    # Compile zsh files for faster loading
    zgenom compile "$HOME/.zshrc"
fi
