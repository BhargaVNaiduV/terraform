# Listing files in the current directory
root in ~ on ☁️  (us-east-1) 
❯ ls
README.md

# Displaying AWS CLI version information
root in ~ on ☁️  (us-east-1) 
❯ aws --version
aws-cli/2.13.12 Python/3.11.4 Linux/5.4.0-1106-gcp exe/x86_64.ubuntu.22 prompt/off

# Initializing AWS CLI and showing the available commands
root in ~ on ☁️  (us-east-1) 
❯ aws 

...

# Exploring IAM (Identity and Access Management) commands
root in ~ on ☁️  (us-east-1) 
❯ aws iam 

...

# Requesting a list of available IAM commands
root in ~ on ☁️  (us-east-1) 
❯ aws iam 

...

# Trying to execute an IAM command without specifying the operation
root in ~ on ☁️  (us-east-1) 
❯ aws iam 

...

# Requesting a list of available IAM commands with a prompt
root in ~ on ☁️  (us-east-1) 
❯ aws iam 
Display all 161 possibilities? (y or n)

...

# Requesting a list of IAM commands again
root in ~ on ☁️  (us-east-1) 
❯ aws iam 

...

# Executing a specific IAM command - list users
root in ~ on ☁️  (us-east-1) 
❯ aws iam list-users

...

# Executing the same list users command with an invalid security token
root in ~ on ☁️  (us-east-1) 
❯ aws iam list-users

An error occurred (InvalidClientTokenId) when calling the ListUsers operation: The security token included in the request is invalid.

# Executing the same list users command with a custom endpoint
root in ~ on ☁️  (us-east-1) 
❯ aws --endpoint http://aws:4566 iam list-users

...

# Creating a new IAM user named 'mary' with a custom endpoint
root in ~ on ☁️  (us-east-1) 
❯ aws iam create-user --user-name mary --endpoint http://aws:4566

...

# Attaching the AdministratorAccess policy to the 'mary' user
root in ~ on ☁️  (us-east-1) 
❯ aws iam attach-user-policy --user-name mary --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --endpoint http://aws:4566

...

# Requesting IAM commands with a prompt again
root in ~ on ☁️  (us-east-1) 
❯ aws --

...

# Configuring AWS CLI settings interactively
root in ~ on ☁️  (us-east-1) 
❯ aws configure

...

# Attaching the AdministratorAccess policy to a group named 'project-sapphire-developers'
root in ~ on ☁️  (us-east-1) 
❯ aws iam attach-group-policy --group-name project-sapphire-developers --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

...

# Creating a new IAM group named 'project-sapphire-developers'
root in ~ on ☁️  (us-east-1) 
❯ aws iam create-group --group-name project-sapphire-developers --endpoint http://aws:4566

...

# Adding users 'jack' and 'jill' to the 'project-sapphire-developers' group
root in ~ on ☁️  (us-east-1) 
❯ aws iam add-user-to-group --user-name jack  --group-name project-sapphire-developers --endpoint http://aws:4566
❯ aws iam add-user-to-group --user-name jill  --group-name project-sapphire-developers --endpoint http://aws:4566

...

# Listing attached policies for user 'jack'
root in ~ on ☁️  (us-east-1) 
❯ aws --endpoint http://aws:4566 iam list-attached-user-policies --user-name jack

...

# Attaching the AmazonEC2FullAccess policy to the 'project-sapphire-developers' group
root in ~ on ☁️  (us-east-1) 
❯ aws --endpoint http://aws:4566 iam attach-group-policy --group-name project-sapphire-developers --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess

