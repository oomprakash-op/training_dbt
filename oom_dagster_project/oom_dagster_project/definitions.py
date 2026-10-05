from dagster import Definitions
from dagster_dbt import DbtCliResource
from .assets import training1_dbt_assets
from .project import training1_project
from .schedules import schedules

defs = Definitions(
    assets=[training1_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=training1_project),
    },
)