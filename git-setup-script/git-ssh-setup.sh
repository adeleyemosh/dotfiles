#!/usr/bin/env bash

# GitHub SSH Setup Script
# Author: Moshood Adeleye (adeleyemosh)
# Description: A guided script to set up GitHub SSH access and push to remote repository.

set -e

echo ""
echo "🔧 GITHUB SSH SETUP SCRIPT"
echo "---------------------------"
echo ""

# Get user email
read -rp "📧 Enter your GitHub email: " email
echo ""

# Generate SSH Key
echo "🔑 Generating a new SSH key using ed25519..."
ssh-keygen -t ed25519 -C "$email"

echo ""
echo "✅ SSH key generated at ~/.ssh/id_ed25519"
echo ""

# Show public key
echo "📋 Below is your public key (copy it):"
echo "--------------------------------------"
cat ~/.ssh/id_ed25519.pub
echo "--------------------------------------"
echo ""

# Open GitHub SSH key settings
read -rp "🌐 Press Enter to open GitHub SSH key settings in your browser..."
xdg-open https://github.com/settings/keys &>/dev/null || open https://github.com/settings/keys || echo "Please open https://github.com/settings/keys manually."

echo ""
echo "📌 Paste your public key and give it a name, then save."
read -rp "✅ Press Enter when you've added your SSH key to GitHub..."

# Test the connection
echo ""
echo "🔄 Testing SSH connection to GitHub..."
ssh -T git@github.com || true
echo ""

# Ask to switch remotes
read -rp "📝 Do you want to update your git remote from HTTPS to SSH? (y/n): " change_remote

if [[ "$change_remote" =~ ^[Yy]$ ]]; then
    current_url=$(git remote get-url origin)
    echo ""
    echo "🌐 Current remote URL: $current_url"
    echo ""

    # Extract username and repo from HTTPS URL
    if [[ "$current_url" =~ ^https://github\.com/([^/]+)/(.+)\.git$ ]]; then
        username="${BASH_REMATCH[1]}"
        repo="${BASH_REMATCH[2]}"
        ssh_url="git@github.com:${username}/${repo}.git"
        
        git remote set-url origin "$ssh_url"
        echo "🔁 Updated remote to: $ssh_url"
    else
        echo "⚠️ Could not parse your current remote URL. Please update it manually."
    fi
fi

# Final Push
echo ""
read -rp "📤 Do you want to push your current branch to origin now? (y/n): " do_push
if [[ "$do_push" =~ ^[Yy]$ ]]; then
    branch=$(git symbolic-ref --short HEAD)
    echo "📦 Pushing branch '$branch' to origin..."
    git push origin "$branch"
else
    echo "👍 All set! You can push anytime with: git push origin <branch>"
fi

echo ""
echo "🎉 Done! Your GitHub SSH setup is complete."
