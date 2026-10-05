from dagster import Definitions
from dagster_dbt import DbtCliResource

from .assets import training1_dbt_assets
from .project import training1_project
from .schedules import schedules

from .jobs import (
    staging_job,
    dimensions_facts_job,
    marts_job,
)

defs = Definitions(
    assets=[training1_dbt_assets],
    jobs=[
        staging_job,
        dimensions_facts_job,
        marts_job,
    ],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(
            project_dir=training1_project,
        ),
    },
)