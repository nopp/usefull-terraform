# How to use

Working with terraform 0.12

## Edit module/vpc/variables.tf
  ```
  $ cd vpc
  $ terraforn plan
  $ terraform apply
  ```
## Output exemple
```
Apply complete! Resources: 24 added, 0 changed, 0 destroyed.

Outputs:

BE-ZA_id = subnet-06cef24909c044f9f
BE-ZB_id = subnet-0535ac5a7fa31e052
BE-ZC_id = subnet-0d8237054b5b77fa7
DB-ZA_id = subnet-08b090664e3f122d6
DB-ZC_id = subnet-02ede21cad916393a
FE-ZA_id = subnet-098daee0a0a4f7862
FE-ZB_id = subnet-0d4f08696d42a25d2
FE-ZC_id = subnet-0122f4c8714a86c1b
VPC_id = vpc-038cfc38c4552e291
```


;)
