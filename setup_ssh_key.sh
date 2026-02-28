#!/usr/bin/env zsh

SSH_DIR="$HOME/.ssh"

KEY_PATH_DEV_HAYATO_SHIINA="${SSH_DIR}/dev-hayato-shiina-key"
KEY_PATH_SHEENA_DEVELOP="${SSH_DIR}/sheena-develop-key"

BW_ITEM_ID_DEV_HAYATO_SHIINA="24d853e0-895b-4c88-835c-b3ff01315dc6"
BW_ITEM_ID_SHEENA_DEVELOP="92ade4ad-1253-4345-aaf6-b3ff0131ce58"

# Bitwarden セッション確認
if [[ -z "$BW_SESSION" ]]; then
  echo "Bitwarden にログインしてください"
  export BW_SESSION=$(bw unlock --raw)
  if [[ -z "$BW_SESSION" ]]; then
    echo "ログインに失敗しました"
    exit 1
  fi
fi

# 同期
echo "Bitwarden を同期中..."
bw sync --session "$BW_SESSION"

# === dev-hayato-shiina ===

# 秘密鍵取得
PRIVATE_KEY=$(bw get item "$BW_ITEM_ID_DEV_HAYATO_SHIINA" --session "$BW_SESSION" \
  | jq -r '.notes')

if [[ -z "$PRIVATE_KEY" || "$PRIVATE_KEY" == "null" ]]; then
  echo "秘密鍵の取得に失敗しました（dev-hayato-shiina）"
  exit 1
fi

# 配置
mkdir -p "$SSH_DIR"
echo "$PRIVATE_KEY" > "$KEY_PATH_DEV_HAYATO_SHIINA"
chmod 600 "$KEY_PATH_DEV_HAYATO_SHIINA"
chmod 700 "$SSH_DIR"
echo "秘密鍵を配置しました: $KEY_PATH_DEV_HAYATO_SHIINA"

# 動作確認
ssh -T dev-hayato-shiina

# =========================

# === sheena-develop ===

# 秘密鍵取得
PRIVATE_KEY=$(bw get item "$BW_ITEM_ID_SHEENA_DEVELOP" --session "$BW_SESSION" \
  | jq -r '.notes')

if [[ -z "$PRIVATE_KEY" || "$PRIVATE_KEY" == "null" ]]; then
  echo "秘密鍵の取得に失敗しました（sheena-develop）"
  exit 1
fi

# 配置
mkdir -p "$SSH_DIR"
echo "$PRIVATE_KEY" > "$KEY_PATH_SHEENA_DEVELOP"
chmod 600 "$KEY_PATH_SHEENA_DEVELOP"
chmod 700 "$SSH_DIR"
echo "秘密鍵を配置しました: $KEY_PATH_SHEENA_DEVELOP"

# 動作確認
ssh -T sheena-develop

# ======================
