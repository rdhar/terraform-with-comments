# Terraform with Comments — Reusable Workflow

- [Overview](#overview)
- [Usage](#usage)
- [Contributions](#contributions)
- [License](#license)

> **TL;DR**</br>
> This reusable workflow enables you to plan and apply Terraform configurations with pull request (PR) comments for a CLI-like experience on the web. It's powered by GitHub Actions to maximize compatibility and minimize maintenance for DIY deployments.

## Overview

- [Terraform][terraform] is a platform-agnostic tool for managing cloud and on-prem resources by provisioning infrastructure as code (IaC).
  - It enables you to define resources in human-readable configuration files that can be version controlled and shared for consistent state management.
- [GitHub Actions][github_actions] is a continuous integration and continuous deployment (CI/CD) platform that enables you to automate your project's pipelines with custom workflows.
  - This repository hosts a reusable workflow that parses PR comments and actions Terraform commands accordingly in a remote environment.
- Suited for Platform/DevOps engineers who want to empower their teams to self-service Terraform without the overhead of self-hosting runners, containers or VMs.
  - [Environment protection rules][deployment_rules] mitigate the risk of erroneous changes along with standardized approval requirements.
  - Each PR and associated workflow run holds a complete log of infrastructure changes for ease of collaborative debugging as well as audit compliance.

## Usage

Copy the snippet below to ".github/workflows/terraform.yml" in your repository, amending the contents of "env_vars" as needed by your Terraform configuration.

```yml
on:
  issue_comment:
    types: [created, edited]

jobs:
  terraform:
    uses: rdhar/terraform-with-comments/.github/workflows/terraform.yml@main
    secrets:
      env_vars: |
        AWS_ACCESS_KEY_ID=${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY=${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

## Contributions

All forms of contribution are very welcome and deeply appreciated in promoting open source software.

- Please [create a PR][pull_request] to contribute changes you'd like to see.
- Please [raise an issue][issue] to discuss proposed changes or report unexpected behavior.
- Please [open a discussion][discussion] to share ideas about where you'd like to see this project go.
- Please [consider becoming a stargazer][stargazer] if you find this project useful.

## License

- This project is licensed under the permissive [Apache License 2.0][license].
- All works herein are my own and shared of my own volition.
- Copyright 2023 [Rishav Dhar][rishav_dhar] — All wrongs reserved.

[deployment_rules]: https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#deployment-protection-rules
[discussion]: https://github.com/rdhar/terraform-with-comments/discussions "Open a discussion."
[github_actions]: https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions "Introduction to GitHub Actions."
[issue]: https://github.com/rdhar/terraform-with-comments/issues "Raise an issue."
[license]: LICENSE "Apache License 2.0."
[pull_request]: https://github.com/rdhar/terraform-with-comments/pulls "Create a pull request."
[rishav_dhar]: https://github.com/rdhar "Rishav Dhar's GitHub profile."
[stargazer]: https://github.com/rdhar/terraform-with-comments/stargazers "Become a stargazer."
[terraform]: https://developer.hashicorp.com/terraform/intro "Introduction to Terraform."
