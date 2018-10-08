## Test creation
### Create the testing object - a fixture
Use a generateFixtureXml.php to create a new fixture.
```bash
cd <magento2_root_dir>/dev/tests/functional/utils
php -f generateFixtureXml.php -- --name synonym --entity_type search_synonyms --collection Magento\\Search\\Model\\ResourceModel\\Query\\Collection
```

| Parameter     | Value                                                    | Explanation                                                                                                                                                             |
|---------------|----------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| --name        | synonym                                                  | A name of the fixture. It can have any name. synonym seems to be logical.                                                                                               |
| --entity_type | search_synonyms                                          | Database table name where entity data is stored. You can track database input when you perform a manual testing. A new record will be created in a table that you need. |
| --collection  | Magento\\Search\\Model\\ResourceModel\\Query\\Collection | Collection to generate data sets. Synonyms are the entities of a Magento_Search module. A collection can always be found in model resources.                            |

As a result of previous commands, a brand new fixture can be found in the <magento2_root_dir>/dev/tests/functional/tests/app/Magento/Search/Test/Fixture directory.

https://devdocs.magento.com/guides/v2.2/mtf/create_test/create_new_test.html

Now we should change the fixture. Instead of store_id and website_id, we must use scope_id with the Magento\Search\Test\Fixture\Synonym\ScopeId data source class.
### Create the initial test case
From the test case topic we know about the structure, location and name of the test case. In this example it is named CreateSynonymEntityTest.php and stored in <magento2_root_dir>/dev/tests/functional/tests/app/Magento/Search/Test/TestCase.
We can code the initialization of these pages in the test using an __inject() method of the Magento\Mtf\TestCase\Injectable class. The pages will be created in Step 5. Also, we will use the fixture from the Step 2.
```php
<?php

namespace Magento\Search\Test\TestCase;

use Magento\Mtf\TestCase\Injectable;
use Magento\Search\Test\Fixture\Synonym;

/**
 * Steps:
 * 1. Log in to Admin.
 * 2. Open the Search Synonym page.
 * 3. Click the "New Synonym Group" button.
 * 4. Enter data according to a data set. For each variation, the synonyms must have unique identifiers.
 * 5. Click the "Save Synonym Group" button.
 * 6. Verify the synonym group saved successfully.
 */
class CreateSynonymEntityTest extends Injectable
{
    /**
     * Search Synonyms Index page.
     *
     * @var SynonymsIndex
     */
    private $synonymsIndex;

    /**
     * New Synonym Group page.
     *
     * @var SynonymsNew
     */
    private $synonymsNew;

    /**
     * Inject synonym pages.
     *
     * @param SynonymsIndex $synonymsIndex
     * @param SynonymsNew $synonymsNew
     * @return void
     */
    public function __inject(
        SynonymsIndex $synonymsIndex,
        SynonymsNew $synonymsNew
    ) {
        $this->synonymsIndex = $synonymsIndex;
        $this->synonymsNew = $synonymsNew;
    }

    /**
     * Create Synonym group test.
     *
     * @param Synonym $synonym
     * @return void
     */
    public function test(Synonym $synonym)
    {
        // Steps
    }
}
```
### Create the data set
Now we can add a data set with variations that cover cases in the test description: <magento2_root_dir>/dev/tests/functional/tests/app/Magento/Search/Test/TestCase/CreateSynonymEntityTest.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../../../../../vendor/magento/mtf/etc/variations.xsd">
    <testCase name="Magento\Search\Test\TestCase\CreateSynonymEntityTest" summary="Create Synonyms" ticketId="MAGETWO-23022016">
        <variation name="CreateCategoryEntityTestVariation1_all_websites_all_store_views" summary="Create synonym for all websites and all store views">
            <data name="synonym/data/synonyms" xsi:type="string">shoes %isolation%, foot wear %isolation%, men shoes %isolation%, women shoes %isolation%</data>
        </variation>
        <variation name="CreateCategoryEntityTestVariation2_main_website_all_store_views" summary="Create synonyms for main website and all store views">
            <data name="synonym/data/synonyms" xsi:type="string">shoes %isolation%, foot wear %isolation%, men shoes %isolation%, women shoes %isolation%</data>
            <data name="synonym/data/scope_id/dataset" xsi:type="string">all_store_views</data>
        </variation>
        <variation name="CreateCategoryEntityTestVariation3_main_website_default_store_view" summary="Create synonyms for main website and default store views">
            <data name="synonym/data/synonyms" xsi:type="string">shoes %isolation%, foot wear %isolation%, men shoes %isolation%, women shoes %isolation%</data>
            <data name="synonym/data/scope_id/dataset" xsi:type="string">default_store_view</data>
        </variation>
    </testCase>
