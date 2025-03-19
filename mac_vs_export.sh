# 脚本用途：导出 VSCode 插件列表、settings.json 和 keybindings.json 到当前文件夹下
#
DEST="."

# 创建目标文件夹
echo "导出文件将保存到: $DEST"

# 导出 VSCode 扩展列表到 extensions.txt
echo "正在导出 VSCode 插件列表..."
if code --list-extensions > "$DEST/extensions.txt"; then
    echo "插件列表已保存到 $DEST/extensions.txt"
else
    echo "导出插件列表失败，请确保 'code' 命令已加入 PATH 中。"
    exit 1
fi

# VSCode 配置文件默认路径（macOS）
SETTINGS_PATH="$HOME/Library/Application Support/Code/User/settings.json"
KEYBINDINGS_PATH="$HOME/Library/Application Support/Code/User/keybindings.json"

# 复制 settings.json 文件
if [ -f "$SETTINGS_PATH" ]; then
    cp "$SETTINGS_PATH" "$DEST/"
    echo "settings.json 已复制到 $DEST"
else
    echo "未找到 settings.json 文件，检查路径: $SETTINGS_PATH"
fi

# 复制 keybindings.json 文件
if [ -f "$KEYBINDINGS_PATH" ]; then
    cp "$KEYBINDINGS_PATH" "$DEST/"
    echo "keybindings.json 已复制到 $DEST"
else
    echo "未找到 keybindings.json 文件，检查路径: $KEYBINDINGS_PATH"
fi

echo "导出完成。"
