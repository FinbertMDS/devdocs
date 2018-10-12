## Installation
- Prepare install
    - Download [Selenium Standalone Server](https://www.seleniumhq.org/download/)
```bash
SELENIUM_STANDALONE_VERSION=3.4.0
wget -N http://selenium-release.storage.googleapis.com/$SELENIUM_SUBDIR/selenium-server-standalone-$SELENIUM_STANDALONE_VERSION.jar -P ~/
sudo mv -f ~/selenium-server-standalone-$SELENIUM_STANDALONE_VERSION.jar /usr/local/bin/selenium-server-standalone.jar
sudo chmod 777 /usr/local/bin/selenium-server-standalone.jar
java -jar /usr/local/bin/selenium-server-standalone.jar &> ~/selenium.log &
```
    - Download Chrome driver
```bash
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/
unzip ~/chromedriver_linux64.zip -d ~/
rm ~/chromedriver_linux64.zip
sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
sudo chmod 777 /usr/local/bin/chromedriver
```
- Installation
```bash
cd <magento2_root_dir>/dev/tests/functional/
composer install
```
- Adjust configuration
    - Edit phpunit.xml to configure PHPUnit: <magento2_root_dir>/dev/tests/functional/phpunit.xml.dist
        ```text
        app_frontend_url
        app_backend_url
        ```
    - Edit config.xml to configure Functional Testing Framework: <magento2>/dev/tests/functional/etc/config.xml.dist
        ```xml
        <application>
            <reopenBrowser>testCase</reopenBrowser>
            <backendLogin>admin</backendLogin>
            <backendPassword>admin123</backendPassword>
            <appBackendUrl>http://127.0.0.1/ce223/admin/</appBackendUrl>
            <backendLoginUrl>admin/auth/login</backendLoginUrl>
        </application>
        <isolation>
            <resetUrlPath>dev/tests/functional/isolation.php</resetUrlPath>
            <testSuite>none</testSuite>
            <testCase>none</testCase>
            <test>none</test>
        </isolation>
        <install>
            <host>127.0.0.1</host>
            <user>root</user>
            <password>root</password>
            <dbName>magento_ce223</dbName>
            <baseUrl>http://127.0.0.1/ce223/</baseUrl>
            <backendName>admin</backendName>
        </install>
        <server>
            <item name="selenium" type="default" browser="Google Chrome" browserName="chrome" host="localhost" port="4444" seleniumServerRequestsTimeout="15" sessionStrategy="shared">
                <desiredCapabilities>
                    <platform>ANY</platform>
                </desiredCapabilities>
            </item>
        </server>
        ```
- Prepare Magento application
    - Change WYSIWYG settings
        1. Log in to the Magento Admin as an administrator.
        2. Follow Stores > Configuration > General > Content Management > WYSIWYG Options.
        3. Set Enable WYSIWYG Editor to Disabled Completely.
        4. Click Save Config.
    - Change security settings
        1. Follow Stores > Configuration > Advanced > Admin > Security.
        2. Set Admin Account Sharing to Yes.
        3. Set Add Secret Key to URLs to No.
    - Refresh page cache
    - Apache: Copy /dev/tests/functional/.htaccess.sample to /dev/tests/functional/.htaccess.
- Run generator
```bash
cd <magento2_root_dir>/dev/tests/functional/utils
php generate.php
```