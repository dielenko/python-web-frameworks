# Decision statement to check the needed permissions
if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# Setting up Git with autocompletion
echo "Setting up Git with autocompletion..."
sudo curl \
    -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    -o /usr/share/bash-completion/completions/git

# Adding additional .bashrc configurations
echo "Extending the .bashrc to supply command line autocompletion of the essential tools..."
cat $PWD/.devcontainer/source-bashrc/.bashrc >> ~/.bashrc

echo "Done!"
