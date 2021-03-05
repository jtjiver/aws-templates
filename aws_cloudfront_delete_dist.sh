id=E1XV7YCPCOYNCW

aws cloudfront delete-distribution --id $id --if-match \
  $(aws cloudfront get-distribution-config --id $id | jq .ETag -r)
