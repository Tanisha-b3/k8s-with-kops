# Setup Cluster Subdomain in AWS Hosted Zone

## Create Hosted Zone

### Using AWS CLI

```sh
sudo apt install jq
ID=$(uuidgen) && aws route53 create-hosted-zone --name subdomain.example.com --caller-reference $ID | jq .DelegationSet.NameServers
```

> Notedown the Name servers

### Using AWS Console

1. Go to Route53
2. Click on `Hosted zones`
3. Click on `Create hosted zone`
4. Enter the domain name `subdomain.example.com`
5. Click on `Create`

> Notedown the Name servers

## Create DNS Record (Cloudflare)

1. Go to Cloudflare dashboard
2. Select your domain `example.com`
3. Go to `DNS` tab
4. Click on `Add record`
5. Select `NS` as type
6. Enter `subdomain` as name
7. Enter the name servers from the above step
8. Click on `Save`

## Verify DNS Record

```sh
dig +short NS subdomain.example.com
```

```outputs
dig +short ns awslab.mhosen.com
ns-507.awsdns-63.com.
ns-649.awsdns-17.net.
ns-1161.awsdns-17.org.
ns-1762.awsdns-28.co.uk.
```
