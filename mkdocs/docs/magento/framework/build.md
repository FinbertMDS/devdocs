# Build extension
## [Di.xml file](https://devdocs.magento.com/guides/v2.3/extension-dev-guide/build/di-xml-file.html)

### Areas and application entry points
- Magento loads the configuration in the following stages:

    1. Initial (app/etc/di.xml)
    2. Global (<moduleDir>/etc/di.xml)
    3. Area-specific (<moduleDir>/etc/<area>/di.xml)

### Abstraction-implementation mappings
```xml
<!--  File: app/etc/di.xml -->
<config>
    <preference for="Magento\Core\Model\UrlInterface" type="Magento\Core\Model\Url" />
</config>
```
- Classes has relation: 
    ```
    Magento\Framework\ObjectManager\ObjectManager.php
    Magento\Framework\ObjectManager\Config.php
    ```
- Process: Magento read all file `di.xml`, save info about Preference in all file `di.xml` to `ObjectManager\Config::_preferences` and `ObjectManager\Config::_cache`.

When call `\Magento\Framework\ObjectManagerInterface::create($type)`, Magento call 
```php
public function create($type, array $arguments = [])
{
    return $this->_factory->create($this->_config->getPreference($type), $arguments);
}
```

Config get preference for once type, then init and return object with construct of preference. 
### Virtual types
