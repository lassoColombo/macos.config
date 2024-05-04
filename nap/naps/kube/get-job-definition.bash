kubectl -n sec-securityproject-production create job --from=cronjob/memcachinator-production una-tantum-siem-job -o yaml --dry-run=client > job.yaml
