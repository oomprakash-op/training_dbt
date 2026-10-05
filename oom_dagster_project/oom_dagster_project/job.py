from dagster import job, op
from dagster_dbt import DbtCliResource

dbt = DbtCliResource(
    project_dir=r"C:\Users\Administrator\Desktop\Training_workspace\training1",
    profiles_dir=r"C:\Users\Administrator\.dbt",
)

@op
def run_staging():
    dbt.cli([
        "build",
        "--select",
        "staging"
    ]).wait()

@op
def run_dimensions_facts():
    dbt.cli([
        "build",
        "--select",
        "dimensions facts"
    ]).wait()

@op
def run_marts():
    dbt.cli([
        "build",
        "--select",
        "marts"
    ]).wait()

@job(resource_defs={"dbt": dbt})
def staging_job():
    run_staging()

@job(resource_defs={"dbt": dbt})
def dimensions_facts_job():
    run_dimensions_facts()

@job(resource_defs={"dbt": dbt})
def marts_job():
    run_marts()