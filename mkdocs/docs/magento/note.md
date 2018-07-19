# Note about Magento

## Work in site online
- Permission: 
```text
trước khi work em nên check mode
php bin/magento deploy:mode:show
thường cài xong sẽ để default
nên chuyển qua developer
php bin/magento deploy:mode:set developer
để e sửa code em không phải chạy lệnh compile lại
vừa rồi site bị chuyển qua mode production
nếu chuyển qua mà em chạy setup upgrade
thì e p chạy thêm deploy content nữa
site khách thì để bảo đảm về mặt security thì e chỉ cần dùng 755 thôi
```

Config permission for folder and file in root magento dir

(Faster)
```bash
find . -type f -print0 | xargs -I % -0 chmod 644 %
find . -type d -print0 | xargs -I % -0 chmod 755 %
```
or
```bash
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```
## Debug
```php
var_dump($item->debug());
die();
```