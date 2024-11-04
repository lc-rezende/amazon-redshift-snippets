copy schema.table
from 's3://bucket-redshift-workarea/input/subject=files/orders.csv'
iam_role 'arn:aws:iam::XXXXXXXXXXXX:role/rundeck_redshift_001'
ignoreheader 1
delimiter ',';