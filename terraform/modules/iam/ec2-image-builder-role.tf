locals {
  iam_instance_role_name    = "iamrole-${var.environment}-ec2-image-builder"
  iam_instance_profile_name = "iamprofile-${var.environment}-ec2-image-builder"
  iam_policy_name           = "iampolicy-${var.environment}-ec2-image-builder"
}

resource "aws_iam_role" "iam_role" {
  name                 = local.iam_instance_role_name
  assume_role_policy   = data.aws_iam_policy_document.iam_instance_trust.json
  
  tags = merge({
    "Name"     = local.iam_instance_role_name,
    },
  var.tags)
}

resource "aws_iam_instance_profile" "iam_profile" {
  name = local.iam_instance_profile_name
  role = aws_iam_role.iam_role.name

  tags = merge({
    "Name" = local.iam_instance_profile_name
    },
  var.tags)
}

resource "aws_iam_policy" "image_builder_policy" {
  name   = local.iam_policy_name
  path   = "/"
  policy = data.aws_iam_policy_document.image_builder.json

  tags = merge({
    "Name"       = local.iam_policy_name,
    },
  var.tags)
}

resource "aws_iam_role_policy_attachment" "attach_image_builder_policy" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.image_builder_policy.arn
}
