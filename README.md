# What?

Get a list of VMs from System Center Virtual Machine Manager (SCVMM) and export as a CSV file suited for Netbox.

# How?

1. Change the vars in the first lines to customize fields
2. Run.

A `$fileName` CSV file will be created at the current dir.

## Example output

First lines of CSV:

```
#TYPE System.Management.Automation.PSCustomObject
"name","status","cluster","role","tenant","platform","vcpus","memory","disk","comments"
"vm-cdl-d-11","Active","hv-cluster-01","Server","TI","Linux","2","8192","300",""
"vm-ruben-d-02","Active","hv-cluster-01","Server","","Linux","2","3276","50",""
"vm-opendata-d-01","Active","hv-cluster-01","Server","","Linux","2","8192","121",""
```
