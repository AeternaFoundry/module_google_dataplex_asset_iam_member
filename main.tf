resource "google_dataplex_asset_iam_member" "dataplex_asset_iam_members" {
  for_each = var.dataplex_asset_iam_members

  asset         = each.value.asset
  dataplex_zone = each.value.dataplex_zone
  lake          = each.value.lake
  member        = each.value.member
  role          = each.value.role
  location      = each.value.location
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

