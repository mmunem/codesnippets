accalias="$(aws iam list-account-aliases | jq ".AccountAliases[]" -r)"
for stack in `aws cloudformation list-stacks --stack-status-filter UPDATE_COMPLETE | jq ".StackSummaries[].StackName" -r`
do
	echo -e "\nDumping CF templates in stack:'$stack'..."
	echo `aws cloudformation get-template --stack-name $stack` > ${accalias}_CFStack_${stack}_templates.json"
done
