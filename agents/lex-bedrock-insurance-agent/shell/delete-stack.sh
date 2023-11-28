# cd generative-ai-amazon-bedrock-langchain-agent-example/shell/
# chmod u+x delete-stack.sh
# ./delete-stack.sh

echo "Emptying and Deleting S3 Bucket: $ARTIFACT_BUCKET_NAME"

aws s3 rm s3://${ARTIFACT_BUCKET_NAME} --recursive
aws s3 rb s3://${ARTIFACT_BUCKET_NAME}

echo "Emptying and Deleting S3 Bucket: $KB_BUCKET_NAME"

aws s3 rm s3://${KB_BUCKET_NAME} --recursive
aws s3 rb s3://${KB_BUCKET_NAME}

echo "Deleting Secrets Manager Secret: $GITHUB_TOKEN_SECRET_NAME"

aws secretsmanager delete-secret --secret-id $GITHUB_TOKEN_SECRET_NAME

echo "Deleting CloudFormation Stack: $STACK_NAME"

aws cloudformation delete-stack --stack-name $STACK_NAME
aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME