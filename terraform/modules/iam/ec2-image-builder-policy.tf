data "aws_iam_policy_document" "image_builder" {
  statement {
    effect = "Allow"
    actions = [
      "imagebuilder:GetComponent",
    ]
    resources = ["arn:aws:imagebuilder:${var.aws_region}:${data.aws_caller_identity.current.account_id}:component/${lower(var.environment)}-*-runansibleforgoldenami/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:List",
      "s3:GetObject"
    ]
    resources = ["arn:aws:s3:::${var.s3_bucket_ec2_image_builder_logs}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject"
    ]
    resources = ["arn:aws:s3:::${var.s3_bucket_ec2_image_builder_logs}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:log-group:/aws/imagebuilder/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = var.kms_keys_to_authorize
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:Decrypt"
    ]
    resources = ["*"]
    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "kms:EncryptionContextKeys"

      values = [
        "aws:imagebuilder:arn"
      ]
    }

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "aws:CalledVia"

      values = [
        "imagebuilder.amazonaws.com"
      ]
    }
  }
}
