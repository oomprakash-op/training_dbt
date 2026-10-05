from dagster import define_asset_job
from dagster_dbt import build_dbt_asset_selection

from .assets import training1_dbt_assets

staging_job = define_asset_job(
    name="staging_job",
    selection=build_dbt_asset_selection(
        [training1_dbt_assets], dbt_select="src"
    ),
)

dimensions_facts_job = define_asset_job(
    name="dimensions_facts_job",
    selection=build_dbt_asset_selection(
        [training1_dbt_assets], dbt_select="dim fct"
    ),
)

marts_job = define_asset_job(
    name="marts_job",
    selection=build_dbt_asset_selection(
        [training1_dbt_assets], dbt_select="mv"
    ),
)
