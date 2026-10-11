variable "dataplex_asset_iam_members" {
  description = <<EOT
Map of dataplex_asset_iam_members, attributes below
Required:
    - asset
    - dataplex_zone
    - lake
    - member
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    asset         = string
    dataplex_zone = string
    lake          = string
    member        = string
    role          = string
    location      = optional(string)
    project       = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

