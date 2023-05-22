# Terraform with Comments — Reusable Workflow

> **TL;DR**</br>
> This reusable workflow enables you to plan and apply changes to Terraform configurations with pull request (PR) comments: for a CLI-like experience on the web. It's powered by GitHub Actions to maximize compatibility and minimize maintenance for DIY deployments.

- [Overview](#overview)
- [Usage](#usage)
  - [Workflow](#workflow)
  - [Terraform](#terraform)
  - [Examples](#examples)
  - [Security](#security)
- [Roadmap](#roadmap)
- [Contributions](#contributions)
- [License](#license)

## Overview

- [Terraform][terraform] is a platform-agnostic tool for managing cloud and on-prem resources by provisioning infrastructure as code (IaC).
  - It enables you to define resources in human-readable configuration files that can be version controlled and shared for consistent state management.
- [GitHub Actions][github_actions] is a continuous integration and continuous deployment (CI/CD) platform that enables you to automate your project's pipelines with custom workflows.
  - This repository hosts a reusable workflow that parses PR comments and actions Terraform commands accordingly in a remote environment.
- Suited for Platform/DevOps engineers who want to empower their teams to self-service Terraform without the overhead of self-hosting runners, containers or VMs like [Atlantis][atlantis].
  - [Environment deployment protection rules][deployment_rules] mitigate the risk of erroneous changes along with standardized approval requirements.
  - Each PR and associated workflow run holds a complete log of infrastructure changes for ease of collaborative debugging as well as audit compliance.

## Usage

### Workflow

Copy the following snippet into ".github/workflows/terraform.yml" file in your repository, replacing the contents of `env_vars` with environment variables required by your Terraform configuration (e.g., `AWS` credentials or `TF_VAR` variables).

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

- The `@main` suffix can be replaced with a specific release tag/SHA to pin your workflow to that version: hardening your CI/CD pipeline security against supply chain attacks.
- The optional `env_vars` input lets you pass in environment variables as key-value pairs while masking sensitive values from logs.
  - Each entry must be on a new line and separated by an equals sign (`=`).

### Terraform

To run `terraform plan` in "stacks/sample_instance" directory, trigger the workflow by creating a PR comment in the format "-terraform=plan -chdir=stacks/sample_instance". The workflow will add a PR comment with the planned output for review.

To `terraform apply` these changes, edit/create a PR comment in the format "-terraform=apply -chdir=stacks/sample_instance". The following arguments are supported simultaneously, in any order:

- `auto-approve`: Flag to skip confirmation before applying the plan (e.g., `-auto-approve`).
- `backend-config`: Path to backend configuration file(s) (e.g., `-backend-config=stacks/backend.tfvars`).
- `destroy`: Flag to destroy resources managed by Terraform (e.g., `-destroy`).
- `parallelism`: Number of concurrent operations to run (e.g., `-parallelism=10`).
- `chdir`: Path to a directory containing Terraform configuration files (e.g., `-chdir=stacks/sample_instance`).
- `replace`: List of resource addresses to replace (e.g., `-replace=aws_instance.this,aws_instance.that`).
- `target`: List of resource addresses to target (e.g., `-target=aws_instance.this,aws_instance.that`).
- `var-file`: Path to variable file(s) (e.g., `-var-file=stacks/prod.tfvars`).
- `workspace`: Name of Terraform workspace to select (e.g., `-workspace=prod`).

### Examples

- [View PR](https://github.com/rdhar/terraform-with-comments/pull/19): Plan, apply and destroy multiple different Terraform configurations in bulk.

  ```bash
  # Plan multiple configurations
  -terraform=plan -chdir=stacks/sample_bucket -var-file=prod.tfvars
  -terraform=plan -chdir=stacks/sample_instance

  # Apply multiple configurations
  -terraform=apply -chdir=stacks/sample_bucket -var-file=prod.tfvars
  -terraform=apply -chdir=stacks/sample_instance

  # Plan destruction of multiple configurations
  -terraform=plan -destroy -chdir=stacks/sample_bucket -var-file=prod.tfvars
  -terraform=plan -destroy -chdir=stacks/sample_instance

  # Destroy multiple configurations
  -terraform=apply -destroy -chdir=stacks/sample_bucket -var-file=prod.tfvars
  -terraform=apply -destroy -chdir=stacks/sample_instance
  ```

- [View PR](https://github.com/rdhar/terraform-with-comments/pull/20): Plan and apply changes to a targeted resource, then destroy it without confirmation.

  ```bash
  # Plan changes to a targeted resource
  -terraform=plan -chdir=stacks/sample_instance -target=aws_instance.sample

  # Apply changes to a targeted resource
  -terraform=apply -chdir=stacks/sample_instance -target=aws_instance.sample

  # Destroy targeted resource without confirmation
  -terraform=apply -destroy -chdir=stacks/sample_instance -target=aws_instance.sample -auto-approve
  ```

### Security

Integrating security in your CI/CD pipeline is critical to practicing DevSecOps. This reusable workflow is designed to be secure by default, and it should be complemented with your own review to ensure it meets your (organization's) security requirements.

- All associated GitHub Actions used in this workflow are [pinned to a specific SHA][securing_github_actions] to prevent supply chain attacks from third-party upstream dependencies.
- Restrict changes to certain environments with [deployment protection rules][deployment_rules] so that approval is required from authorized users/teams before changes to the infrastructure can be applied.

## Roadmap

- [x] Pass any number of environment variables to the workflow as secrets to prevent sensitive values from being exposed in logs.
  - [x] The `secrets.env_vars` input enables you to pass any number of secret key-value pairs into the workflow for use as masked environment variables.
  - [ ] GitHub Actions has no support for passing secrets from a prior job in the caller workflow to a reusable workflow. Tracked in [discussion#13082](https://github.com/orgs/community/discussions/13082), [discussion#17554](https://github.com/orgs/community/discussions/17554) and [discussion#26671](https://github.com/orgs/community/discussions/26671).
    - Workaround: If you need to pass dynamic secrets such as [OIDC][configure_oidc] tokens, feel free to clone and adapt the job/steps of the reusable workflow as required, since modifications are permitted by this project's permissive [license][license].
- [x] Parse PR comments as input commands to interface with Terraform CLI, returning outputs as bot comments.
  - [x] Opted for [dflook/terraform-github-actions](https://github.com/dflook/terraform-github-actions) instead of [hashicorp/setup-terraform](https://github.com/hashicorp/setup-terraform) due to improved rendering of Terraform output in comments and preferable handling of state configuration in workflow logs, despite slower overall processing times.
- [x] Use GitHub's [reusable workflow or composite actions][compare_reusable_workflow_with_composite_actions] for CI/CD of Terraform configuration changes.
  - [x] Opted for reusable workflow due to more granular control over workflow execution: from managing `concurrency` of queued workflows to running jobs in parallel with `strategy.matrix`.
  - [x] Adapted ternary operator-like behavior to enable if-else logic within GitHub Actions expressions. Tracked in [discussion#26738](https://github.com/orgs/community/discussions/26738) and [PR#24357](https://github.com/github/docs/pull/24357).
  - [ ] Unlike `pull_request`, `issue_comment` events can only be [triggered to run on the default branch][events_triggering_workflows], which complicates testing changes to the reusable workflow.

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

[atlantis]: https://www.runatlantis.io "Atlantis Terraform pull request automation."
[compare_reusable_workflow_with_composite_actions]: https://github.blog/2022-02-10-using-reusable-workflows-github-actions/ "Using reusable workflows vs. composite actions."
[configure_oidc]: https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-cloud-providers "Configuring OpenID Connect in cloud providers."
[deployment_rules]: https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#deployment-protection-rules "Configuring environment deployment protection rules."
[discussion]: https://github.com/rdhar/terraform-with-comments/discussions "Open a discussion."
[events_triggering_workflows]: https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows "Events that trigger workflows."
[github_actions]: https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions "Introduction to GitHub Actions."
[issue]: https://github.com/rdhar/terraform-with-comments/issues "Raise an issue."
[license]: LICENSE "Apache License 2.0."
[pull_request]: https://github.com/rdhar/terraform-with-comments/pulls "Create a pull request."
[rishav_dhar]: https://github.com/rdhar "Rishav Dhar's GitHub profile."
[securing_github_actions]: https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#using-third-party-actions "Security hardening for GitHub Actions."
[stargazer]: https://github.com/rdhar/terraform-with-comments/stargazers "Become a stargazer."
[terraform]: https://developer.hashicorp.com/terraform/intro "Introduction to Terraform."
