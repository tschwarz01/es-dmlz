storage_accounts = {
  sa1 = {
    name               = "sa1"
    resource_group_key = "integration"
    # Account types are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2
    #account_kind = "BlobStorage"
    # Account Tier options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    account_tier = "Standard"
    #  Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
    account_replication_type = "LRS" # https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy
    containers = {
      files = {
        name = "files"
      }
    }
  }
}

storage_account_blobs = {
  script1 = {
    name                   = "installSHIRGateway.ps1"
    storage_account_key    = "sa1"
    storage_container_name = "files"
    source_uri             = "https://raw.githubusercontent.com/Azure/data-landing-zone/main/code/installSHIRGateway.ps1"
    parallelism            = 1
  }
}
