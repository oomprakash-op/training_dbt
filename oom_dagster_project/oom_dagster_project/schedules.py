from dagster import schedule

from .jobs import (
    staging_job,
    dimensions_facts_job,
    marts_job,
)

@schedule(
    job=staging_job,
    cron_schedule="0 8 * * *",
    execution_timezone="Asia/Kolkata",
)
def staging_daily_schedule(_context):
    return {}

@schedule(
    job=dimensions_facts_job,
    cron_schedule="0 9 * * *",
    execution_timezone="Asia/Kolkata",
)
def dimensions_facts_daily_schedule(_context):
    return {}

@schedule(
    job=marts_job,
    cron_schedule="0 10 * * *",
    execution_timezone="Asia/Kolkata",
)
def marts_daily_schedule(_context):
    return {}

schedules = [
    staging_daily_schedule,
    dimensions_facts_daily_schedule,
    marts_daily_schedule,
]