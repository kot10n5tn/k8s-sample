##################################################
# Init local
##################################################
LOCAL_DIR="overlays/local"
TEMPLATE_DIR="overlays/local-template"
mkdir -p $LOCAL_DIR
cp -n $TEMPLATE_DIR/* $LOCAL_DIR/

##################################################
# Service options
##################################################
# Common options
ENV_NAME=local
DEBUG=true
DB_LOG_MODE=true

## DB
DB_MASTER_HOST=db.middleware.svc.cluster.local
DB_MASTER_USER=hoge
DB_MASTER_PASSWORD=moge
DB_SLAVE_HOST=db.middleware.svc.cluster.local
DB_SLAVE_USER=hoge
DB_SLAVE_PASSWORD=moge

## AWS SESSION (**do not commit credential**)
AWS_REGION=$AWS_REGION
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN
### If not set aws session, set dummy data.
if [ -z "$AWS_REGION" ]; then
  AWS_REGION=ap-northeast-1
fi
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  AWS_ACCESS_KEY_ID=dummy
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  AWS_SECRET_ACCESS_KEY=dummy
fi
if [ -z "$AWS_SESSION_TOKEN" ]; then
  AWS_SESSION_TOKEN=dummy
fi

# Service spcific options
## Diagnosis
WPSCAN_VULNDB_APIKEY=$WPSCAN_VULNDB_APIKEY

## Google
### Load form env
GOOGLE_SERVICE_ACCOUNT_JSON=$GOOGLE_SERVICE_ACCOUNT_JSON
GOOGLE_SERVICE_ACCOUNT_EMAIL=$GOOGLE_SERVICE_ACCOUNT_EMAIL
GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY=$GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY

### Set fixed value (dummy **dont commit credential**)
# GOOGLE_SERVICE_ACCOUNT_JSON='{"type": "service_account","project_id": "dummy","private_key_id":"dummy","private_key":"-----BEGIN PRIxxxx-----\nxxxx\n-----END PRIxxx-----\n","client_email":"dummy@dummy.iam.gserviceaccount.com","client_id": "xxx", "auth_uri":"https://accounts.google.com/o/oauth2/auth", "token_uri":"https://oauth2.googleapis.com/token", "auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs", "client_x509_cert_url":"https://www.googleapis.com/robot/v1/metadata/x509/dummy%40dummy.iam.gserviceaccount.com"}'
# GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY='-----BEGIN PRIxxx-----\\nxxx==\\n-----END PRIxxx-----'
# GOOGLE_SERVICE_ACCOUNT_EMAIL=dummy@dummy.iam.gserviceaccount.com

## Code
GITHUB_DEFAULT_TOKEN=your-token
DATA_KEY=12345678901234567890123456789012
LIMIT_REPOSITORY_SIZE_KB=300000
SEPERATE_SCAN_DAYS=360
GITLEAKS_SCAN_THREADS=1
SCAN_ON_MEMORY=false

##################################################
# Make properties for configmap
##################################################
## Init
PROPERTIES_DIR="$LOCAL_DIR/properties"
mkdir -p $PROPERTIES_DIR
rm -f $PROPERTIES_DIR/*

## Core
### Alert
PROPERTIES_PATH="$PROPERTIES_DIR/core_alert.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_LOG_MODE=$DB_LOG_MODE" >> "$PROPERTIES_PATH"

### Finding
PROPERTIES_PATH="$PROPERTIES_DIR/core_finding.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_LOG_MODE=$DB_LOG_MODE" >> "$PROPERTIES_PATH"

### IAM
PROPERTIES_PATH="$PROPERTIES_DIR/core_iam.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_LOG_MODE=$DB_LOG_MODE" >> "$PROPERTIES_PATH"

### Project
PROPERTIES_PATH="$PROPERTIES_DIR/core_project.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_LOG_MODE=$DB_LOG_MODE" >> "$PROPERTIES_PATH"

### Report
PROPERTIES_PATH="$PROPERTIES_DIR/core_report.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_LOG_MODE=$DB_LOG_MODE" >> "$PROPERTIES_PATH"

## Gateway
### Gateway
PROPERTIES_PATH="$PROPERTIES_DIR/gateway_gateway.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"

## AWS
### AWS
PROPERTIES_PATH="$PROPERTIES_DIR/aws_aws.properties"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### AccessAnalyzer
PROPERTIES_PATH="$PROPERTIES_DIR/aws_accessanalyzer.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### AdminChecker
PROPERTIES_PATH="$PROPERTIES_DIR/aws_adminchecker.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### CloudSploit
PROPERTIES_PATH="$PROPERTIES_DIR/aws_cloudsploit.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### GuardDuty
PROPERTIES_PATH="$PROPERTIES_DIR/aws_guardduty.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### Portscan
PROPERTIES_PATH="$PROPERTIES_DIR/aws_portscan.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### Activity
PROPERTIES_PATH="$PROPERTIES_DIR/aws_activity.properties"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

## Code
### Code
PROPERTIES_PATH="$PROPERTIES_DIR/code_code.properties"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
echo "DATA_KEY=$DATA_KEY" >> "$PROPERTIES_PATH"

### Gitleaks
PROPERTIES_PATH="$PROPERTIES_DIR/code_gitleaks.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
echo "DATA_KEY=$DATA_KEY" >> "$PROPERTIES_PATH"
echo "LIMIT_REPOSITORY_SIZE_KB=$LIMIT_REPOSITORY_SIZE_KB" >> "$PROPERTIES_PATH"
echo "SEPERATE_SCAN_DAYS=$SEPERATE_SCAN_DAYS" >> "$PROPERTIES_PATH"
echo "GITLEAKS_SCAN_THREADS=$GITLEAKS_SCAN_THREADS" >> "$PROPERTIES_PATH"
echo "SCAN_ON_MEMORY=$SCAN_ON_MEMORY" >> "$PROPERTIES_PATH"

## Diagnosis
### Diagnosis
PROPERTIES_PATH="$PROPERTIES_DIR/diagnosis_diagnosis.properties"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### WPScan
PROPERTIES_PATH="$PROPERTIES_DIR/diagnosis_wpscan.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
echo "WPSCAN_VULNDB_APIKEY=$WPSCAN_VULNDB_APIKEY" >> "$PROPERTIES_PATH"

### Portscan
PROPERTIES_PATH="$PROPERTIES_DIR/diagnosis_portscan.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### ApplicationScan
PROPERTIES_PATH="$PROPERTIES_DIR/diagnosis_applicationscan.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

## Google
### Google
PROPERTIES_PATH="$PROPERTIES_DIR/google_google.properties"
echo "PORT=$GOOGLE_GOOGLE_PORT" >> "$PROPERTIES_PATH"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
echo "GOOGLE_SERVICE_ACCOUNT_JSON=${GOOGLE_SERVICE_ACCOUNT_JSON//\\\n/\\\n}" >> "$PROPERTIES_PATH"

### Asset
PROPERTIES_PATH="$PROPERTIES_DIR/google_asset.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
echo "GOOGLE_CREDENTIAL_PATH=$GOOGLE_CREDENTIAL_PATH" >> "$PROPERTIES_PATH"
echo "GOOGLE_SERVICE_ACCOUNT_JSON=${GOOGLE_SERVICE_ACCOUNT_JSON//\\\n/\\\n}" >> "$PROPERTIES_PATH"

### CloudSploit
PROPERTIES_PATH="$PROPERTIES_DIR/google_cloudsploit.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
echo "GOOGLE_SERVICE_ACCOUNT_EMAIL=$GOOGLE_SERVICE_ACCOUNT_EMAIL" >> "$PROPERTIES_PATH"
echo "GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY=$GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY" >> "$PROPERTIES_PATH"

### PortScan
PROPERTIES_PATH="$PROPERTIES_DIR/google_portscan.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
echo "GOOGLE_SERVICE_ACCOUNT_JSON=${GOOGLE_SERVICE_ACCOUNT_JSON//\\\n/\\\n}" >> "$PROPERTIES_PATH"

### SCC
PROPERTIES_PATH="$PROPERTIES_DIR/google_scc.properties"
echo "DEBUG=$DEBUG" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
echo "GOOGLE_SERVICE_ACCOUNT_JSON=${GOOGLE_SERVICE_ACCOUNT_JSON//\\\n/\\\n}" >> "$PROPERTIES_PATH"

## OSINT
### OSINT
PROPERTIES_PATH="$PROPERTIES_DIR/osint_osint.properties"
echo "DB_MASTER_HOST=$DB_MASTER_HOST" >> "$PROPERTIES_PATH"
echo "DB_MASTER_USER=$DB_MASTER_USER" >> "$PROPERTIES_PATH"
echo "DB_MASTER_PASSWORD=$DB_MASTER_PASSWORD" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_HOST=$DB_SLAVE_HOST" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_USER=$DB_SLAVE_USER" >> "$PROPERTIES_PATH"
echo "DB_SLAVE_PASSWORD=$DB_SLAVE_PASSWORD" >> "$PROPERTIES_PATH"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"

### SubDomain
PROPERTIES_PATH="$PROPERTIES_DIR/osint_subdomain.properties"
echo "AWS_REGION=$AWS_REGION" >> "$PROPERTIES_PATH"
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$PROPERTIES_PATH"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$PROPERTIES_PATH"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> "$PROPERTIES_PATH"
