# More information about Magento Framework
## Object Manager
- [Object Manager Devdocs](https://devdocs.magento.com/guides/v2.3/extension-dev-guide/object-manager.html)
- Object manager used to create new object instance and retrieve cached object instance all object in Magento at anywhere. View class `vendor/magento/framework/ObjectManagerInterface.php`.
    ```php
    interface ObjectManagerInterface
    {
        /**
         * Create new object instance
         *
         * @param string $type
         * @param array $arguments
         * @return mixed
         */
        public function create($type, array $arguments = []);
    
        /**
         * Retrieve cached object instance
         *
         * @param string $type
         * @return mixed
         */
        public function get($type);
    
        /**
         * Configure object manager
         *
         * @param array $configuration
         * @return void
         */
        public function configure(array $configuration);
    }
    ```
- Detail more than about Object manager, how Magento initiation Object manager.
    1. at `index.php`, 
        ```php
        $bootstrap = \Magento\Framework\App\Bootstrap::create(BP, $_SERVER);
        ```  
    2. at `vendor/magento/framework/App/Bootstrap.php`
        ```php
        public static function create($rootDir, array $initParams, ObjectManagerFactory $factory = null)
        {
            self::populateAutoloader($rootDir, $initParams);
            if ($factory === null) {
                $factory = self::createObjectManagerFactory($rootDir, $initParams);
            }
    
            return new self($factory, $rootDir, $initParams);
        }
        ...
        public static function createObjectManagerFactory($rootDir, array $initParams)
        {
            $dirList = self::createFilesystemDirectoryList($rootDir, $initParams);
            $driverPool = self::createFilesystemDriverPool($initParams);
            $configFilePool = self::createConfigFilePool();
            return new ObjectManagerFactory($dirList, $driverPool, $configFilePool);
        }
        ...
        public function __construct(ObjectManagerFactory $factory, $rootDir, array $initParams)
        {
            $this->factory = $factory;
            $this->rootDir = $rootDir;
            $this->server = $initParams;
            $this->objectManager = $this->factory->create($this->server);
        }
        ```
        Magento init ObjectManagerFactory, and from ObjectManagerFactory init ObjectManagerInterface.
        
    3. at `vendor/magento/framework/App/ObjectManagerFactory.php`
        ```php
        public function create(array $arguments)
        {
			/** @var EnvironmentFactory $envFactory */
            $envFactory = new $this->envFactoryClassName($relations, $definitions);
            /** @var EnvironmentInterface $env */
            $env = $envFactory->createEnvironment();
     
        	/** @var ConfigInterface $diConfig */
            $diConfig = $env->getDiConfig();
     
        	if ($env->getMode() != Environment\Compiled::MODE) {
                $configData = $this->_loadPrimaryConfig($this->directoryList, $this->driverPool, $argumentMapper, $appMode);
                if ($configData) {
                    $diConfig->extend($configData);
                }
            }
     
        	$this->factory = $env->getObjectManagerFactory($arguments);
            /** @var \Magento\Framework\ObjectManagerInterface $objectManager */
            $objectManager = new $this->_locatorClassName($this->factory, $diConfig, $sharedInstances);
            $this->factory->setObjectManager($objectManager);
        	$env->configureObjectManager($diConfig, $sharedInstances);
    
            return $objectManager;
        }
        ```
        Magento EnvironmentInterface distinguish mode: `Environment\Compiled::MODE` or else. At `vendor/magento/framework/App/EnvironmentFactory.php`
        ```php
        public function createEnvironment()
        {
            switch ($this->getMode()) {
                case Compiled::MODE:
                    return new Compiled($this);
                    break;
                default:
                    return new Developer($this);
            }
        }
        ```
        Mode Compiled after run command `php bin/magento setup:di:compile`, Magento will compile all config to one file php contain config at folder `generated/metadata` with every area: global, .... It usually map with Magento application mode as production. In Magento application mode as developer, folder `generated/metadata` will be deleted.
        
        In mode Compiled, `$diConfig = $env->getDiConfig();` will get config from file php after compiled. Else in mode Developer, `$configData = $this->_loadPrimaryConfig($this->directoryList, $this->driverPool, $argumentMapper, $appMode);` will help magento read config from file xml `app/etc/di.xml`.
        
        At line `$this->factory = $env->getObjectManagerFactory($arguments);`, Magento init factory from `$env` in class `AbstractEnvironment.php`. This factory used to init `$objectManager` and this object be set to this factory `$this->factory->setObjectManager($objectManager);`
    4. at `index.php`
        ```php
        $app = $bootstrap->createApplication(\Magento\Framework\App\Http::class);
		$bootstrap->run($app);
        ```
        In `Bootstrap.php`, object manager used to create application.
- Magento initiation ObjectManager follow design pattern Singleton
- Use object manger to create and retrieve object at anywhere in Magento. 
	```php
	$objectClassCreateNew = \Magento\Framework\App\ObjectManager::getInstance()
                ->create($typeClassName);
	```
	```php
	$objectClassRetrieve = \Magento\Framework\App\ObjectManager::getInstance()
                ->get($typeClassName);
	```
	```php
	private $_objectManager;
    
    public function __construct(
        \Magento\Framework\ObjectManagerInterface $objectmanager
    ){
        $this->_objectManager = $objectmanager;
    }

    public function getExample()
    {
        $customerSession = $this->_objectManager->create("Magento\Customer\Model\Session");
        if ($customerSession->isLoggedIn()) {
            $customerData = $customerSession->getCustomer()->getData();
            /*Your logic*/
        }
    }
	```
## Di.xml
## Magento 2 request flow overview
1. Some documents: 
    - https://www.atwix.com/magento-2/request-flow-overview/
    - https://nathanmcbride.io/magento2/Request-Flow-In-Magento-2