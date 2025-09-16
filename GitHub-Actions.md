                                     Portfolio Deployment on AWS S3 with GitHub Actions

This document describes how to use GitHub Actions to automate the deployment of a static portfolio site to an Amazon S3 bucket.

# What are GitHub Actions?
GitHub Actions is a platform for automating, customizing and executing software development workflows directly inside a GitHub repository. According to the official documentation, GitHub Actions lets you combine individual actions to perform tasks (e.g., running tests, building artifacts, or deploying code) and orchestrate them in a completely customized workflow. Because workflows live in your repository as YAML files, they are version‑controlled alongside your code and automatically run on events such as pushes, pull requests or scheduled intervals.

# How DevOps engineers help developers with GitHub Actions?
In a typical organisation, DevOps engineers design, maintain and improve the pipelines that underpin the software delivery process. With GitHub Actions they can:

•	Create reusable workflows that build, test and deploy code whenever a developer pushes changes, reducing manual effort and ensuring consistent quality.

•	Manage secrets and credentials, such as AWS access keys, via GitHub’s encrypted secrets mechanism so that sensitive data is never exposed in logs or code.

•	Integrate infrastructure provisioning (e.g., creating S3 buckets or CloudFront distributions) into the pipeline, bridging the gap between application code and cloud resources.

•	Enforce standards by adding automated checks for code style, security scanning, or compliance before allowing mergers or deployments.

# Deployment architecture:
The high‑level architecture for this project is illustrated below. Source code (HTML/CSS/JS) is stored on GitHub. A GitHub Actions workflow triggers on pushes and synchronises the latest build to an S3 bucket. A CloudFront distribution (or S3 static website hosting) then serves the files to end users. The bucket and distribution are secured using IAM policies and bucket policies.

<img width="975" height="356" alt="image" src="https://github.com/user-attachments/assets/fc1f212c-a27b-46b5-a1b6-a19ff89aaa6f" />

# Step‑by‑step: deploying a portfolio site to S3

1. **Create an IAM user and policy** :
   1)	Sign into the AWS console and navigate to IAM.
   2)	Create a new IAM policy that grants minimal permissions for S3 deployment. A recommended policy allows the workflow to put, get, list and delete objects in your bucket:
  
     <img width="418" height="422" alt="image" src="https://github.com/user-attachments/assets/782272d2-b667-42b2-a042-80bff60a7e8d" />

   3)	Create a new IAM user with programmatic access and attach the policy from step 2) Save the Access Key ID and Secret Access Key—you will need them in GitHub.
  
2. **Set up your GitHub repository and secrets** :
   1)	Create or open a GitHub repository containing your portfolio site (e.g., HTML, CSS and JavaScript files).
   2)	Navigate to Settings → Secrets and variables → Actions in your repository and add the following secretsdev.to:
      a.	AWS_ACCESS_KEY_ID – the access key created in step 1.
     	
      b.	AWS_SECRET_ACCESS_KEY – the corresponding secret key.
   
      c.	S3_BUCKET_NAME – the name of your S3 bucket.
   
      d.	Optional: AWS_REGION if you want to specify a region other than the default.
   
Storing credentials as secrets ensures they are encrypted and not exposed in logs. DevOps engineers often manage these secrets centrally to avoid misconfiguration.

3. **Create the GitHub Actions workflow** :

Inside your repository, create a file at .github/workflows/deploy-to-s3.yml with the following content:

 <img width="739" height="734" alt="image" src="https://github.com/user-attachments/assets/8e529a52-e704-4f4c-a5b5-0e092566a09c" />

4. **Create the S3 bucket and enable static website hosting** :

   1)	In the AWS console, open the S3 service and create a bucket with a unique name (it must be globally unique).
      
   2)	Disable block public access for the bucket (but be mindful of security). This is required for website hosting.
      
   3)	Enable static website hosting in the bucket properties. Set the Index document to index.html or your entry point. When you save, AWS will display a public website  endpoint.
  
5. **Add a bucket policy for public read access** :
   To serve static files over HTTP, the bucket must allow public read of objects. Edit the Bucket Policy section and paste the following JSON, replacing your-bucket-name with your bucket’s name:

    <img width="742" height="304" alt="image" src="https://github.com/user-attachments/assets/e22987b4-4e1e-4399-816a-35c6b6fa70a9" />

    •	Version: the policy language version (2012 10 17 is commonly used).
   
    •	Statement: a list of rules. Each rule has a unique identifier (Sid), an Effect (Allow or Deny), a Principal (who has access), an Action (the permission) and a Resource (the objects to which the rule applies).
   
After saving the policy, your bucket will be publicly readable and your static website will be accessible at the endpoint shown in the S3 console.

6. Commit, push and test :

Commit the workflow file and push it to the main branch. In the Actions tab on GitHub, you should see the workflow run. Once it completes successfully, navigate to your S3 website URL and verify that your portfolio is live. If you encounter Access Denied errors, double‑check your IAM policy, bucket policy and secrets configuration.
















