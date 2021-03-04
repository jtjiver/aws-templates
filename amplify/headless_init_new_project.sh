#!/bin/bash
set -e
IFS='|'

REACTCONFIG="{\
\"SourceDir\":\"src\",\
\"DistributionDir\":\"build\",\
\"BuildCommand\":\"npm run build\",\
\"StartCommand\":\"npm start\"\
}"
AWSCLOUDFORMATIONCONFIG="{\
\"configLevel\":\"project\",\
\"useProfile\":true,\
\"profileName\":\"aws-amplify\"\
}"
AMPLIFY="{\
\"projectName\":\"nextamplified-headless\",\
\"envName\":\"dev\",\
\"defaultEditor\":\"code\"\
}"
FRONTEND="{\
\"frontend\":\"javascript\",\
\"framework\":\"react\",\
\"config\":$REACTCONFIG\
}"
PROVIDERS="{\
\"awscloudformation\":$AWSCLOUDFORMATIONCONFIG\
}"

amplify init \
--amplify $AMPLIFY \
--frontend $FRONTEND \
--providers $PROVIDERS \
--yes
