resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/vpc-flow-logs/${var.name}"
  retention_in_days = var.retention_days
  kms_key_id        = var.kms_key_arn
  tags              = merge(var.tags, { Name = "/aws/vpc-flow-logs/${var.name}" })
}

data "aws_iam_policy_document" "assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = "${var.name}-vpc-flow-logs"
  assume_role_policy = data.aws_iam_policy_document.assume.json
  tags               = merge(var.tags, { Name = "${var.name}-vpc-flow-logs" })
}

data "aws_iam_policy_document" "write_logs" {
  statement {
    effect = "Allow"
    actions = ["logs:CreateLogStream", "logs:PutLogEvents", "logs:DescribeLogStreams"]
    resources = ["${aws_cloudwatch_log_group.this.arn}:*"]
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "vpc-flow-logs"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.write_logs.json
}

resource "aws_flow_log" "this" {
  log_destination      = aws_cloudwatch_log_group.this.arn
  log_destination_type = "cloud-watch-logs"
  iam_role_arn         = aws_iam_role.this.arn
  vpc_id               = var.vpc_id
  traffic_type         = var.traffic_type
  tags                 = merge(var.tags, { Name = "${var.name}-vpc-flow-logs" })
}
