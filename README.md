# example dbt project

## Overview

This dbt project contains data transformations and models, specifically designed to perform data analysis and prepare datasets, views in BigQuery. 

## Getting Started

### Prerequisites

- Python
- dbt
- BigQuery access right or a [service account](https://docs.getdbt.com/docs/core/connect-data-platform/bigquery-setup#service-account-file) with appropriate access rights

### Installation

1. Clone this repository to your local machine.
2. Install dbt by following the [official installation guide](https://docs.getdbt.com/dbt-cli/installation) or [instructions below](#Using-virtual-environment).
3. Configure your database connection in the `profiles.yml` file. For enhanced security and best practices, it is strongly recommended to use a service account to manage database interactions within the dbt project.

#### Using virtual environment

Create virtual environment
```
python3 -m venv dbt-env-example
```

Activate virtual environment
```
source dbt-env-example/bin/activate
```

Upgrade pip
```
pip install --upgrade pip wheel setuptools
```

Install packages from the **requirements.txt** to the virtual environment
```
pip install -r requirements.txt
```

### Usage

#### dbt Run

To execute the dbt models and populate the data warehouse, run the following command:

```
dbt run 
```

The `dbt run` command triggers the data transformation process defined in the dbt models. It applies the transformations to the raw data, resulting in the creation and update of tables in the data warehouse.

#### dbt Run with Model Selection

You can selectively run specific models using the `dbt run --select model` command. Replace `model` with the name of the specific model you want to execute.

```
dbt run --select model
```

Using this command is helpful when you only need to update specific models instead of running the entire dbt project.

#### dbt Docs Generate

To generate documentation for the dbt project, run the following command:

```
dbt docs generate
```

The `dbt docs generate` command creates the documentation for the dbt project, including the model metadata, descriptions, and column lineage. This documentation is useful for understanding the data model and its components.

#### dbt Docs Serve

To view the generated documentation in your local browser, use the `dbt docs serve` command:

```
dbt docs serve
```

The `dbt docs serve` command starts a local web server, allowing you to browse the dbt project documentation in real-time. Access the documentation at `http://localhost:8080` or the URL specified in the terminal.

