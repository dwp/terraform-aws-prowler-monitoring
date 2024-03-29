package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"

	"path/filepath"

	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
)

// Terratest functions for testing the ses notifcation module
func TestProwler(t *testing.T) {
	t.Parallel()

	// AWS Region set as eu-west-1 as standard.
	awsRegion := "eu-west-1"

	// set up variables for other module variables so assertions may be made on them later

	// Terraform plan.out File Path
	exampleFolder := test_structure.CopyTerraformFolderToTemp(t, "../..", "example/")
	planFilePath := filepath.Join(exampleFolder, "plan.out")


	terraformOptionsProwler := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../example",
		Upgrade:      true,

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{

		},

		//Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},

		// Configure a plan file path so we can introspect the plan and make assertions about it.
		PlanFilePath: planFilePath,
	})

	// website::tag::2::Run `terraform init`, `terraform plan`, and `terraform show` and fail the test if there are any errors
	plan := terraform.InitAndPlanAndShowWithStruct(t, terraformOptionsProwler)


	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptionsProwler)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptionsProwler)

	// website::tag::3::Use the go struct to introspect the plan values.
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "aws_cloudwatch_log_group.terratest_prowler_log_group")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "aws_sns_topic.terratest_prowler_sns_topic")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_1.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_2.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_3.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_4.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_5.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_6.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_7.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_8.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_9.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_10.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_11.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_12.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_13.aws_cloudwatch_log_metric_filter.metric_filter")
	terraform.RequirePlannedValuesMapKeyExists(t, plan, "module.terratest_prowler_monitoring.module.metric_filter_alarm_3_14.aws_cloudwatch_log_metric_filter.metric_filter")



	// Run `terraform output` to get the value of an output variable
	terratestloggroupID := terraform.Output(t, terraformOptionsProwler, "terratest_log_group_id")
	topicArn := terraform.Output(t, terraformOptionsProwler, "terratest_topic_arn")


	// Checks topic arn exists
	lengthOftopicArn := len(topicArn)
	assert.NotEqual(t, lengthOftopicArn, 0, "ARN Output MUST be populated")

	// Checks log group id exists
	lengthOfterratestloggroupID := len(terratestloggroupID)
	assert.NotEqual(t, lengthOfterratestloggroupID, 0, "ID Output MUST be populated")

}
