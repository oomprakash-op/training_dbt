from setuptools import find_packages, setup

setup(
    name="oom_dagster_project",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "dagster",
        "dagster-cloud",
        "dagster-dbt",
        "dbt-core>=1.12,<1.13",
        "dbt-bigquery>=1.12,<1.13",
    ],
    extras_require={
        "dev": [
            "dagster-webserver",
        ]
    },
)
