# Contributing

## Code style

There is a separate file with instructions on coding rules in this repository

[CODE_GUIDE](https://github.com/braille-systems/learnbraille_ios/blob/main/CODE_GUIDE.md)

## Git Workflow

Overall, these rules are inspired by the famous [successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)

Tag versioning is following classis [semantic versioning](https://semver.org/) with a clause that MINOR version may be missed and in that case it's meant to be 0. In example, v1.2 == v1.2.0

[**Jira** integration](https://braillesystem.atlassian.net/browse/BRAILLE) is also supported

### Main branch

`main` branch is protected, direct pushes are restricted. This branch is meant to always have production-ready version of application

Only admins are allowed to directly push to `main` (though it's not recommended anyway)

### Other branches

There are 4 allowed types of branches: `develop`, `feature`, `release` and `fix`

To contribute a new feature, create a new `feature` branch from `develop`

Branch type should be separated from name by a backslash and words in branch name should be separated by `-`, for example, `feature/new-panel` or `fix/blinking-screen`

There are two ways of naming a branch: using **Jira** integration and without it

Without integration, branch name should follow a pattern `<branch-type>/<branch-name>`, like 2 examples above

Naming using integration will be described below in **JIRA Integration** section

#### Develop

`develop` is the main branch for developers. It reflects the latest changes made and doesn't have strict rules

Generally, any branch (besides `main`) can be created from `develop` and any branch can be merged into `develop`

There also are no limitations to what can be pushed directly, but if you intend to contribute a major feature, it's very highly recommended to create a separate branch for it, as desrcibed in the next section

You can also change version directly in `develop` branch, but:

- After merging `feature` or `fix` branch, **PATCH** version should be incremented, for example, v1.2.3 -> v1.2.4
- If no `feature` or `fix` branch was merged, but version change is still required, increment build version, for example, v1.2.3+1 -> v1.2.3+2

#### Feature

`feature` branches are used to actually contribute new features

`feature` branch can only be created from `develop` and merged only into it

Merging `feature` branch requires creating **pull request** and at least 2 other developers to approve it

If you want version upgrade, increment **PATCH** version when merging `feature` branch into `develop`

#### Release

`release` branch should only be created from `develop` and merged simultaneously back into `develop` and `main` branches

This type of branches must be used to prepare a new **MINOR** or **MAJOR** release. For example, it can be used to increment app version or put updated screeenshots into docs/ folder

`release` branches have special naming convention: they always have to contain their release version in their name. For example, `release` branch for v1.3.0 release must be named `release/v1-3-0` or `release/v1-3`

#### Fix

`fix` branches could be created and merged from either `main`, `develop` or `feature`

It's not recommended to create `fix` branch from your own `feature`, but it's likely for other people to branch their `fix` from your `feature`

Merging `fix` also requires **pull request** and *(currently)* 2 other developers to approve it

If `fix` branch was created from `main`, it must be merged simultaneously into both `develop` and `main` branches. Merging `fix` into `main` must be followed by **PATCH** version upgrade

### Tags

Creating tags is only allowed in `main` branch

It's required to tag every release in `main` branch

**MAJOR** version changes should be approved by whole development team and must contain a lot of huge incompatible changes

**MINOR** version should be upgraded after every `feature` branch merge

**PATCH** version should be upgraded after every `fix` branch merge

### Commit rules

When creating commits, follow simple rules:

- Make commit messages short (less than 50 characters)

- Make commits atomic, every commit should contain only one logical change

- Use capital letter in the beginning of the line

- Commit message should be able to comlete a sentence like `If applied, this commit will <your message>`

- It's recommended to write down long text about your changes in **pull request** description, not in commit message

- If you still need to make a long description to your commit message, use *additional description* provided by git GUI clients or use a separating line inside `-m` message, if you use git from your terminal

- Use **JIRA Integration** rules described in the section below

Good commit example: `BRAILLE-X Fix blinking screen bug`

### JIRA Integration

This repository supports integration with **Jira Dashboard**

It's required to use integration when creating *commits* and *pull requests*, though it's not necessary to use it with branches

To *reference* a **JIRA** issue in your commit, just add issue key to it, for example, `BRAILLE-X Add new button in main menu`

The same rule applies to pull requests. Average PR title should look like: `BRAILLE-X (optional)<WIP>: Short message to describe overall changes`

Naming a branch with integration in mind, it must follow a pattern `<branch-type>/<jira-issue-key>-<branch-name>`, for example, `feature/BRAILLE-X-new-panel`

It's also possible to manipulate **JIRA** issues with *smart commits* and commands like `comment`, `time` and `transition`

Additional inforamtion on *smart commits* and *referencing* is available [here](https://support.atlassian.com/jira-software-cloud/docs/process-issues-with-smart-commits/) and [here](https://support.atlassian.com/jira-software-cloud/docs/reference-issues-in-your-development-work/)

### Pull Requests

Pull requests are processed as usual

To merge any branch into another, creating pull request is required

*Currently* any pull request requires two approvals from other developers
