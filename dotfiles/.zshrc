# use vi mode 
bindkey -v

# ls
alias ls="ls -ga"

# CMake
export PATH="/Applications/CMake.app/Contents/bin/:$PATH"

# vscode
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# Vulkan
export VULKAN_SDK="$HOME/external/VulkanSDK/1.3.283.0/macOS"
export PATH="$VULKAN_SDK/bin:$PATH"
export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH"
export VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"
