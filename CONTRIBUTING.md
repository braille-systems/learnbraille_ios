# Contributing

## Git Workflow

Overall, these rules are a simplified version of the famous [successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)

Tag versioning is following classis [semantic versioning](https://semver.org/)

**Jira** integration is supported with [this project](https://braillesystem.atlassian.net/browse/BRAILLE)

### Main branch

`main` branch is protected, direct pushes are restricted

Only admins are allowed to directly push to `main` (though it's not recommended anyway)

### Other branches

To contribute a new feature, create a new branch from `main`

There are two allowed types of branches: `feature` and `fix`

Branch type should be separated from name by a backslash, for example, `feature/new-panel` or `fix/blinking-screen`

#### Feature

`feature` branches are used to actually contribute new features

`feature` branch could be created only from `main` and merged only into it

Merging `feature` branch requires creating **pull request** and at least 2 other developers to approve it

It's recommended to tag new **MINOR** version after merging `feature` branch into `main`

#### Fix

`fix` branches could be created and merged from both `main` or `feature`

It's not recommended to create `fix` branch from your own `feature`, but it's likely for other people to branch their `fix` from your `feature`

Merging `fix` also requires **pull request** and *(currently)* 2 other developers to approve it

After merging `fix` branch into `main`, it's highly recommended to tag new **PATCH** version

### Tags

Creating tags is only allowed in `main` branch

It's highly recommended to tag every release in `main` branch (mainly for CI reasons)

**MAJOR** version changes should be approved by whole development team and must contain a lot of huge incompatible changes

**MINOR** version could (and should) be upgraded after every `feature` branch merge

**PATCH** version could (and should) be upgraded after every `fix` branch merge

### Commit rules

When creating commits, follow simple rules:

- Make commit messages short (less than 50 characters)

- Make commits atomic, every commit should contain only one logical change

- Use capital letter in the beginning of the line

- Commit message should be able to comlete a sentence like `If applied, this commit will <your message>`

- It's recommended to write down long text about your changes in **pull request** description, not in commit message

- If you still need to make a long description to your commit message, use *additional description* provided by git GUI clients or use a separating line inside `-m` message, if you use git from your terminal

Good commit example: `Fix blinking screen bug`

### JIRA Integration

This repository supports integration with **Jira Dashboard**

It's required to use integration when creating *commits* and *pull requests*, though it's not necessary to use it with branches

To *reference* a **JIRA** issue in your commit, just add issue key to it, for example, `BRAILLE-X Very import cnahges`

The same rule applies to pull requests. Average PR title should look like: `BRAILLE-X (optional)<WIP>: Short message to describe overall changes`

It's also possible to manipulate **JIRA** issues with *smart commits* and commands like `comment`, `time` and `transition`

Additional inforamtion on *smart commits* and *referencing* is available [here](https://support.atlassian.com/jira-software-cloud/docs/process-issues-with-smart-commits/) and [here](https://support.atlassian.com/jira-software-cloud/docs/reference-issues-in-your-development-work/)

### Pull Requests

Pull requests are processed as usual

To merge any branch into another, creating pull request is required

*Currently* any pull request requires two approvals from other developers
