# Note about Git

## Github
1. Use Github Personal access token
- [Create and use token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
- Use token to commit: 
    ```text
    repo-url=https://[username]:[token]@github.com/[username]/[repository_name].git
    ```
    ```bash
    git remote set-url origin [repo-url]
    ```
- Note:
    - If token exist in any file when commit, GitHub can observe, remove token and then notice to email that "This token removed".
    - Should keep token in env and add it to remote.
