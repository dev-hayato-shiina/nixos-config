#!/usr/bin/env zsh

# バックアップ
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")
BACKUP_FILE="secrets/secrets.yaml.${TIMESTAMP}.bak"
cp secrets/secrets.yaml "$BACKUP_FILE"
echo "バックアップ作成: $BACKUP_FILE"

# ユーザー名入力
echo -n "ユーザー名を入力してください: "
read USERNAME

# パスワード入力（非表示）
echo -n "パスワードを入力してください: "
read -s PASSWORD
echo

# ハッシュ生成
HASHED=$(echo "$PASSWORD" | mkpasswd -m sha-512 --stdin)

if [[ -z "$HASHED" ]]; then
  echo "ハッシュの生成に失敗しました"
  exit 1
fi

# sops で自動追加
sudo SOPS_AGE_KEY_FILE=/var/lib/sops/age/keys.txt \
  sops --set "[\"${USERNAME}_hashed_password\"] \"${HASHED}\"" \
  secrets/secrets.yaml

if [[ $? -eq 0 ]]; then
  echo "追加完了: ${USERNAME}_hashed_password"
else
  echo "sops への書き込みに失敗しました"
  exit 1
fi
