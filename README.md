
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

terraformで構築後、以下のようにまたは`.ssh/config`を修正しアクセスする。

```
ssh -i path/isucon_id_rsa ubuntu@public-domain
```

## var file 変数

### ファイルの優先順位

1. `terraform.tfvars.json` => .gitignoreしている。 利用者がファイルをローカル上で作成する必要がある。
2. `variables.tf`          => デフォルト値を指定している。

`terraform.tfvars.json` の例

```
{
  "access_cidr_blocks": "256.256.256.256/32"
}
```

### 各変数の説明

* `standalone_ami_owner`  => AMIの所有者。standalone_ami_nameと組み合わせる。
* `standalone_ami_name`   => AMI所有者が持つAMI名。先頭文字として検索し重複するAMIがある場合は最新が利用される。 `terraform.tfvars.json` で指定しておく必要あり。
* `access_cidr_blocks`    => EC2に指定するセキュリティグループのInboundで許可するIPアドレス。自身のインターネット環境でのグローバルIPなど指定してください。
* `ec2_members`           => 立ち上げるEC2を指定。現状はすべてのEC2は上記の同じAMIがあてられる。

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

```
terraform fmt
terraform validate
```