# use vi mode 
bindkey -v

# vulkan exports
export VULKAN_SDK="$HOME/code/external/vulkan_sdk/1.3.261.1/macOS"
export PATH="$VULKAN_SDK/bin:$PATH"
export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH"
export VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"

# ls
alias ls="ls -ga"

# vscode
alias code="/Applications/Visual\ Studio\ code.app/Contents/Resources/app/bin/code"

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# 
# # fly
# export FLYCTL_INSTALL="/Users/samsal/.fly"
# export PATH="$FLYCTL_INSTALL/bin:$PATH"
