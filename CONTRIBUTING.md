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

Branch type should be separated from name by a backslash, for example, `feature/new-panel` of `fix/blinking-screen`

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

This repository supports integration with **Jira Dashboard** and it's highly recommended to use it

To *reference* a **JIRA** issue in your commit, just add issue key to it, for example, `BRAILLE-1 Very import cnahges`

It's also possible to manipulate **JIRA** issues with *smart commits* and commands like `comment`, `time` and `transition`

Additional inforamtion on *smart commits* and *referencing* is available [here](https://support.atlassian.com/jira-software-cloud/docs/process-issues-with-smart-commits/) and [here](https://support.atlassian.com/jira-software-cloud/docs/reference-issues-in-your-development-work/)

### Pull Requests

Pull requests are processed as usual

To merge any branch into another, creating pull request is required

*Currently* any pull request requires two approvals from other developers
