## Create a Test
Create a Test in Function Testing Framework. https://devdocs.magento.com/guides/v2.2/mtf/create_test.html
### Create a functional test
Create new module <magento2_root_dir>/dev/tests/functional/tests/app/Magento/<testing_module>.
### Test object
A test object is an object that you are going to test. Most of the test actions are performed under this object. The test object is represented by a [fixture](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_fixture.html). The fixture defines properties of an object.
### Test data
There are two types of test data:
- Data for the test, stored in a [data set](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_dataset.html).
- Preconditions:
    - Sample data that is stored in a [fixture repository](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_fixture-repo.html). In a data set, it is stored as a name of the fixture repository.
    - A sample test entity that can be created by a [handler](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_handler.html).
### Test flow
A test flow is a set of test steps that you want to perform under the test object to check required functionality. Test steps are defined in a [test case](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_testcase.html). Usually, a test step contains a set of actions. Each action is managed by a method defined in a [block](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_block.html). A [page](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_page.html) is a container for blocks. It stores selectors to identify blocks on an HTML page.
### Test assertions
A test assertion compares the test flow results with the expected ones. Test assertions are represented by [constraints](https://devdocs.magento.com/guides/v2.2/mtf/mtf_entities/mtf_constraint.html).