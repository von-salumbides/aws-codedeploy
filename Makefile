TF_DIR_CMD=-chdir=terraform/$(TF_DIR)
TF_ACCT_CMD=-var="aws_account=$(AWS_ACCOUNT_ID)"
.PHONY:
upgrade:
	terraform $(TF_DIR_CMD)  init -upgrade $(TF_ACCT_CMD)
init:
	terraform $(TF_DIR_CMD)  init $(TF_ACCT_CMD)
fmt:
	terraform $(TF_DIR_CMD)  fmt 
validate: fmt
	terraform $(TF_DIR_CMD)  validate 
workspace:
	terraform $(TF_DIR_CMD) workspace new $(ENVIRONMENT) >/dev/null 2>&1 || terraform $(TF_ACCT_CMD) workspace select $(ENVIRONMENT)
plan: workspace init validate 
	terraform $(TF_DIR_CMD) plan \
	$(TF_ACCT_CMD)
apply: workspace init validate 
	terraform $(TF_DIR_CMD) apply \
	-auto-approve \
	$(TF_ACCT_CMD)
destroy: workspace init validate 
	terraform $(TF_DIR_CMD) destroy \
	-auto-approve \
	$(TF_ACCT_CMD)