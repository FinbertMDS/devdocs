# Note about Magento

1. [Some libs for Magento](https://github.com/FinbertMagestore/devdocs/tree/develop/mkdocs/docs/magento/libs)

    Example:
    
    - Bash script install magento 1, 2
    - File database export mysql
    
2. Work in site online
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
    
    - Config permission for folder and file in root magento dir
    
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
        
3. Debug
    ```php
    var_dump($item->debug());
    die();
    ```