# isucon-aws-terraform

# これはなに？

ISUCON環境をAWS EC2へ構築するためのTerraformモジュール郡です。

# 詳細と利用方法を記載した記事ページ

https://qiita.com/momotaro98/items/24cec11fc050c014057f

# 設定する必要がある項目

## EC2へのSSH用Key生成とPublic Keyの設定

専用鍵がなければ以下のようにして鍵を生成する。

```
ssh-keygen -t rsa -b 4096 -C "isucon key" -f isucon_id_rsa
```

公開鍵を`isucon_id_rsa.pub`の名前で以下の場所に置く。

```
modules/credential/isucon_id_rsa.pub
```

terraformで構築後、以下のような設定でEC2へSSHできる。

`~/.ssh/config`

```
Host isucon-practice-ec2
  HostName your_EC2_public_name
  Port 22
  User ubuntu
  IdentityFile ~/.ssh/isucon_id_rsa
  IdentitiesOnly yes
  RequestTTY yes
  RemoteCommand sudo su - isucon
```

login

```
ssh isucon-practice-ec2
isucon@ip-10-2-0-25:~$ ls
bench  env.sh  go  local  webapp
```

## パラメータ設定

### ファイルの優先順位

1. `terraform.tfvars.json` => .gitignoreしていますので、利用者がファイルをローカル上で作成する必要があります。
2. `variables.tf`          => デフォルト値を指定しています。

### パラメータ設定マニュアル

[こちら](https://qiita.com/momotaro98/items/24cec11fc050c014057f#%E6%A7%8B%E7%AF%89%E3%82%A4%E3%83%B3%E3%83%95%E3%83%A9%E3%83%91%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B)を参照してください。

# Run terraform

初回

```
terraform init
```

初回以降

```
terraform plan
```

```
terraform apply
```

```
terraform destroy
```

ファイルフォーマット、バリデーション

```
terraform fmt -recursive
terraform validate
```
