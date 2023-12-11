# use vi mode 
bindkey -v

# vulkan exports
export VULKAN_SDK="$HOME/code/external/vulkan_sdk/1.3.261.1/macOS"
export PATH="$VULKAN_SDK/bin:$PATH"
export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH"
export VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"

# vscode
alias code="/Applications/Visual\ Studio\ code.app/Contents/Resources/app/bin/code"

# cmake
export PATH="/Applications/CMake.app/Contents/bin/:$PATH"

# ninja, clangd
export PATH="$HOME/code/config/bin/macos/universal:$PATH"

# ffmpeg
export PATH="$HOME/code/external/ffmpeg/bin:$PATH"

# HACK: clang-format
alias clang-format="$HOME/.vscode/extensions/ms-vscode.cpptools-1.18.5-darwin-x64/LLVM/bin/clang-format"
alias clang-tidy="$HOME/.vscode/extensions/ms-vscode.cpptools-1.18.5-darwin-x64/LLVM/bin/clang-tidy"

