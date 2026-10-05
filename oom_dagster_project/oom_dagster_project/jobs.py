from dagster import job, op
from dagster_dbt import DbtCliResource

dbt = DbtCliResource(
    project_dir=r"C:\Users\Administrator\Desktop\Training_workspace\training1",
    profiles_dir=r"C:\Users\Administrator\.dbt",
)

@op
def run_src():
    dbt.cli([
        "build",
        "--select",
        "src"
    ]).wait()

@op
def run_dim_fct():
    dbt.cli([
        "build",
        "--select",
        "dim",
        "fct"
    ]).wait()

@op
def run_mv():
    dbt.cli([
        "build",
        "--select",
        "mv"
    ]).wait()

@job(resource_defs={"dbt": dbt})
def staging_job():
    run_src()

@job(resource_defs={"dbt": dbt})
def dimensions_facts_job():
    run_dim_fct()

@job(resource_defs={"dbt": dbt})
def marts_job():
    run_mv()