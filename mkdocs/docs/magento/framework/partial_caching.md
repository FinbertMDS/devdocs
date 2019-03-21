# Partial caching

Magento uses Zend_Cache to interact with the cache storage. However, Magento also has the Magento\Cache library for implementing Magento-specific caching.

## Information about caching
- [Partial caching](https://devdocs.magento.com/guides/v2.3/extension-dev-guide/cache/partial-caching.html)
    - [Create custom cache engines](https://devdocs.magento.com/guides/v2.3/extension-dev-guide/cache/partial-caching/database-caching.html)
        - Default Magento after install using cache on file: folder magento use to save info about cache in `var/cache` and `var/page_cache`. You can use Magento 2 database for caching.
        - Cached object are stored in the `cache` and `cache_tag`.
    - [Create a cache type](https://devdocs.magento.com/guides/v2.3/extension-dev-guide/cache/partial-caching/create-cache-type.html)
        - You can create new cache type. Load and save information which you need with this cache type.
        - Cache type can enable, disable, clear using Cache management page in the Magento Admin. 
    
## More information about caching
### Zend Cache
- Zend framework has 2 type of cache: Backend and Frontend. Detail more than about Zend Cache at [here](https://framework.zend.com/manual/1.12/en/zend.cache.html).
    - Cache backend is the "cache engine" : it can be file, memcached, etc.
    - [Cache frontend](http://framework.zend.com/manual/1.12/en/zend.cache.frontends.html) specify what kind of data will be stored in the cache.
    
    Caching in Zend Framework is operated by frontends while cache records are stored through backend adapters (File, Sqlite, Memcache...) through a flexible system of IDs and tags. Using those, it is easy to delete specific types of records afterwards (for example: "delete all cache records marked with a given tag").
    
    The core of the module (Zend_Cache_Core) is generic, flexible and configurable. Yet, for your specific needs there are cache frontends that extend Zend_Cache_Core for convenience: Output, File, Function and Class.
    
### Magento Partial Cache
- Some folder and file important in magento framework
    ```text
    vender/magento/framework/App/Cache
    vender/magento/framework/App/Cache.php
    vender/magento/framework/App/CacheInterface.php
    vender/magento/framework/Cache
    ```
- Folder cache in server magento
    ```text
    var/cache
    var/page_cache
    ```
- `Magento\Framework\App\CacheInterface.php` contains some function important about cache:
    - Load data from cache by id
        ```php
        public function load($identifier);
        ```
    - Save data to cache
        ```php
        public function save($data, $identifier, $tags = [], $lifeTime = null);
        ```
    - Remove cached data by identifier
        ```php
        public function remove($identifier);
        ```
    - Clean cached data by specific tag
        ```php
        public function clean($tags = []);
        ```
- Default Magento use [Cm_Cache_Backend_File](https://github.com/colinmollenhour/Cm_Cache_Backend_File) which much improved replacement for Zend_Cache_Backend_File - works great with Magento!
    
    Cached object saved in file with filename contain cache id, content of file contain metadatas and data.
    ```php
    $metadatas = array(
        'hash' => $hash,
        'mtime' => time(),
        'expire' => $this->_expireTime($this->getLifetime($specificLifetime)),
        'tags' => implode(',', $tags),
    );
    $res = $this->_filePutContents($file, serialize($metadatas)."\n".$data);
    $res = $res && $this->_updateIdsTags(array($id), $tags, 'merge');
    ```
    
    Tags saved in folder `var/cache/mage_tags`. File name is tag name, content is all cache id which linked to this tag. 
        
    Cached object data saved in file as string which serialized from data object. Example about load data from cache: `vendor/magento/framework/App/ObjectManager/ConfigLoader.php`.
    ```php
    $cacheId = $area . '::DiConfig';
    $data = $this->_cache->load($cacheId);
    
    if (!$data) {
        $data = $this->_getReader()->read($area);
        $this->_cache->save($this->getSerializer()->serialize($data), $cacheId);
    } else {
        $data = $this->getSerializer()->unserialize($data);
    }
        
    return $data;
    ``` 
    
    Declare cache id (cache id must is exclusively). Life cycle of get data are: load data from cache, if cache miss, get data and then save to cache. When save data to cache, can add parameter as tags or lifetime of cache. When cached data be changed, you must clean cache. after then when get data, cache miss and get new data and save this to cache.
    
    In Magento, you can clean cache by Cache management page in the Magento Admin or Magento command line.
    ```bash
    php bin/magento cache:flush
    ```
    ```bash
    php bin/magento cache:clean
    ```
     
     When declare cache id, you must follow some note:
        1. Cache Id must be exclusively (only)
        2. Cache Id should contain all parameters which can affect to data cached.