from pathlib import Path

from dagster_dbt import DbtProject

DBT_PROJECT_DIR = Path(
    r"C:\Users\Administrator\Desktop\Training_workspace\training1"
)

DBT_PROFILES_DIR = Path(
    r"C:\Users\Administrator\.dbt"
)

training1_project = DbtProject(
    project_dir=DBT_PROJECT_DIR,
    profiles_dir=DBT_PROFILES_DIR,
)

training1_project.prepare_if_dev()
