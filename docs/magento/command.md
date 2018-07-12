# Overview
This is our developer docs about [Command line Magento](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands.html):

## Command summary

|                                     Command                                    	| Description                                                                                                                                                                                                                                                                                                                                           	|
|:------------------------------------------------------------------------------:	|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| magento setup:cache:{enable|disable|clean|flush|status}                        	| Manages the cache                                                                                                                                                                                                                                                                                                                                     	|
| magento setup:indexer:{status|show-mode|set-mode|reindex|info}                 	| Manages the indexers                                                                                                                                                                                                                                                                                                                                  	|
| magento cron:run                                                               	| Runs Magento cron jobs                                                                                                                                                                                                                                                                                                                                	|
| magento setup:di:compile-multi-tenant                                          	| Use only if you have multiple independent Magento applications (in other words, one common Magento code base but more than one independent instance of the Magento application).Compiles all non-existent proxies and factories; and pre-compiles class definitions, inheritance information, and plugin definitions for multiple stores or websites. 	|
| magento setup:di:compile                                                       	| Use if you have one instance of the Magento application.Compiles all non-existent proxies and factories; and pre-compiles class definitions, inheritance information, and plugin definitions for one store and website.                                                                                                                               	|
| magento info:dependencies:{show-modules|show-modules-circular|show-framework}e 	| Module dependencies, circular dependencies, and Magento framework dependencies.                                                                                                                                                                                                                                                                       	|

## Commands
The following sections discuss the available commands.

- [Manage the cache](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-cache.html)
- [Manage the indexers](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-index.html)
- [Configure and run cron](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-cron.html)
- [Code compiler](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-compiler.html)
- [Set the Magento mode](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-mode.html)
- [URN highlighter](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-urn.html)
- [Dependency reports](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-depen.html)
- [Translation dictionaries and language packages](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-test.html)
- [Deploy static view files](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-static-view.html)
- [Create symlinks to LESS files](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-less-sass.html)
- [Run unit tests](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-test.html)
- [Convert layout XML files](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-layout-xml.html)
- [Generate data for performance testing](https://devdocs.magento.com/guides/v2.0/config-guide/cli/config-cli-subcommands-perf-data.html)