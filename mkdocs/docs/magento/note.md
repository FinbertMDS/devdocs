# Note about Magento

1. [Libs for Magento](https://github.com/FinbertMagestore/devdocs/tree/develop/mkdocs/docs/magento/libs)

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
    - Trước khi làm kiểm tra xem site của khách hàng có bị chết không? Sau khi mình cài, lỗi phát hiện là trước hay sau khi mình cài vào site khách.
        1. Chạy các lệnh của Magento: 
        ```bash
        # remove code of Old Magestore Extension
        rm -rf app/code/Magestore/*
        # upload code of new Magestore Extension
        ```
        ```bash
        # view deploy mode
        php bin/magento deploy:mode:show
        ```
        ```bash
        # set deploy mode is developer and set permission before process
        php bin/magento deploy:mode:set developer
        find app/code lib var pub/static pub/media vendor -type d -exec chmod 775 {} \;
        find app/code lib var pub/static pub/media vendor -type f -exec chmod 664 {} \;
        find app/code lib var pub/static pub/media vendor app/etc \( -type d -or -type f \) -exec chmod g+w {} + && chmod o+rwx app/etc/env.php
        ```
        ```bash
        # process implement, upload my extension
        php bin/magento s:upgrade
        php bin/magento s:di:compile
        php bin/magento s:static-content:deploy
        php bin/magento indexer:reindex
        php bin/magento c:c
        ```
        ```bash
        # set back deploy mode production and set back permission
        php bin/magento deploy:mode:set production --skip-compilation
        php bin/magento s:static-content:deploy
        find app/code lib var pub/static pub/media vendor -type d -exec chmod 755 {} \;
        find app/code lib var pub/static pub/media vendor -type f -exec chmod 644 {} \;
        find app/code lib pub/static app/etc var/generation var/di var/view_preprocessed vendor \( -type d -or -type f \) -exec chmod g-w {} + && chmod o-rwx app/etc/env.php 
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
    
4. Reload config php.ini by some ways:
    1. Reload server: 
        ```bash
        sudo service apache2 restart
        ```
    2. Reload Php
        ```bash
        apachectl graceful
        ```