PROMPT="%F{10}[%f%F{1}%n%f%F{6}@%f%F{3}%m%f %F{2}%~%f%F{10}]%f%F{6} %% %f"

# ls alias
alias ls="ls -lGa"

# homebrew analylics
export HOMEBREW_NO_ANALYTICS=1

# use vi mode 
bindkey -v

# vulkan exports
export VULKAN_SDK="$HOME/Code/External/VulkanSDK/1.3.236.0/macOS"
export PATH="$VULKAN_SDK/bin:$PATH"
export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH"
export VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"

# vscode
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# cmake
export PATH="/Applications/CMake.app/Contents/bin/:$PATH"

# ninja, clangd
export PATH="$HOME/Code/Config/Bin/Darwin/:$PATH"

# HACK: clang-format
alias clang-format="$HOME/.vscode/extensions/ms-vscode.cpptools-1.13.9-darwin-x64/LLVM/bin/clang-format"
alias clang-tidy="$HOME/.vscode/extensions/ms-vscode.cpptools-1.13.9-darwin-x64/LLVM/bin/clang-tidy"