</config>
```
### Create the pages
In Step 3, we added two pages to the test case class. Because both pages are in the Admin area, we should create them in the <magento2_root_dir>/dev/tests/functional/tests/app/Magento/Search/Test/Page/Adminhtml directory.

**SynonymsIndex.xml**
```xml
<?xml version="1.0" encoding="utf-8"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../../../../../../vendor/magento/mtf/etc/pages.xsd">
    <page name="SynonymsIndex" area="Adminhtml" mca="search/synonyms/index" module="Magento_Search">
        <block ... />
    </page>
</config>
```
To generate PHP classes for these pages enter and run in your terminal
```bash
php <magento2_root_dir>/dev/tests/functional/utils/generate.php
```
### Create the blocks
**How to code ‘Click the “New Synonym Group” button’**
Fortunately, you already have a block that contains a method to add a new entity in a grid: \Magento\Backend\Test\Block\GridPageActions.
```php
<?php
/**
 * Copyright © 2013-2017 Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */
namespace Magento\Backend\Test\Block;
/**
 * Class GridPageActions
 * Grid page actions block
 */
class GridPageActions extends PageActions
{
    /**
     * "Add New" button
     *
     * @var string
     */
    protected $addNewButton = '#add';
    /**
     * "Create Store" button selector
     *
     * @var string
     */
    protected $createStoreButton = '#add_group';
    /**
     * Click on "Add New" button
     *
     * @return void
     */
    public function addNew()
    {
        $this->_rootElement->find($this->addNewButton)->click();
    }
    /**
     * Click on "Create Store" button
     *
     * @return void
     */
    public function createStoreGroup()
    {
        $this->_rootElement->find($this->createStoreButton)->click();
    }
}
```
In HTML page, to locate the UI block that contains a button, we will use a .page-main-actions locator. Learn how to define a locator.

The SynonymsIndex.xml page must contain the following block to be able to run the method in a test case.
```xml
<?xml version="1.0" encoding="utf-8"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../../../../../../vendor/magento/mtf/etc/pages.xsd">
    <page name="SynonymsIndex" area="Adminhtml" mca="search/synonyms/index" module="Magento_Search">
        <block name="pageActionsBlock" class="Magento\Backend\Test\Block\GridPageActions" locator=".page-main-actions" strategy="css selector"/>
    </page>
</config>
```
### Form mapping
[Learn about form mapping..](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_block.html#mtf_block_mapping)
### Add the blocks to pages
To associate methods with pages, blocks must be added to pages.

**Search Synonym page**

A corresponding page object in a functional test is <magento2_root_dir>/dev/tests/functional/tests/app/Magento/Search/Test/Page/Adminhtml/SynonymsIndex.xml

The page with a block:
```xml
<?xml version="1.0" encoding="utf-8"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../../../../../../vendor/magento/mtf/etc/pages.xsd">
    <page name="SynonymsIndex" area="Adminhtml" mca="search/synonyms/index" module="Magento_Search">
        <block name="pageActionsBlock" class="Magento\Backend\Test\Block\GridPageActions" locator=".page-main-actions" strategy="css selector"/>
    </page>
</config>
```
To generate PHP classes for these pages, enter the following command from your terminal.
```bash
php <magento2_root_dir>/dev/tests/functional/utils/generate.php
```
### Define the test() method
```php
<?php

namespace Magento\Search\Test\TestCase;

use Magento\Mtf\TestCase\Injectable;
use Magento\Search\Test\Fixture\Synonym;
use Magento\Search\Test\Page\Adminhtml\SynonymsIndex;
use Magento\Search\Test\Page\Adminhtml\SynonymsNew;

/**
 * Steps:
 * 1. Log in to Admin.
 * 2. Open the Search Synonym page.
 * 3. Click the "New Synonym Group" button.
 * 4. Enter data according to a data set. For each variation, the synonyms must have unique identifiers.
 * 5. Click the "Save Synonym Group" button.
 * 6. Verify the synonym group saved successfully
 */
class CreateSynonymEntityTest extends Injectable
{
    /**
     * Search Synonyms Index page.
     *
     * @var SynonymsIndex
     */
    private $synonymsIndex;

