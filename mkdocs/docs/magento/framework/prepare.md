# Module in Magento
## Module file structure:
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

### Common directories
Following are some common module directories:

- Block: contains PHP view classes as part of Model View Controller(MVC) vertical implementation of module logic.
- Controller: contains PHP controller classes as part of MVC vertical implementation of module logic.
- etc: contains configuration files; in particular, module.xml, which is required.
- Model: contains PHP model classes as part of MVC vertical implementation of module logic.
- Setup: contains classes for module database structure and data setup which are invoked when installing or upgrading.
### Additional directories
Additional folders can be added for configuration and other ancillary functions for items like plugin-ins, localization, and layout files.

- Api: contains any PHP classes exposed to the API .
- Console: contains CLI commands. For more info, see [Add CLI commands](https://devdocs.magento.com/guides/v2.3/extension-dev-guide/cli-cmds/cli-add.html).
- Cron: contains cron job definitions.
- Helper: contains aggregated functionality.
- i18n: contains localization files.
- Observer: contains files for executing commands from the listener.
- Plugin: contains any needed [plug-ins](https://devdocs.magento.com/guides/v2.3/extension-dev-guide/plugins.html).
- UI: contains data generation files.
- view: contains view files, including static view files, design templates, email templates, and layout files.

## Theme file structure
A typical theme file structure can look like the following:

<pre><code class="language-tree">
├── composer.json
├── etc
│   └── view.xml
├── i18n
│   └── en_US.csv
├── LICENSE_AFL.txt
├── LICENSE.txt
├── media
│   └── preview.jpg
├── registration.php
└── web
    ├── css
    │   ├── email.less
    │   ├── print.less
    │   ├── source
    │   │   ├── _actions-toolbar.less
    │   │   ├── _breadcrumbs.less
    │   │   ├── _buttons.less
    │   │   ├── components
    │   │   │   └── _modals_extend.less
    │   │   ├── _icons.less
    │   │   ├── _layout.less
    │   │   ├── _theme.less
    │   │   ├── _tooltips.less
    │   │   ├── _typography.less
    │   │   └── _variables.less
    │   ├── _styles.less
    │   ├── styles-l.less
    │   └── styles-m.less
    ├── images
    │   └── logo.svg
    └── js
        ├── navigation-menu.js
        ├── responsive.js
        └── theme.js
</code></pre>

### Common directories
Typical theme directories are:

- etc: Contains configuration files such as the view.xml file which contains image configurations for all images and thumbnails.
- i18n: Translation dictionaries, if any.
- media: Theme preview images (screen capture of your theme) can be put in here.
- web: Optional directory that contains static files organized into the following subdirectories:

    - css/source: Contains a theme’s less configuration files that invoke mixins for global elements from the Magento UI library, and the theme.less file that overrides the default variables values.
    - css/source/lib: Contains view files that override the UI library files stored in lib/web/css/source/lib.
    - fonts: The folder to place the different fonts for your theme.
    - images: Static images folder.
    - js: The folder for your JavaScript files.
For more details on the theme folder structure, see [Magento theme structure](https://devdocs.magento.com/guides/v2.3/frontend-dev-guide/themes/theme-structure.html).

## Language package file structure
A typical directory structure for three language packages follows:

<pre><code class="language-tree">
├── de_DE
│   ├── composer.json
│   ├── language.xml
│   ├── LICENSE_AFL.txt
│   ├── LICENSE.txt
│   └── registration.php
├── en_US
│   ├── composer.json
│   ├── language.xml
│   ├── LICENSE_AFL.txt
│   ├── LICENSE.txt
│   └── registration.php
├── pt_BR
│   ├── composer.json
│   ├── language.xml
│   ├── LICENSE_AFL.txt
│   ├── LICENSE.txt
│   └── registration.php
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
    
## More information Setup module on Magento
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
