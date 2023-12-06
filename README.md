# Editor-WS_SW-setup
Software deploy and setup for regular JACoW Editor Workstation using Puppet's Bolt

## Getting started

There are a few pre-reqs to be able to execute the workflow prescribed. Install Puppet bolt first, the current shape of things requires that a machine running windows that is accessible over WinRM is available.

### Clone the repository

Setup an appropriate folder to host the project, after the repository is cloned we must install the required modules. The process is triggered by running

```
bolt module install
```

### Update the inventory file

Bolt needs to know where to connect, update the `inventory.yaml` with the corresponding IP, username and password. It should go without saying that the proposed values are to be changed before usage.

#### First run

The code is designed to be idempotent, meaning it can be executed as many times as desired - if the software detects something that is not in the desired state (drift) it will attempt to correct it. To run, execute this command:
```
bolt plan run profiles::swpkg_install --target=win
```
