# Module in Magento
## Directory structure of one Modules:
<pre><code class="language-tree">&lt;MyModule_repo_root&gt;
├── Api
├── Block
├── Controller
├── Console
├── etc
├── Helper
├── i18n
├── Model
├── Plugin
├── Test
├── view
├── composer.json
├── LICENSE.txt
└── ...
</code></pre>

## Test suite:
<pre><code class="language-tree">&lt;extension_repo_root&gt;
├── &lt;Module1&gt;
│   ├── ...
│   ├── Test
│   │   ├── Unit
│   │   ├── Integration
│   │   └── Mftf
│   │       ├── TestSuite
│   │       └── composer.json
│   └── ...
├── &lt;Module2&gt;
├── &lt;Module1SampleData&gt;
└── &lt;Module2SampleData&gt;
</code></pre>

## [Extension lifecycle](https://devdocs.magento.com/guides/v2.3/extension-dev-guide/prepare/lifecycle.html)
- Schema initialization stages
    - InstallSchema
    - UpgradeSchema
    - Recurring
- Data initialization
    - InstallData
    - UpgradeData
    - RecurringData
- Database interface
    
  Use the ModuleDataSetupInterface when you need to do database manipulations. If your installation or upgrade logic spans multiple classes, pass this resource on to other classes that need to modify the database.
    
- Module version

  Use the ModuleContextInterface to get the current module version and execute logic based on the version.
  
- Uninstall
- Disabled modules

## Command line   
1. Install
    - Command line: `php bin/magento setup:install`
2. Setup upgrade to install or upgrade module
    - Command line: `php bin/magento setup:upgrade`
    
## Information
- Folder in framework: `/setup/src/Magento/Setup/Console/Command/UpgradeCommand.php` in function `execute`
- File `InstallSchema.php` in every module.
    ```php
    class \VendorName\ModuleName\Setup\InstallSchema implements \Magento\Framework\Setup\InstallSchemaInterface
    {
        /**
         * {@inheritdoc}
         */
        public function install(SchemaSetupInterface $setup, ModuleContextInterface $context)
        {
            //Install schema logic
        }
    }
    ```
- Magento will `$installer->installSchema();` and `$installer->installDataFixtures();`. `$installer` as object of class `/setup/src/Magento/Setup/Model/Installer.php`. In this class, it will call `$this->handleDBSchemaData($setup, 'schema');`. Magento will get all module in code which stored in server. With once module, magento will call `$upgrader = $this->getSchemaDataHandler($moduleName, $upgradeType);` will return object of one of class in extension lifecycle 

    1. InstallSchema
    2. UpgradeSchema
    3. Recurring
    4. InstallData
    5. UpgradeData
    6. RecurringData
    
    Object return will call function `install()` if module is first install, else will call function `upgrade()`  of interface of every object. Example: `\InstallSchemaInterface::install()` or `\UpgradeDataInterface::upgrade()`
