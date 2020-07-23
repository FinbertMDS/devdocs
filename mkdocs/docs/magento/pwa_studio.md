# Overview
This is our developer docs about Magento PWA Studio. Our docs includes:

## Install
1. Install Magento 2.3 Without Sample Data
    - [Install on Docker](https://github.com/FinbertMDS/docker-magento-multiple/tree/pwa-studio)
    - [Document Magento](https://magento-research.github.io/pwa-studio/venia-pwa-concept/install-sample-data/)
        - Prerequisites: Php 7.1, Magento without sample data then Install Venia sample data.
        - Install:
            1. Copy or create the deploy script: packages/venia-concept/deployVeniaSampleData.sh
            2. Execute the deploy script
                ```bash
                bash deployVeniaSampleData.sh
                ```
            3. Install the sample data modules
                ```bash
                bin/magento setup:upgrade
                ```

2. [Install PWA Studio](https://github.com/FinbertMDS/docker-magento-multiple/blob/develop/bin/install_pwa_studio_client.sh)
    
## Research
1. Scripts
- Some library: 
    1. [multispinner](https://www.npmjs.com/package/multispinner)
    
        node-multispinner is a Node.js module for managing multiple progress indicators (spinners) in CLI apps.
        
    2. [chokidar](https://www.npmjs.com/package/chokidar)
        
        Listen change in every file to restart Webpack Dev Server.
        
    3. [portscanner](https://www.npmjs.com/package/portscanner)
    
        Portscanner can check a port, or range of ports, for 'open' or 'closed' statuses.
        
        Random a port when start Webpack Dev Server.
        
2. PWA Buildpack
3. Peregrine
4. UPWARD
5. Venia concept

## Note
1. Install PWA by docker on Server with RAM 2GB, you can be error . [Solution is enable the swap](https://getcomposer.org/doc/articles/troubleshooting.md#proc-open-fork-failed-errors)
    ```bash
    /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
    /sbin/mkswap /var/swap.1
    /sbin/swapon /var/swap.1
    ```
2. [Document sharing Magento 2.3 - PWA Studio](https://docs.google.com/presentation/d/1nYpelociXXah3v3Ko0o8YnuWxMENDRvh9ztfSUOOrrw/edit?usp=sharing)