    /**
     * New Synonym Group page.
     *
     * @var SynonymsNew
     */
    private $synonymsNew;

    /**
     * Inject pages.
     *
     * @param SynonymsIndex $synonymsIndex
     * @param SynonymsNew $synonymsNew
     * @return void
     */
    public function __inject(
        SynonymsIndex $synonymsIndex,
        SynonymsNew $synonymsNew
    ) {
        $this->synonymsIndex = $synonymsIndex;
        $this->synonymsNew = $synonymsNew;
    }

    /**
     * Create Synonym group test.
     *
     * @param Synonym $synonym
     * @return void
     */
    public function test(Synonym $synonym)
    {
        // Steps
        $this->synonymsIndex->open();
        $this->synonymsIndex->getPageActionsBlock()->addNew();
        $this->synonymsNew->getSynonymForm()->fill($synonym);
        $this->synonymsNew->getFormPageActions()->save();
    }
}
```
### Create the assertion
By making a simple change, we can create a constraint class that is needed \Magento\Search\Test\Constraint\AssertSynonymSuccessSaveMessage
```php
<?php
/**
 * Copyright © 2015 Magento. All rights reserved.
 * See COPYING.txt for license details.
 */

namespace Magento\Customer\Test\Constraint;

use Magento\Customer\Test\Page\Adminhtml\CustomerIndex;
use Magento\Mtf\Constraint\AbstractConstraint;

/**
 * Assertion to check Customer success save message.
 */
class AssertCustomerSuccessSaveMessage extends AbstractConstraint
{
    const SUCCESS_MESSAGE = 'You saved the customer.';

    /**
     * Assert that success message is displayed after customer save.
     *
     * @param CustomerIndex $pageCustomerIndex
     * @return void
     */
    public function processAssert(CustomerIndex $pageCustomerIndex)
    {
        $actualMessage = $pageCustomerIndex->getMessagesBlock()->getSuccessMessage();
        \PHPUnit_Framework_Assert::assertEquals(
            self::SUCCESS_MESSAGE,
            $actualMessage,
            'Wrong success message is displayed.'
            . "\nExpected: " . self::SUCCESS_MESSAGE
            . "\nActual: " . $actualMessage
        );
    }

    /**
     * Text success save message is displayed.
     *
     * @return string
     */
    public function toString()
    {
        return 'Assert that success message is displayed.';
    }
}
```
And now we can add <constraint> to each variation of a data set <magento2_root_dir>/dev/tests/functional/tests/app/Magento/Search/Test/TestCase/CreateSynonymEntityTest.xml:
```xml
<?xml version="1.0" encoding="utf-8"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../../../../../vendor/magento/mtf/etc/variations.xsd">
    <testCase name="Magento\Search\Test\TestCase\CreateSynonymEntityTest" summary="Create Synonyms" ticketId="MAGETWO-23022016">
        <variation name="CreateCategoryEntityTestVariation1_all_websites_all_store_views" summary="Create synonym for all websites and all store views">
            <data name="synonym/data/synonyms" xsi:type="string">shoes %isolation%, foot wear %isolation%, men shoes %isolation%, women shoes %isolation%</data>
            <constraint name="Magento\Search\Test\Constraint\AssertSynonymSuccessSaveMessage" />
        </variation>
        <variation name="CreateCategoryEntityTestVariation2_main_website_all_store_views" summary="Create synonyms for main website and all store views">
            <data name="synonym/data/synonyms" xsi:type="string">shoes %isolation%, foot wear %isolation%, men shoes %isolation%, women shoes %isolation%</data>
            <data name="synonym/data/scope_id/dataset" xsi:type="string">all_store_views</data>
            <constraint name="Magento\Search\Test\Constraint\AssertSynonymSuccessSaveMessage" />
        </variation>
        <variation name="CreateCategoryEntityTestVariation3_main_website_default_store_view" summary="Create synonyms for main website and default store views">
            <data name="synonym/data/synonyms" xsi:type="string">shoes %isolation%, foot wear %isolation%, men shoes %isolation%, women shoes %isolation%</data>
            <data name="synonym/data/scope_id/dataset" xsi:type="string">default_store_view</data>
            <constraint name="Magento\Search\Test\Constraint\AssertSynonymSuccessSaveMessage" />
        </variation>
    </testCase>
</config>
```