
## 1. Error acquiring state lock :

```
Error: Error acquiring the state lock
│ 
│ Error message: resource temporarily unavailable
│ Lock Info:
│   ID:        bce3a789-4e2d-1716-cef2-d858b417c69b
│   Path:      terraform.tfstate
│   Operation: OperationTypeApply
│   Who:       madan@Jer0
│   Version:   1.15.6
│   Created:   2026-06-24 04:57:10.062200422 +0000 UTC
```

--> Solution: 
```
1. If there is genuine state lock due to being used by another then wait for the time period.
2. If not then Get the id and cmd:
terraform force-unlock -force bce3a789-4e2d-1716-cef2-d858b417c69b
3. OR, 