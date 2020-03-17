# Note about CircleCI
1. First times when add project to CircleCI, 
    - Commit code to Github with all config CircleCI `.circleci/config.yml`
    - Enter CircleCI, 
        ```
        Add Projects -> Set Up Project -> Start Building 
      
        -> Add Manually -> Start Building
        ```
    - CircleCI will auto first build from source code on Github.
2. If you setting CircleCI only run in once branch, you still must has `.circleci/config.yml` at every branches. And when, CircleCI will only trigger branch follow config.

```yaml
workflows:
  version: 2
  build:
    jobs:
      - build:
          filters:
            branches:
              only:
                - develop
```