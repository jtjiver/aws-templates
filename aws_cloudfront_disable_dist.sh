id=E1XV7YCPCOYNCW

tmpfile=$(mktemp /tmp/script.XXXXXX)
tmpfile2=$(mktemp /tmp/script.XXXXXX)
aws cloudfront get-distribution-config --id $id | \
  jq .DistributionConfig.Enabled=false > $tmpfile
  jq -r .DistributionConfig $tmpfile > $tmpfile2
aws cloudfront update-distribution --id $id \
  --if-match $(jq .ETag $tmpfile -r) \
  --distribution-config file://$tmpfile2
rm $tmpfile $tmpfile2
