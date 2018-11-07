# Overview
This is our developer docs about Config domain for server.

## Buy domain
- Register domain free: https://www.freenom.com

## Config domain
- Add 2 record in DNS Management

    | Name | Type | TTL | Target      |
    |------|------|-----|-------------|
    |      | A    | 300 | 45.77.42.74 |
    | www  | A    | 300 | 45.77.42.74 |
    
## Create server
- Create droplet at Digital Ocean

## Config server
- Add domain
- Config domain, add record in DNS Management

    | Type  | Hostname              | IS AN ALIAS OF     | TTL (seconds) |
    |-------|-----------------------|--------------------|---------------|
    | CNAME | www.developer-test.ml | developer-test.ml. | 43200         |